library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'pagination_entity.dart';
import 'pagination_user_reputations_entity.dart';
import 'pagination_users_entity.dart';
import 'user_entity.dart';
import 'user_reputation_entity.dart';
import 'user_reputation_type_entity.dart';

export 'pagination_entity.dart';
export 'pagination_user_reputations_entity.dart';
export 'pagination_users_entity.dart';
export 'user_entity.dart';
export 'user_reputation_entity.dart';
export 'user_reputation_type_entity.dart';

part 'entities.g.dart';

@SerializersFor([
  UserEntity,
  UserReputationEntiry,
  ReputationHistoryTypeEntity,
  PaginationEntity,
  PaginationUsersEntity,
  PaginationUserReputationsEntity,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(Iso8601DateTimeSerializer()))
    .build();

abstract class BaseModel<T> {
  T toModel();
}
