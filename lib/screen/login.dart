import 'package:fcshd_guest/constants/colors.dart';
import 'package:fcshd_guest/constants/sizes.dart';
import 'package:fcshd_guest/constants/text.dart';
import 'package:fcshd_guest/controller/login_controller.dart';
import 'package:fcshd_guest/device/device_helper.dart';
import 'package:fcshd_guest/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:fcshd_guest/constants/images.dart';


class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});
  // final _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LogInController());
    final darkMode = GuestAppHelper.isDarkMode(context);

    return Scaffold(
      // backgroundColor: GuestAppColors.backgroundColor,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      //change the background color to gradient
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: GuestAppSizes.paddingSmVertical, horizontal: GuestAppSizes.paddingSmHorizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Center(
                child: Image(
                      height: GuestAppSizes.imageExtraLargeSize,
                      image: AssetImage(GuestAppImages.login)),
              ),
              // Center(
              //   child: Container(height: 250, child: Image.asset(login)),
              // ),
              const SizedBox(height: GuestAppSizes.spaceBtwSections),
              Text(GuestAppText.loginTitle,
                  style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(height: GuestAppSizes.spaceBtwTexts),
              Text(GuestAppText.loginSubtitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: darkMode?GuestAppColors.fontDark: GuestAppColors.darkerGrey)),
              const SizedBox(height: GuestAppSizes.defaultSpace),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.email,
                        validator: (value) =>
                            GuestAppValidator.validateEmail(value),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.direct_right),
                            labelText: GuestAppText.emailLabel),
                      ),

                      const SizedBox(height: GuestAppSizes.spaceBtwItems),

                      Obx(
                        () => TextFormField(
                            obscureText: controller.hidePassword.value,
                            controller: controller.password,
                            validator: (value) =>
                                GuestAppValidator.validateEmptyText(
                                    "Password", value),
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Iconsax.password_check),
                                labelText: GuestAppText.passwordLabel,
                                suffixIcon: IconButton(
                                    onPressed: () => controller.hidePassword
                                        .value = !controller.hidePassword.value,
                                    icon: controller.hidePassword.value
                                        ? const Icon(Iconsax.eye_slash)
                                        : const Icon(Iconsax.eye)))),
                      ),

                      const SizedBox(
                        height: GuestAppSizes.spaceBtwTexts,
                      ),
                      // const Align(
                      //   alignment: Alignment.centerRight,
                      //   child: InkWell(
                      //       child: Text(
                      //     "Forget Password?",
                      //     textAlign: TextAlign.right,
                      //     style: TextStyle(
                      //         fontWeight: FontWeight.w600,
                      //         color: Colors.cyan,
                      //         fontSize: 15),
                      //   )),
                      // ),
                      const SizedBox(
                        height: GuestAppSizes.spaceBtwLargerSections,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                controller.login(context);
                              }

                              // Get.to(() => const HomeScreen());
                            },
                            child: Text(GuestAppText.logInBtnLabel,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(color: Colors.white))),
                      )
                    ],
                  )),
            ],
          ),
        )),
      ),
    );
  }
}
