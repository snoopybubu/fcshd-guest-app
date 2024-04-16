import 'package:fcshd_guest/constants/colors.dart';
import 'package:fcshd_guest/constants/sizes.dart';
import 'package:fcshd_guest/constants/text.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MenuOption extends StatelessWidget {
  IconData icons;
  bool darkMode;
  String url;
  String title;

  MenuOption(
      {required this.icons,
      required this.darkMode,
      required this.url,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewPage(url: url, title: title),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
              Radius.circular(GuestAppSizes.containerMdRadius)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
          color: darkMode
            ? GuestAppColors.widgetPrimaryDark
            : GuestAppColors.widgetPrimaryLight,
          // gradient: LinearGradient(
          //     colors: [Colors.amber[50]!, Colors.white],
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomRight),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: GuestAppSizes.containerMdPaddingX,
              vertical: GuestAppSizes.containerMdPaddingY),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icons,
                color: GuestAppColors.secondaryColor,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: darkMode
                          ? GuestAppColors.fontDark
                          : GuestAppColors.white,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonMenuOptions extends StatelessWidget {
  String url;
  String title;

  ButtonMenuOptions({required this.url, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WebViewPage(url: url, title: title),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 0, vertical: GuestAppSizes.paddingSmVertical),
          child: Row(
            children: [
              Text(GuestAppText.homeBannerBtnLbl,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(color: GuestAppColors.fontDark)),
              const Icon(Iconsax.arrow_right_3)
            ],
          ),
        ));
  }
}

class WebViewPage extends StatelessWidget {
  final String url;
  final String title;

  WebViewPage({required this.url, required this.title});

  @override
  Widget build(BuildContext context) {
    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(
            const PlatformWebViewControllerCreationParams());
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(url));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: GuestAppColors.primaryColor,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
