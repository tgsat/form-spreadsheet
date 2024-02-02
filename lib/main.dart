import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sizer/sizer.dart';
import 'package:spreadsheet/data/controller/network_controller.dart';
import 'package:spreadsheet/utils/utils.dart';
import 'package:spreadsheet/view/form/form_page.dart';

void main() async {
  Get.put<NetworkController>(NetworkController(), permanent: true);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyAXXc1BdnE6w4YlYOL3QyxAsHQKwIUEPRo",
        authDomain: "form-spread-8cfe6.firebaseapp.com",
        projectId: "form-spread-8cfe6",
        storageBucket: "form-spread-8cfe6.appspot.com",
        messagingSenderId: "956906251614",
        appId: "1:956906251614:web:510613f3ec4648f5d71bcf"),
  );
  runApp(const AppSite());
}

class AppSite extends StatelessWidget {
  const AppSite({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: Dictionary.appName,
        theme: AppTheme.themeData(context),
        home: const FormPage(),
      );
    });
  }
}
