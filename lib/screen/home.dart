import 'package:fcshd_guest/constants/colors.dart';
import 'package:fcshd_guest/constants/images.dart';
import 'package:fcshd_guest/constants/sizes.dart';
import 'package:fcshd_guest/device/device_helper.dart';
import 'package:fcshd_guest/repository/authentication_repository/authentication_repository.dart';
import 'package:fcshd_guest/widgets/menu_option.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../constants/text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = GuestAppHelper.isDarkMode(context);

    return Scaffold(
        body: SingleChildScrollView(
            child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: GuestAppSizes.paddingHorizontal,
            vertical: GuestAppSizes.paddingVertical),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(GuestAppText.homeTitle,
                    style: Theme.of(context).textTheme.headlineMedium),
                IconButton(
                    onPressed: () async {
                      await AuthenticationRepository.instance.logOut();
                    },
                    icon: const Icon(Iconsax.logout))
              ],
            ),
            const SizedBox(height: GuestAppSizes.sm),
            Text(GuestAppText.homeSubtitle,
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(
              height: GuestAppSizes.spaceBtwSections,
            ),
            Container(
              // height: GuestAppSizes.containerLgHeight,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    GuestAppColors.primaryColor,
                    GuestAppColors.secondaryColor
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderRadius:
                      BorderRadius.circular(GuestAppSizes.containerLgRadius)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: GuestAppSizes.containerLgPaddingX,
                    vertical: GuestAppSizes.containerLgPaddingY),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(GuestAppText.homeBannerTitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: GuestAppColors.fontDark)),
                          const SizedBox(height: GuestAppSizes.sm),
                          Text(
                            GuestAppText.homeBannerSubtitle,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(color: GuestAppColors.fontDark),
                            textAlign: TextAlign.justify,
                          ),
                          ButtonMenuOptions(
                            url: GuestAppText.iccshdLink,
                            title: GuestAppText.iccshdTitle,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: GuestAppSizes.md),
                    const Image(
                        fit: BoxFit.cover,
                        height: GuestAppSizes.imageMediumSize,
                        image: AssetImage(GuestAppImages.home_banner)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: GuestAppSizes.spaceBtwSections),
            Text(GuestAppText.homeMenuTitle,
                style: Theme.of(context).textTheme.headlineSmall!),
            const SizedBox(height: GuestAppSizes.xs),
            Text(
              GuestAppText.homeMenuSubtitle,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontSize: 13),
            ),
            const SizedBox(
              height: GuestAppSizes.defaultSpace,
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: MenuOption(
                            darkMode: darkMode,
                            icons: Iconsax.notification,
                            url: GuestAppText.newsLink,
                            title: GuestAppText.newsTitle),
                      ),
                      const SizedBox(width: GuestAppSizes.sm),
                      Expanded(
                        child: MenuOption(
                            darkMode: darkMode,

                            icons: Iconsax.calendar_2,
                            url: GuestAppText.scheduleLink,
                            title: GuestAppText.scheduleTitle),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: GuestAppSizes.spaceBtwItems),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: MenuOption(
                            darkMode: darkMode,

                            icons: Iconsax.archive_book,
                            url: GuestAppText.programmeLink,
                            title: GuestAppText.programmeTitle),
                      ),
                      const SizedBox(width: GuestAppSizes.sm),
                      Expanded(
                          child: MenuOption(
                            darkMode: darkMode,

                              icons: Iconsax.map,
                              url: GuestAppText.venueLink,
                              title: GuestAppText.venueTitle))
                    ],
                  ),
                )
              ],
            )

            // GestureDetector(
            //   onTap: () => Get.to(()=>AttendanceQrScannerScreen()),
            //   child: Container(
            //     height: GuestAppSizes.containerMdHeight,
            //     width: double.infinity,
            //     decoration: BoxDecoration(
            //         gradient: LinearGradient(colors: [
            //           Color.fromARGB(255, 191, 219, 247)
            //               , Color.fromARGB(255, 150, 190, 230)
            //         ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            //         borderRadius:
            //             BorderRadius.circular(GuestAppSizes.containerMdRadius)),
            //     child: Padding(
            //       padding: const EdgeInsets.symmetric(
            //           horizontal: GuestAppSizes.containerMdPaddingX,
            //           vertical: GuestAppSizes.containerMdPaddingY),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         children: [
            //           Text(
            //             GuestAppText.menu1Title,
            //             style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500, fontSize: 13),
            //           ),
            //           const SizedBox(width:GuestAppSizes.md),
            //           const Image(
            //               fit: BoxFit.cover,
            //               height: GuestAppSizes.imageThumbSize,
            //               image: AssetImage(GuestAppImages.menu_1)),
            //           const Icon(Iconsax.arrow_right_3)
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: GuestAppSizes.defaultSpace,
            // ),
            // GestureDetector(
            //   onTap: ()=>Get.to(()=>attendeesListScreen()),
            //   child: Container(
            //     height: GuestAppSizes.containerMdHeight,
            //     width: double.infinity,
            //     decoration: BoxDecoration(
            //         gradient: LinearGradient(colors: [
            //           Color.fromARGB(255, 216, 245, 168)
            //               , Color.fromARGB(255, 210, 236, 139)
            //         ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            //         borderRadius:
            //             BorderRadius.circular(GuestAppSizes.containerMdRadius)),
            //     child: Padding(
            //       padding: const EdgeInsets.symmetric(
            //           horizontal: GuestAppSizes.containerMdPaddingX,
            //           vertical: GuestAppSizes.containerMdPaddingY),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         children: [
            //           Text(
            //             GuestAppText.menu2Title,
            //             style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500, fontSize: 13),
            //           ),
            //           const SizedBox(width:GuestAppSizes.md),
            //           const Image(
            //               fit: BoxFit.cover,
            //               height: GuestAppSizes.imageThumbSize,
            //               image: AssetImage(GuestAppImages.menu_2)),
            //           const Icon(Iconsax.arrow_right_3)
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: GuestAppSizes.defaultSpace,
            // ),
            // GestureDetector(
            //   onTap: ()=>{Get.to(()=>notificationListScreen())},
            //   child: Container(
            //     height: GuestAppSizes.containerMdHeight,
            //     width: double.infinity,
            //     decoration: BoxDecoration(
            //         gradient: LinearGradient(colors: [
            //           Color.fromARGB(255, 228, 201, 254)
            //               , Color.fromARGB(255, 203, 176, 228)
            //         ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            //         borderRadius:
            //             BorderRadius.circular(GuestAppSizes.containerMdRadius)),
            //     child: Padding(
            //       padding: const EdgeInsets.symmetric(
            //           horizontal: GuestAppSizes.containerMdPaddingX,
            //           vertical: GuestAppSizes.containerMdPaddingY),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         children: [
            //           Text(
            //             GuestAppText.menu3Title,
            //             style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w500, fontSize: 13),
            //           ),
            //           const SizedBox(width:GuestAppSizes.md),
            //           Image(
            //               fit: BoxFit.cover,
            //               height: GuestAppSizes.imageThumbSize,
            //               image: AssetImage(GuestAppImages.menu_3)),
            //           const Icon(Iconsax.arrow_right_3)
            //         ],
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    )));
  }
}
