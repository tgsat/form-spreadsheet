import 'package:flutter/material.dart';
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
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final nameCont = TextEditingController();
  final mobileCont = TextEditingController();
  final informationCont = TextEditingController();
  final idPelPlnCont = TextEditingController();
  final jenisEVCont = TextEditingController();
  final typeBranchCont = TextEditingController();

  bool name = false,
      mobileNo = false,
      enable = false,
      information = false,
      idPelPln = false,
      typeBranch = false,
      jenisEv = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _submitForm() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        enable = true;
      });
      FormModel model = FormModel(
        nameCont.text.trim(),
        idPelPlnCont.text.trim(),
        mobileCont.text.trim(),
        informationCont.text.trim(),
        jenisEVCont.text.trim(),
        typeBranchCont.text.trim(),
      );

      FormService formCont = FormService();

      formCont.submitForm(model, (String response) {
        if (response == FormService.STATUS_SUCCESS) {
          nameCont.clear();
          mobileCont.clear();
          idPelPlnCont.clear();
          informationCont.clear();
          jenisEVCont.clear();
          typeBranchCont.clear();
          setState(() {
            enable = false;
          });
          _showSnackbar("Details Submitted");
        } else {
          nameCont.clear();
          mobileCont.clear();
          idPelPlnCont.clear();
          informationCont.clear();
          jenisEVCont.clear();
          typeBranchCont.clear();
          setState(() {
            enable = false;
          });
          _showSnackbar("Error Occurred!");
        }
      });
      setState(() {
        enable = false;
      });
      _showSnackbar("Submitting Details");
    }
  }

  // Method to show snackbar with 'message'.
  _showSnackbar(String message) {
    scaffoldKey.currentState!.setState(() {
      showSnackBar(context, message);
    });
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            Dictionary.appName,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: AppColor.whiteColor,
                  fontWeight: FontWeight.w600,
                ),
          )),
      body: Form(
        key: formKey,
        child: ListView(
          shrinkWrap: true,
          children: [
            CustomTextFieldGeneral(
                controller: nameCont,
                label: Dictionary.name,
                refreshUI: (val) {
                  setState(() {
                    if (val!.trim().isNotEmpty) {
                      name = true;
                    } else {
                      name = false;
                    }
                  });
                }),
            CustomTextFieldGeneral(
                controller: idPelPlnCont,
                label: Dictionary.idpelPln,
                refreshUI: (val) {
                  setState(() {
                    if (val!.trim().isNotEmpty) {
                      idPelPln = true;
                    } else {
                      idPelPln = false;
                    }
                  });
                }),
            CustomTextFieldGeneral(
                controller: mobileCont,
                label: Dictionary.noPhone,
                refreshUI: (val) {
                  setState(() {
                    if (val!.trim().isNotEmpty) {
                      mobileNo = true;
                    } else {
                      mobileNo = false;
                    }
                  });
                }),
          ],
        ),
      ),
    );
  }
}
