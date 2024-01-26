import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:spreadsheet/model/form_model.dart';
import 'package:spreadsheet/service/form_service.dart';
import 'package:spreadsheet/utils/utils.dart';

class FormDesktop extends StatefulWidget {
  const FormDesktop({super.key});

  @override
  State<FormDesktop> createState() => _FormDesktopState();
}

class _FormDesktopState extends State<FormDesktop> {
  final formKey = GlobalKey<FormState>();
  final nameCont = TextEditingController();
  final mobileCont = TextEditingController();
  final informationCont = TextEditingController();
  final idPelPlnCont = TextEditingController();
  final typeBranchCont = TextEditingController();
  String? chosenValue;

  @override
  void initState() {
    super.initState();
  }

  void _submitForm() {
    if (formKey.currentState!.validate()) {
      FormModel formModel = FormModel(
        name: nameCont.text,
        idPelPLN: idPelPlnCont.text,
        mobileNo: mobileCont.text,
        typeBranch: typeBranchCont.text,
        information: informationCont.text,
        jenisEV: chosenValue,
      );

      FormService scriptCont = FormService((String response) {
        if (response == FormService.STATUS_SUCCESS) {
          showSnackBarSuccess(context, "Submit Successfully!");
        } else {
          showSnackBarFailure(context, "Error Occurred While Submitting!");
        }
      });
      showSnackBar(context, "Submitting");
      scriptCont.submitForm(formModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        primary: true,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextFieldGeneral(
                  controller: nameCont,
                  isRequired: true,
                  label: Dictionary.name,
                  textCapitalization: TextCapitalization.words,
                ),
              ),
              Expanded(
                child: GeneralDropdown(
                  isRequired: true,
                  listDropdownItem: <String>[
                    'Motor Listrik',
                    'Mobil Listrik',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                      ),
                    );
                  }).toList(),
                  selectedItem: chosenValue,
                  hint: Dictionary.jenisEV,
                  press: (selectItem) {
                    setState(() {
                      chosenValue = selectItem;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextFieldGeneral(
                  controller: idPelPlnCont,
                  isRequired: true,
                  label: Dictionary.idpelPln,
                  textCapitalization: TextCapitalization.words,
                ),
              ),
              Expanded(
                child: CustomTextFieldGeneral(
                  controller: typeBranchCont,
                  isRequired: true,
                  label: Dictionary.merkType,
                  textCapitalization: TextCapitalization.words,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextFieldGeneral(
                  controller: mobileCont,
                  label: Dictionary.noPhone,
                  isRequired: true,
                  keyboardType: TextInputType.number,
                  textInputFormatter: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  textInputAction: TextInputAction.done,
                ),
              ),
              Expanded(
                child: CustomTextFieldGeneral(
                  controller: informationCont,
                  label: Dictionary.information,
                  textCapitalization: TextCapitalization.words,
                  isRequired: false,
                ),
              ),
            ],
          ),
          Space.y(2.w)!,
          ButtonGeneral(
            onTap: _submitForm,
          ),
        ],
      ),
    );
  }
}
