import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'entities.dart';

part 'pagination_user_reputations_entity.g.dart';

abstract class PaginationUserReputationsEntity
    implements
        Built<PaginationUserReputationsEntity,
            PaginationUserReputationsEntityBuilder> {
  static Serializer<PaginationUserReputationsEntity> get serializer =>
      _$paginationUserReputationsEntitySerializer;

  BuiltList<UserReputationEntiry> get items;
  @BuiltValueField(wireName: 'has_more')
  bool get isMore;
  @BuiltValueField(wireName: 'quota_max')
  int get max;
  @BuiltValueField(wireName: 'quota_remaining')
  int get remaining;

  PaginationUserReputationsEntity._();
  factory PaginationUserReputationsEntity(
          [Function(PaginationUserReputationsEntityBuilder) updates]) =
      _$PaginationUserReputationsEntity;
}
