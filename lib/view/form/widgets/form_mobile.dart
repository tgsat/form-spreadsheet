import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:spreadsheet/utils/utils.dart';

class FormMobile extends StatefulWidget {
  const FormMobile({super.key});

  @override
  State<FormMobile> createState() => _FormMobileState();
}

class _FormMobileState extends State<FormMobile> {
  final formKey = GlobalKey<FormState>();
  final nameCont = TextEditingController();
  final mobileCont = TextEditingController();
  final idPelPlnCont = TextEditingController();
  final typeBranchCont = TextEditingController();
  final informationCont = TextEditingController();
  String? chosenValue;

  void _submitForm() {
    final String name = nameCont.text;
    final String idPel = idPelPlnCont.text;
    final String phone = mobileCont.text;
    final String branch = typeBranchCont.text;
    final String description = informationCont.text;

    if (name != '' && idPel != '' && phone != '' && branch != '') {
      FirebaseFirestore.instance.collection('EVUIWNTT').doc(uniqueKey).set({
        "id": uniqueKey,
        "name": name,
        "idPelPLN": idPel,
        "phone": phone,
        "jenisEV": chosenValue,
        "branchType": branch,
        "keterangan": description,
      });
      showSnackBarSuccess(context, 'Berhasil menambahkan data');
      nameCont.clear();
      idPelPlnCont.clear();
      mobileCont.clear();
      typeBranchCont.clear();
      informationCont.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 10),
        children: [
          CustomTextFieldGeneral(
            controller: nameCont,
            label: Dictionary.name,
            textCapitalization: TextCapitalization.words,
          ),
          GeneralDropdown(
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
          CustomTextFieldGeneral(
            controller: idPelPlnCont,
            label: Dictionary.idpelPln,
            textCapitalization: TextCapitalization.words,
          ),
          CustomTextFieldGeneral(
            controller: typeBranchCont,
            label: Dictionary.merkType,
            textCapitalization: TextCapitalization.words,
          ),
          CustomTextFieldGeneral(
            controller: mobileCont,
            label: Dictionary.noPhone,
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
            maxLength: 300,
          ),
          Space.y(4.w)!,
          ButtonGeneral(onTap: () {
            if (nameCont.text == '' &&
                mobileCont.text == '' &&
                idPelPlnCont.text == '' &&
                typeBranchCont.text == '') {
              showSnackBarFailure(context, 'Field tidak boleh kosong!');
            } else {
              showSnackBar(context, 'Mohon tunggu sebentar...');
              if (formKey.currentState!.validate()) {
                _submitForm();
              }
            }
          }),
        ],
      ),
    );
  }
}
