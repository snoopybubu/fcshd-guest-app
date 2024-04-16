import 'dart:io';

import 'package:fcshd_guest/constants/colors.dart';
import 'package:fcshd_guest/device/save_file_mobile.dart';
import 'package:flutter/material.dart';
import 'package:fcshd_guest/constants/images.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import '../constants/text.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:pdf/pdf.dart' as pw;
import 'package:pdf/widgets.dart' as pw;
import 'package:url_launcher/url_launcher.dart' as launcher;

class certificationBox extends StatelessWidget {
  final bool userCompleted;
  final bool darkMode;
  final String fullname;
  const certificationBox({required this.userCompleted, required this.darkMode,required this.fullname});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = "${now.year}-${now.month}-${now.day}";
    return Container(
      //for debugging purpose
      // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      decoration: BoxDecoration(
          color: darkMode
            ? GuestAppColors.darkGrey
            : GuestAppColors.lightGrey,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              GuestAppText.certTitle,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: darkMode?GuestAppColors.fontDark:GuestAppColors.primaryColor),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: const Text(
                          GuestAppText.certDesc,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 10,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      TextButton(
                          onPressed: userCompleted
                              ? () {
                                  _createCertificate(fullname, formattedDate);
                                }
                              : null,
                          child: Text(
                            GuestAppText.downloadCertBtn,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                    color: GuestAppColors.secondaryColor),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Image.asset(
                  userCompleted
                      ? GuestAppImages.certEnabled
                      : GuestAppImages.certDisabled,
                  height: 80,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _createCertificate(String fullname, String date) async {
  //Create a PDF document.
  final PdfDocument document = PdfDocument();
  document.pageSettings.orientation = PdfPageOrientation.landscape;
  document.pageSettings.margins.all = 0;
  //Add page to the PDF
  final PdfPage page = document.pages.add();
  //Get the page size
  final Size pageSize = page.getClientSize();
  //Draw image
  page.graphics.drawImage(
      PdfBitmap(await _readImageData(GuestAppImages.certificateLayout)),
      Rect.fromLTWH(0, 0, pageSize.width, pageSize.height));
  //Create font
  final PdfFont nameFont = PdfStandardFont(PdfFontFamily.helvetica, 22);
  final PdfFont controlFont = PdfStandardFont(PdfFontFamily.helvetica, 19);
  final PdfFont dateFont = PdfStandardFont(PdfFontFamily.helvetica, 16);

  const String course = "ICCSHD2024 Conference";
  double x = _calculateXPosition(fullname, nameFont, pageSize.width);
  page.graphics.drawString(fullname, nameFont,
      bounds: Rect.fromLTWH(x, 253, 0, 0),
      brush: PdfSolidBrush(PdfColor(20, 58, 86)));
  x = _calculateXPosition(course, controlFont, pageSize.width);
  page.graphics.drawString(course, controlFont,
      bounds: Rect.fromLTWH(x, 340, 0, 0),
      brush: PdfSolidBrush(PdfColor(20, 58, 86)));
  // final String dateText = 'on ' + _dateController.text;
  x = _calculateXPosition(date, dateFont, pageSize.width);
  page.graphics.drawString(date, dateFont,
      bounds: Rect.fromLTWH(x, 385, 0, 0),
      brush: PdfSolidBrush(PdfColor(20, 58, 86)));
  //Save and launch the document
  final List<int> bytes = await document.save();
  //Dispose the document.
  document.dispose();
  //Save and launch file.
  await saveAndLaunchFile(bytes, 'Certificate.pdf');
}

double _calculateXPosition(String text, PdfFont font, double pageWidth) {
  final Size textSize =
      font.measureString(text, layoutArea: Size(pageWidth, 0));
  return (pageWidth - textSize.width) / 2;
}

Future<List<int>> _readImageData(String name) async {
  final ByteData data = await rootBundle.load(name);
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}

Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
  final directory = await getApplicationSupportDirectory();

//Get directory path
  final path = directory.path;

//Create an empty file to write PDF data
  File file = File('$path/$fileName');

//Write PDF data
  await file.writeAsBytes(bytes, flush: true);

//Open the PDF document in mobile
  OpenFile.open('$path/$fileName');
}
