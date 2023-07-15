import 'auth_model.dart';

class Application {
  final int id;
  final int offerId;
  final int userId;
  final String cv;
  final String motivationLetter;
  final String status;

  Application({
    required this.id,
    required this.offerId,
    required this.userId,
    required this.cv,
    required this.motivationLetter,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'offer_id': offerId,
      'user_id': userId,
      'cv': cv,
      'motivation_letter': motivationLetter,
      'status': status,
    };
  }

  factory Application.fromJson(Map<String, dynamic> json) {
    return Application(
      id: json['id'],
      offerId: json['offer_id'],
      userId: json['user_id'],
      cv: json['cv'],
      motivationLetter: json['motivation_letter'],
      status: json['status'],
    );
  }
}
