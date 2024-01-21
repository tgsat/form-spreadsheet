import 'package:flutter/material.dart';

class Dots extends StatelessWidget {
  final Widget child;
  final bool isActived;
  const Dots({
    super.key,
    required this.child,
    required this.isActived,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        child,
        if (isActived)
          const Text(
            '*',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
      ],
    );
  }
}
