import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_32/bindings/bindings.dart';
import 'package:pas1_mobile_11pplg2_32/local_database/localDBService.dart';
import 'package:pas1_mobile_11pplg2_32/pages/authentication/login_page.dart';
import 'package:pas1_mobile_11pplg2_32/pages/authentication/register_page.dart';
import 'package:pas1_mobile_11pplg2_32/pages/main_dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => LocalDBService().init());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      title: "Responsive App",
      initialBinding: MyBindings(),
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/registerpage', page: () => RegisterPage()),
        GetPage(name: '/maindashboard', page: () => MainDashboard()),
      ],
    );
  }
}
