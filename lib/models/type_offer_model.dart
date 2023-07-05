class TypeOfferModel {
  final int id;
  final String name;

  TypeOfferModel({required this.id, required this.name});

  factory TypeOfferModel.fromJson(Map<String, dynamic> json) {
    return TypeOfferModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
