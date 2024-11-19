import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pas1_mobile_11pplg2_32/controllers/user_controller.dart';

class RegisterController extends GetxController {
  final String baseUrl = 'https://mediadwi.com';

  var isChecked = false.obs;
  var isButtonEnabled = false.obs;

  // Form field observables
  var fullName = ''.obs;
  var email = ''.obs;
  var username = ''.obs;
  var password = ''.obs;

  var isFullNameFocused = false.obs;
  var isEmailFocused = false.obs;
  var isUsernameFocused = false.obs;
  var isPasswordFocused = false.obs;
  var isPasswordVisible = false.obs;

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode fullNameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();

    // Initialize listeners
    fullNameFocusNode.addListener(() {
      isFullNameFocused.value = fullNameFocusNode.hasFocus;
    });
    emailFocusNode.addListener(() {
      isEmailFocused.value = emailFocusNode.hasFocus;
    });
    usernameFocusNode.addListener(() {
      isUsernameFocused.value = usernameFocusNode.hasFocus;
    });
    passwordFocusNode.addListener(() {
      isPasswordFocused.value = passwordFocusNode.hasFocus;
    });

    // Update observable values when text changes
    fullNameController.addListener(() {
      fullName.value = fullNameController.text;
      checkIfButtonShouldBeEnabled();
    });
    emailController.addListener(() {
      email.value = emailController.text;
      checkIfButtonShouldBeEnabled();
    });
    usernameController.addListener(() {
      username.value = usernameController.text;
      checkIfButtonShouldBeEnabled();
    });
    passwordController.addListener(() {
      password.value = passwordController.text;
      checkIfButtonShouldBeEnabled();
    });
  }

  void checkIfButtonShouldBeEnabled() {
    isButtonEnabled.value = fullName.isNotEmpty &&
        email.isNotEmpty &&
        username.isNotEmpty &&
        password.isNotEmpty &&
        isChecked.value;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> registerUser() async {
    final url = Uri.parse('${baseUrl}/api/latihan/register-user');

    // Prepare the payload for form-data
    final Map<String, String> payload = {
      'full_name': fullName.value,
      'email': email.value,
      'username': username.value,
      'password': password.value,
    };

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: payload, // Send as form-data
      );

      // Parse the response
      final responseData = json.decode(response.body);

      if (response.statusCode == 200 && responseData['status'] == true) {
        // Success: User registered successfully
        Get.snackbar(
          'Success',
          responseData['message'] ?? 'User registered successfully!',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        UserController userController = Get.put(UserController());
        userController.setUsername(usernameController.text);

        Get.toNamed('/maindashboard');

        resetValue(); // Clear form fields after successful registration
      } else {
        // Error: Use the message from the response
        Get.snackbar(
          'Error',
          responseData['message'] ?? 'Registration failed!',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      // Handle connection errors
      Get.snackbar(
        'Error',
        'Something went wrong. Please try again later.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void toggleCheckbox() {
    isChecked.value = !isChecked.value;
    checkIfButtonShouldBeEnabled();
  }

  void resetValue() {
    fullNameController.text = '';
    emailController.text = '';
    usernameController.text = '';
    passwordController.text = '';
    isChecked.value = false;
  }

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();

    fullNameFocusNode.dispose();
    emailFocusNode.dispose();
    usernameFocusNode.dispose();
    passwordFocusNode.dispose();
    super.onClose();
  }
}
