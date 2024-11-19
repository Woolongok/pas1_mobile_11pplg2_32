import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_32/controllers/register_controller.dart';

import '../../widgets/my_button.dart';
import '../../widgets/my_colors.dart';
import '../../widgets/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final RegisterController controller = Get.find();

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
                          "We welcome you to Elfida, please sign up to continue",
                          style: TextStyle(
                            color: darkblue,
                            fontSize: 14.3,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Raleway',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),

                        // Full Name Field
                        Obx(() => MyTextfield(
                              label: "Full Name",
                              controller: controller.fullNameController,
                              color: controller.isFullNameFocused.value
                                  ? cream
                                  : whiteish,
                              textColor: darkblue,
                              underlineColor: darkblue,
                              focusNode: controller.fullNameFocusNode,
                              passwordType: false,
                              isObsecure: false,
                              onToggleObsecure: () {},
                              isUsername: false,
                              hasFocus: controller.isFullNameFocused.value,
                            )),
                        SizedBox(height: 16.0),

                        // Email Field
                        Obx(() => MyTextfield(
                              label: "Email",
                              controller: controller.emailController,
                              color: controller.isEmailFocused.value
                                  ? cream
                                  : whiteish,
                              textColor: darkblue,
                              underlineColor: darkblue,
                              focusNode: controller.emailFocusNode,
                              passwordType: false,
                              isObsecure: false,
                              onToggleObsecure: () {},
                              isUsername: false,
                              hasFocus: controller.isEmailFocused.value,
                            )),
                        SizedBox(height: 16.0),

                        // Username Field
                        Obx(() => MyTextfield(
                              label: "Username",
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
                        SizedBox(height: 16.0),

                        // Password Field
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

                        // Checkbox
                        Obx(() => Row(
                              children: [
                                Checkbox(
                                  value: controller.isChecked.value,
                                  onChanged: (value) {
                                    controller.isChecked.value = value ?? false;
                                    controller.checkIfButtonShouldBeEnabled();
                                  },
                                ),
                                Expanded(
                                  child: Text(
                                    "I agree to the Terms & Conditions",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(height: 16.0),

                        // Submit Button
                        Obx(() => MYButton(
                              text: "REGISTER",
                              isButtonEnabled: controller.isButtonEnabled.value,
                              onPressed: controller.isButtonEnabled.value
                                  ? controller.registerUser
                                  : null,
                            )),

                        // Already Have an Account
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Spacer(),
                              Text(
                                'Already have an account?',
                                style: TextStyle(
                                  color: darkblue,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              SizedBox(width: 5),
                              TextButton(
                                onPressed: () {
                                  controller.resetValue();
                                  Get.toNamed("/");
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                ),
                                child: Text(
                                  'Log In',
                                  style: TextStyle(
                                    color: redish,
                                    fontWeight: FontWeight.w600,
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
      ),
    );
  }
}
