import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'entities.dart';

part 'pagination_users_entity.g.dart';

abstract class PaginationUsersEntity
    implements Built<PaginationUsersEntity, PaginationUsersEntityBuilder> {
  static Serializer<PaginationUsersEntity> get serializer =>
      _$paginationUsersEntitySerializer;

  BuiltList<UserEntity> get items;
  @BuiltValueField(wireName: 'has_more')
  bool get isMore;
  @BuiltValueField(wireName: 'quota_max')
  int get max;
  @BuiltValueField(wireName: 'quota_remaining')
  int get remaining;

  PaginationUsersEntity._();
  factory PaginationUsersEntity(
          [Function(PaginationUsersEntityBuilder) updates]) =
      _$PaginationUsersEntity;
}
