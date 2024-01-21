import 'package:flutter/material.dart';
import 'package:spreadsheet/utils/widgets/res/responsive.dart';
import 'package:spreadsheet/view/form/widgets/form_desktop.dart';
import 'package:spreadsheet/view/form/widgets/form_mobile.dart';
import 'package:spreadsheet/view/form/widgets/form_tab.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: FormMobile(),
      tablet: FormTab(),
      desktop: FormDesktop(),
    );
  }
}
