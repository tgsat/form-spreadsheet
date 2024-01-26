import 'package:flutter/material.dart';

import '../../utils.dart';

class GeneralDropdown extends StatefulWidget {
  final listDropdownItem;
  final selectedItem;
  final String hint;
  final bool isRequired;
  final Function(dynamic selectedItem) press;

  const GeneralDropdown(
      {super.key,
      this.listDropdownItem,
      this.selectedItem,
      required this.hint,
      this.isRequired = true,
      required this.press});

  @override
  State<GeneralDropdown> createState() => _GeneralDropdownState();
}

class _GeneralDropdownState extends State<GeneralDropdown> {
  bool isError = false;
  String? messageError;
  @override
  Widget build(BuildContext context) {
    return Section(
      label: Dictionary.jenisEV.toUpperCase(),
      isActived: widget.isRequired,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: CustomCard.cardPrimary(),
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                errorStyle: TextStyle(height: 0, color: Colors.transparent),
                border: InputBorder.none,
              ),
              icon: const Icon(Icons.keyboard_arrow_down),
              value: widget.selectedItem,
              hint: Text(
                widget.hint,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: AppColor.bodytextColor),
              ),
              isExpanded: true,
              validator: (val) {
                if (val!.isEmpty && widget.isRequired) {
                  setState(() {
                    isError = true;
                    messageError = '${widget.hint} ${Dictionary.isRequired}';
                  });
                  return messageError;
                } else {
                  setState(() {
                    isError = false;
                  });
                }
                return null;
              },
              onChanged: (value) {
                widget.press(value);
              },
              items: widget.listDropdownItem,
            ),
          ),
          if (isError)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                messageError ?? '',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.red),
              ),
            )
        ],
      ),
    );
  }
}
