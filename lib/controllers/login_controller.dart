import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas1_mobile_11pplg2_32/controllers/user_controller.dart';

class LoginController extends GetxController {
  final String baseUrl = 'https://mediadwi.com';

  var isChecked = false.obs;
  var isButtonEnabled = false.obs;
  var username = ''.obs;
  var password = ''.obs;
  var isUsernameFocused = false.obs;
  var isPasswordFocused = false.obs;
  var isPasswordVisible = false.obs;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
    usernameFocusNode.addListener(() {
      isUsernameFocused.value = usernameFocusNode.hasFocus;
    });
    passwordFocusNode.addListener(() {
      isPasswordFocused.value = passwordFocusNode.hasFocus;
    });
    usernameController.addListener(checkIfButtonShouldBeEnabled);
    passwordController.addListener(checkIfButtonShouldBeEnabled);
  }

  Future<void> login() async {
    final url = Uri.parse("${baseUrl}/api/latihan/login");

    try {
      final response = await http.post(
        url,
        body: {
          "username": usernameController.text,
          "password": passwordController.text,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status']) {
          // Login successful
          final userController = Get.put(UserController());
          userController.setUsername(usernameController.text);
          Get.snackbar("Success", data['message']);
          // Navigate to the dashboard
          Get.toNamed('/maindashboard');
        } else {
          // Login failed
          Get.snackbar("Error", data['message']);
        }
      } else {
        // Server error
        Get.snackbar(
            "Error", "Server returned an error: ${response.statusCode}");
      }
    } catch (e) {
      // Network or other error
      Get.snackbar("Error", "An error occurred: $e");
    }
  }

  void checkIfButtonShouldBeEnabled() {
    isButtonEnabled.value = usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void resetValue() {
    usernameController.text = '';
    passwordController.text = '';
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    usernameFocusNode.dispose();
    passwordFocusNode.dispose();
    super.onClose();
  }
}
