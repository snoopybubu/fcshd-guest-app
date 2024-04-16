

import 'package:fcshd_guest/constants/colors.dart';
import 'package:fcshd_guest/constants/sizes.dart';
import 'package:fcshd_guest/constants/text.dart';
import 'package:fcshd_guest/device/device_helper.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';


class notificationListScreen extends StatelessWidget {
  notificationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = GuestAppHelper.isDarkMode(context);
    final DatabaseReference notifDb =
        FirebaseDatabase.instance.ref().child('notification');
    return Scaffold(
        
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: GuestAppSizes.paddingHorizontal,
                  vertical: GuestAppSizes.paddingVertical),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  const SizedBox(height: GuestAppSizes.spaceBtwSections),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(GuestAppText.notificationList,
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(color:darkMode?GuestAppColors.fontDark:GuestAppColors.primaryColor)),
                      const SizedBox(height: GuestAppSizes.xs),
                      Text(
                        GuestAppText.notificationListSubtitle,
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(fontSize: 13),
                      ),
                      const SizedBox(
                        height: GuestAppSizes.spaceBtwSections,
                      ),
                      IntrinsicHeight(
                        child: Container(
                          height: 400,
                          child: FirebaseAnimatedList(
                            // controller: controller.scrollController,
                            query: notifDb.orderByChild('serverTimestamp'),
                            reverse: true,
                            itemBuilder: (BuildContext context,
                                DataSnapshot snapshot,
                                Animation<double> animation,
                                int index) {
                              Map notifications = snapshot.value as Map;
                              notifications['key'] = snapshot.key;
                              var title = notifications['title'];
                              var desc = notifications['description'];
                              var date = notifications['createdOn'];
                      
                              return _buildListItem(
                                  title, desc, date, darkMode, context);
                            },
                            defaultChild:
                                const Center(child: CircularProgressIndicator()),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildListItem(String? title, String? desc, String? date,
      bool darkMode, BuildContext context) {
    // Customize the ListTile styling here
    return Card(
      color: GuestAppColors.primaryColor,
      elevation: 2.0,
      shadowColor:
          darkMode ? GuestAppColors.shadowDark : GuestAppColors.shadowLight,
      margin: const EdgeInsets.only(bottom: GuestAppSizes.marginSmBottom),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(GuestAppSizes.containerSmRadius)),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
            horizontal: GuestAppSizes.paddingSmHorizontal,
            vertical: GuestAppSizes.paddingSmVertical),
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(GuestAppSizes.containerSmRadius)),
        tileColor: darkMode
            ? GuestAppColors.widgetPrimaryDark
            : GuestAppColors.widgetPrimaryLight,
        title: Text(
          title!,
          style:
              Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 15, color:darkMode?GuestAppColors.secondaryColor:GuestAppColors.primaryColor),
          textAlign: TextAlign.justify,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: GuestAppSizes.spaceBtwTexts),
            Text(
              date!,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(fontSize: 10),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: GuestAppSizes.spaceBtwTexts),
            Text(
              desc!,
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
