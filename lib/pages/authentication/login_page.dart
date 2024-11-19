import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_32/controllers/login_controller.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_colors.dart';
import '../../widgets/my_textfield.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: whiteish,
      child: Stack(
        children: [
          Positioned(
            top: 110,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome back to Elfida, please log in to continue",
                        style: TextStyle(
                          color: darkblue,
                          fontSize: 14.3,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Raleway',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 5),
                      Obx(() => MyTextfield(
                            label: "Email",
                            controller: controller.usernameController,
                            color: controller.isUsernameFocused.value
                                ? cream
                                : whiteish,
                            textColor: darkblue,
                            underlineColor: darkblue,
                            focusNode: controller.usernameFocusNode,
                            passwordType: false,
                            isObsecure: false,
                            onToggleObsecure: () {},
                            isUsername: true,
                            hasFocus: controller.isUsernameFocused.value,
                          )),
                      SizedBox(height: 5.0),
                      Obx(() => MyTextfield(
                            label: "Password",
                            controller: controller.passwordController,
                            color: controller.isPasswordFocused.value
                                ? cream
                                : whiteish,
                            textColor: darkblue,
                            underlineColor: darkblue,
                            focusNode: controller.passwordFocusNode,
                            passwordType: true,
                            isObsecure: !controller.isPasswordVisible.value,
                            onToggleObsecure:
                                controller.togglePasswordVisibility,
                            isUsername: false,
                            hasFocus: controller.isPasswordFocused.value,
                          )),
                      SizedBox(height: 16.0),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            color: darkblue,
                            fontSize: 11.5,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Raleway',
                          ),
                          children: [
                            TextSpan(
                                text: "By logging in you're agreeing to our "),
                            TextSpan(
                                text: "Terms", style: TextStyle(color: redish)),
                            TextSpan(text: " & "),
                            TextSpan(
                                text: "Privacy Policy",
                                style: TextStyle(color: redish)),
                            TextSpan(text: " and are at least 16 years old"),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Obx(() => MYButton(
                            text: "LOG IN",
                            isButtonEnabled: controller.isButtonEnabled.value,
                            onPressed: controller.isButtonEnabled.value
                                ? controller.login
                                : null,
                          )),
                      SizedBox(height: 165),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Spacer(),
                            TextButton(
                              onPressed: () {
                                Get.toNamed("/");
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.transparent),
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: redish,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Raleway',
                                ),
                              ),
                            ),
                            VerticalDivider(color: darkblue, thickness: 1),
                            TextButton(
                              onPressed: () {
                                controller.resetValue();
                                Get.toNamed('/registerpage');
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.transparent),
                              child: Text(
                                'Create Account',
                                style: TextStyle(
                                  color: redish,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Raleway',
                                ),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
