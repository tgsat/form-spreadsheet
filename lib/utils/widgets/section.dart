import 'package:flutter/material.dart';
import 'package:spreadsheet/utils/utils.dart';

class Section extends StatelessWidget {
  final String label;
  final Widget child;
  const Section({super.key, required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: AppColor.textColor)),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}
