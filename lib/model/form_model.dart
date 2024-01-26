class FormModel {
  String? name;
  String? idPelPLN;
  String? mobileNo;
  String? jenisEV;
  String? typeBranch;
  String? information;

  FormModel({
    this.name,
    this.idPelPLN,
    this.mobileNo,
    this.jenisEV,
    this.typeBranch,
    this.information,
  });

  FormModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    idPelPLN = json['IDPelPLN'];
    mobileNo = json['PhoneNumber'];
    jenisEV = json['JenisEV'];
    typeBranch = json['MerekType'];
    information = json['Keterangan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['IDPelPLN'] = this.idPelPLN;
    data['PhoneNumber'] = this.mobileNo;
    data['JenisEV'] = this.jenisEV;
    data['MerekType'] = this.typeBranch;
    data['Keterangan'] = this.information;
    return data;
  }

  String toParams() => "?name=$name&IDPelPLN=$idPelPLN&PhoneNumber=$mobileNo"
      "&JenisEV=$jenisEV&MerekType=$typeBranch&Keterangan=$information";
}
