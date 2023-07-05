
// offer_model.dart
class Offer {
  int id;
  int typeOfferId;
  int domainId;
  String description;
  DateTime dateStart;
  DateTime dateEnd;
  int availablePlaces;
  String status;

  Offer({
    required this.id,
    required this.typeOfferId,
    required this.domainId,
    required this.description,
    required this.dateStart,
    required this.dateEnd,
    required this.availablePlaces,
    required this.status,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      id: json['id'],
      typeOfferId: json['type_offer_id'],
      domainId: json['domain_id'],
      description: json['description'],
      dateStart: DateTime.parse(json['date_start']),
      dateEnd: DateTime.parse(json['date_end']),
      availablePlaces: json['available_places'],
      status: json['status'],
    );
  }
}