import 'package:flutter/material.dart';
import 'package:spreadsheet/utils/utils.dart';
import 'package:spreadsheet/view/form/widgets/form_desktop.dart';
import 'package:spreadsheet/view/form/widgets/form_mobile.dart';
import 'package:spreadsheet/view/form/widgets/form_tab.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      appBar: CustomAppBar.general(context, Dictionary.appName),
      body: const Responsive(
        mobile: FormMobile(),
        tablet: FormTab(),
        desktop: FormDesktop(),
      ),
    );
  }
}
