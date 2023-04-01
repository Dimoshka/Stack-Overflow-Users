import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../domain/models/models.dart';
import 'entities.dart';

part 'user_reputation_entity.g.dart';

abstract class UserReputationEntiry
    implements
        BaseModel,
        Built<UserReputationEntiry, UserReputationEntiryBuilder> {
  static Serializer<UserReputationEntiry> get serializer =>
      _$userReputationEntirySerializer;

  @BuiltValueField(wireName: 'reputation_history_type')
  ReputationHistoryTypeEntity get type;
  @BuiltValueField(wireName: 'reputation_change')
  int get change;
  @BuiltValueField(wireName: 'post_id')
  int? get postId;
  @BuiltValueField(wireName: 'creation_date')
  int get createdData;

  UserReputationEntiry._();
  factory UserReputationEntiry(
          [void Function(UserReputationEntiryBuilder) updates]) =
      _$UserReputationEntiry;

  @override
  UserReputationModel toModel() => UserReputationModel(type.toModel(), change,
      postId, DateTime.fromMillisecondsSinceEpoch(createdData * 1000));
}
