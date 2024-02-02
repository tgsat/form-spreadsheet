import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spreadsheet/data/model/form_model.dart';

import '../../utils/helper/helper.dart';

class FormService {
  final CollectionReference _formCollection =
      FirebaseFirestore.instance.collection('EVUIWNTT');

  Future<void> postData(FormModel data) {
    return _formCollection.doc(uniqueKey).set({
      // "id": uniqueKey,
      "name": data.name,
      "idPelPLN": data.idPel,
      "phone": data.phone,
      "jenisEV": data.jenisEv,
      "branchType": data.brandType,
      "keterangan": data.description,
    });
  }
}
