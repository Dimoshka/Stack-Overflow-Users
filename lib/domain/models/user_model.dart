import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int id;
  final String name;
  final String avatar;
  final int reputation;
  final String? location;
  final DateTime? age;
  final bool inBookmark;

  const UserModel({
    required this.id,
    required this.name,
    required this.avatar,
    required this.reputation,
    this.location,
    this.age,
    required this.inBookmark,
  });

  UserModel copyWith(bool inBookmark) => UserModel(
        id: id,
        name: name,
        avatar: avatar,
        reputation: reputation,
        location: location,
        age: age,
        inBookmark: inBookmark,
      );

  @override
  List<Object?> get props => [id, name];
}
