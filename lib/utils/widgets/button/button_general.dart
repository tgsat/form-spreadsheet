import 'package:flutter/material.dart';
import '../../utils.dart';

class ButtonGeneral extends StatelessWidget {
  final String text;
  final Function() onTap;
  const ButtonGeneral({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: MobileCCButton(text: text, onTap: onTap),
      tablet: TabletCCButton(text: text, onTap: onTap),
      desktop: DesktopCCButton(text: text, onTap: onTap),
    );
  }
}

class MobileCCButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  const MobileCCButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 40,
          width: 120,
          decoration: BoxDecoration(
            border: Border.all(
                color: AppColor.textColor.withOpacity(0.8), width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        ButtonOpacity(
          onTap: () {
            onTap();
          },
          child: SizedBox(
            height: 40,
            width: 120,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: AppSize.bodyTextMobile(context),
                  height: 1.2,
                  color: AppColor.textColor.withOpacity(0.8),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TabletCCButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  const TabletCCButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 40,
          width: 120,
          decoration: BoxDecoration(
            border: Border.all(
                color: AppColor.textColor.withOpacity(0.8), width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        ButtonOpacity(
          onTap: () {
            onTap();
          },
          child: SizedBox(
            height: 40,
            width: 120,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: AppSize.bodyTextTab(context),
                  // height: 1.2,
                  color: AppColor.textColor.withOpacity(0.8),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DesktopCCButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  const DesktopCCButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 40,
          width: 140,
          decoration: BoxDecoration(
            border: Border.all(
                color: AppColor.textColor.withOpacity(0.8), width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        ButtonOpacity(
          onTap: () {
            onTap();
          },
          child: SizedBox(
            height: 40,
            width: 140,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: AppSize.bodyTextDesktop(context),
                    height: 1.2,
                    color: AppColor.textColor.withOpacity(0.8),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.arrow_forward,
                  size: 18,
                  color: AppColor.textColor.withOpacity(0.8),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
