class Offer {
  final int id;
  final int typeOfferId;
  final int domainId;
  final String title;
  final String description;
  final DateTime dateStart;
  final DateTime dateEnd;
  final int availablePlaces;
  final String status;
  final List<Level> levels;

  TypeOffer? typeOffer;
  Domain? domain;

  Offer({
    required this.id,
    required this.typeOfferId,
    required this.domainId,
    required this.title,
    required this.description,
    required this.dateStart,
    required this.dateEnd,
    required this.availablePlaces,
    required this.status,
    required this.levels,
    this.typeOffer,
    this.domain,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    List<dynamic> levelsJson = json['levels'] ?? [];
    List<Level> levels =
        levelsJson.map((levelJson) => Level.fromJson(levelJson)).toList();

    return Offer(
      id: json['id'],
      typeOfferId: json['type_offer_id'],
      domainId: json['domain_id'],
      title: json['title'],
      description: json['description'],
      dateStart: DateTime.parse(json['date_start']),
      dateEnd: DateTime.parse(json['date_end']),
      availablePlaces: json['available_places'],
      status: json['status'],
      levels: levels,
    );
  }
}

class TypeOffer {
  final int id;
  final String name;

  TypeOffer({required this.id, required this.name});

  factory TypeOffer.fromJson(Map<String, dynamic> json) {
    return TypeOffer(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Domain {
  final int id;
  final String name;

  Domain({required this.id, required this.name});

  factory Domain.fromJson(Map<String, dynamic> json) {
    return Domain(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Level {
  final int id;
  final String name;

  Level({required this.id, required this.name});

  factory Level.fromJson(Map<String, dynamic> json) {
    return Level(
      id: json['id'],
      name: json['name'],
    );
  }
}
