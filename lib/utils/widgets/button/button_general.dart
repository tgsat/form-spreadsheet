import 'package:flutter/material.dart';
import 'package:spreadsheet/utils/utils.dart';

class ButtonGeneral extends StatelessWidget {
  final Function()? onTap;
  const ButtonGeneral({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: AppSize.maxWidth(context),
        padding: const EdgeInsets.symmetric(horizontal: 60),
        decoration: CustomCard.cardButton(),
        child: Center(
          child: ButtonOpacity(
            onTap: onTap!,
            child: Text(
              Dictionary.submit,
              style: const AppFonts(size: 16, color: AppColor.whiteColor).text,
            ),
          ),
        ));
  }
}
