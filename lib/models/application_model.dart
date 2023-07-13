import 'user_model.dart';

class Application {
  final int id;
  final UserModel user;
  final int offerId;
  final String cv;
  final String motivationLetter;
  final String status;

  Application({
    required this.id,
    required this.user,
    required this.offerId,
    required this.cv,
    required this.motivationLetter,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user.toJson(),
      'offer_id': offerId,
      'cv': cv,
      'motivation_letter': motivationLetter,
      'status': status,
    };
  }

  factory Application.fromJson(Map<String, dynamic> json) {
    return Application(
      id: json['id'],
      user: UserModel.fromJson(json['user']),
      offerId: json['offer_id'],
      cv: json['cv'],
      motivationLetter: json['motivation_letter'],
      status: json['status'],
    );
  }
}
