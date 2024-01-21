import 'package:flutter/material.dart';
import 'package:spreadsheet/utils/utils.dart';

class CustomTextFieldGeneral extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool isLines;
  final TextInputType keyboardType;
  final bool isReadOnly;
  final Function()? onTap;
  final bool isRequired;
  final bool validateEmail;
  final Function()? refreshUI;
  const CustomTextFieldGeneral({
    super.key,
    required this.controller,
    required this.label,
    this.isLines = false,
    this.keyboardType = TextInputType.name,
    this.isReadOnly = false,
    this.onTap,
    this.isRequired = true,
    this.validateEmail = false,
    this.refreshUI,
  });

  @override
  State<CustomTextFieldGeneral> createState() => _CustomTextFieldGeneralState();
}

class _CustomTextFieldGeneralState extends State<CustomTextFieldGeneral> {
  bool _isError = false;
  String? _messageError;

  @override
  void initState() {
    widget.controller.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Section(
      label: widget.label,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            child: Container(
              decoration: CustomCard.cardPrimary(),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                readOnly: widget.isReadOnly,
                onTap: widget.onTap,
                controller: widget.controller,
                keyboardType: widget.keyboardType,
                textCapitalization: widget.validateEmail
                    ? TextCapitalization.none
                    : TextCapitalization.words,
                minLines: widget.isLines ? 4 : 1,
                maxLines: widget.isLines ? null : 1,
                decoration: InputDecoration(
                  errorStyle:
                      const TextStyle(height: 0, color: Colors.transparent),
                  border: InputBorder.none,
                  hintText: widget.label,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: AppColor.bodytextColor),
                ),
                onChanged: (val) {
                  widget.refreshUI!();
                },
                validator: (val) {
                  if (val!.isEmpty && widget.isRequired) {
                    setState(() {
                      _isError = true;
                      _messageError =
                          '${widget.label} ${Dictionary.isRequired}';
                    });
                    return _messageError;
                  } else {
                    setState(() {
                      _isError = false;
                    });
                  }
                  return null;
                },
              ),
            ),
          ),
          if (_isError)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                _messageError ?? '',
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
