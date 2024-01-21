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
  final int? maxLength;
  final Function(String?)? refreshUI;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final bool isActived;
  const CustomTextFieldGeneral({
    super.key,
    required this.controller,
    required this.label,
    this.isLines = false,
    this.keyboardType = TextInputType.name,
    this.textCapitalization = TextCapitalization.none,
    this.isReadOnly = false,
    this.onTap,
    this.maxLength,
    this.isRequired = true,
    this.validateEmail = false,
    this.refreshUI,
    this.textInputAction = TextInputAction.next,
    this.isActived = false,
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
      label: widget.label.toUpperCase(),
      isActived: widget.isActived,
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
                maxLength: widget.maxLength,
                controller: widget.controller,
                keyboardType: widget.keyboardType,
                textInputAction: widget.textInputAction,
                textCapitalization: widget.textCapitalization,
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
                onChanged: widget.refreshUI,
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
