class FormModel {
  String name;
  String idPelPLN;
  String mobileNo;
  String jenisEV;
  String typeBranch;
  String information;

  FormModel(this.name, this.idPelPLN, this.mobileNo, this.jenisEV,
      this.typeBranch, this.information);

  factory FormModel.fromJson(dynamic json) {
    return FormModel(
      "${json['name']}",
      "${json['idPelPLN']}",
      "${json['mobileNo']}",
      "${json['jenisEV']}",
      "${json['typeBranch']}",
      "${json['information']}",
    );
  }

  // Method to make GET parameters.
  Map toJson() => {
        'name': name,
        'idPelPLN': idPelPLN,
        'mobileNo': mobileNo,
        'jenisEV': jenisEV,
        'typeBranch': typeBranch,
        'information': information,
      };
}
