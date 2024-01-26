import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:spreadsheet/model/form_model.dart';

class FormService {
  final void Function(String) callback;
  // Google App Script Web URL
  static const String URL =
      "https://script.google.com/macros/s/AKfycbyIi8wOooMc5pfHSAj0q8PCoKlD7270aTNe4FVHVx9IPuqWGOLG7qDtY4T3ntZ0CMYFuA/exec";

  static const STATUS_SUCCESS = "SUCCESS";
  static const STATUS_FAILURE = "FAILURE";

  FormService(this.callback);

  void submitForm(FormModel formModel) async {
    try {
      await http.get(Uri.parse(URL + formModel.toParams())).then((response) {
        callback(convert.jsonDecode(response.body)['status']);
      });
    } catch (e) {
      print(e);
    }
  }
}
