class FormModel {
  String id;
  String name;
  String idPel;
  String phone;
  String jenisEv;
  String brandType;
  String? description;

  FormModel({
    required this.id,
    required this.name,
    required this.idPel,
    required this.phone,
    required this.jenisEv,
    required this.brandType,
    this.description,
  });

  FormModel copyWith({
    String? id,
    String? name,
    String? idPel,
    String? phone,
    String? jenisEv,
    String? brandType,
    String? description,
  }) {
    return FormModel(
      id: id ?? this.id,
      name: name ?? this.name,
      idPel: idPel ?? this.idPel,
      phone: phone ?? this.phone,
      jenisEv: jenisEv ?? this.jenisEv,
      brandType: brandType ?? this.brandType,
      description: description ?? this.description,
    );
  }
}
