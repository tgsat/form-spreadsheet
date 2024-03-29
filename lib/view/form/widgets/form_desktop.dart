import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:spreadsheet/utils/utils.dart';
import 'dart:html' as html;

class FormDesktop extends StatefulWidget {
  const FormDesktop({super.key});

  @override
  State<FormDesktop> createState() => _FormDesktopState();
}

class _FormDesktopState extends State<FormDesktop> {
  final formKey = GlobalKey<FormState>();
  final nameCont = TextEditingController();
  final mobileCont = TextEditingController();
  final idPelPlnCont = TextEditingController();
  final typeBranchCont = TextEditingController();
  final jenisEvCont = TextEditingController();
  final informationCont = TextEditingController();
  String? chosenValue;

  void _submitForm() {
    final String name = nameCont.text;
    final String idPel = idPelPlnCont.text;
    final String phone = mobileCont.text;
    final String branch = typeBranchCont.text;
    final String description = informationCont.text;

    if (formKey.currentState!.validate()) {
      FirebaseFirestore.instance.collection('EVUIWNTT').doc(uniqueKey).set({
        "id": uniqueKey,
        "name": name,
        "idPelPLN": idPel,
        "phone": phone,
        "jenisEV": chosenValue,
        "branchType": branch,
        "keterangan": description,
      }).then((value) {
        Future.delayed(const Duration(milliseconds: 2), () {
          html.window.location.reload();
        });
      });
      showSnackBarSuccess(context, Dictionary.submitSuccess);
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
          CustomTextFieldGeneral(
            controller: mobileCont,
            label: Dictionary.noPhone,
            isRequired: true,
            keyboardType: TextInputType.number,
            textInputFormatter: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            textInputAction: TextInputAction.done,
          ),
          CustomTextFieldGeneral(
            controller: informationCont,
            label: Dictionary.information,
            keyboardType: TextInputType.multiline,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.done,
            isRequired: false,
            isLines: true,
            maxLength: 200,
          ),
          Space.y(4.w)!,
          ButtonGeneral(
            onTap: () => _submitForm(),
          ),
        ],
      ),
    );
  }
}
