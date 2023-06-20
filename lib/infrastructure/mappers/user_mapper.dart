import 'package:kpgeodataapp/domain/domain.dart';

class UserMapper {
  static User userJsontToEntity(Map<String, dynamic> json) => User(
      id: json['id'],
      email: json['email'],
      fullName: json['fullName'],
      roles: List<String>.from(json['roles'].map((role) => role)),
      token: json['token'] ?? '');
}
