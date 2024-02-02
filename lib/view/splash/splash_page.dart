import 'package:flutter/material.dart';
import 'package:spreadsheet/utils/utils.dart';
import 'package:spreadsheet/view/form/form_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const FormPage())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.backgroundColor,
        width: AppSize.maxWidth(context),
        height: AppSize.maxHeight(context),
        child: Center(
          child: CustomLoading.primary(
            'Please wait...',
            Responsive.isMobile(context) ? 12 : 14,
            color: AppColor.primaryColor,
          ),
        ),
      ),
    );
  }
}
