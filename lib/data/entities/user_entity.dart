import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../domain/models/models.dart';
import 'entities.dart';

part 'user_entity.g.dart';

abstract class UserEntity implements BaseModel, Built<UserEntity, UserEntityBuilder> {
  static Serializer<UserEntity> get serializer => _$userEntitySerializer;

  @BuiltValueField(wireName: 'user_id')
  int get id;
  @BuiltValueField(wireName: 'display_name')
  String get name;
  @BuiltValueField(wireName: 'profile_image')
  String get avatar;
  int get reputation;
  String? get location;
  DateTime? get age;

  UserEntity._();
  factory UserEntity([void Function(UserEntityBuilder) updates]) = _$UserEntity;

  @override
  UserModel toModel() => UserModel(
        id: id,
        name: name,
        avatar: avatar,
        reputation: reputation,
        location: location,
        age: age,
        inBookmark: false,
      );
}
