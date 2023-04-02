import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'entities.dart';

part 'pagination_entity.g.dart';

abstract class PaginationEntity<T>
    implements Built<PaginationEntity<T>, PaginationEntityBuilder<T>> {
  static Serializer<PaginationEntity> get serializer =>
      _$paginationEntitySerializer;

  BuiltList<T> get items;
  @BuiltValueField(wireName: 'has_more')
  bool get isMore;
  @BuiltValueField(wireName: 'quota_max')
  int get max;
  @BuiltValueField(wireName: 'quota_remaining')
  int get remaining;

  PaginationEntity._();
  factory PaginationEntity([Function(PaginationEntityBuilder<T>) updates]) =
      _$PaginationEntity<T>;

  /* static PaginationEntity<T> fromJson<T>(Map<String, dynamic> json) {
    final specifiedType = FullType(PaginationEntity, [FullType(T)]);
    final serializersWithBuilder = (serializers.toBuilder()
          ..addBuilderFactory(specifiedType, () => PaginationEntityBuilder<T>())
          ..addBuilderFactory(
              FullType(BuiltList, [FullType(T)]), () => ListBuilder<T>()))
        .build();
          return serializersWithBuilder.deserialize(json,
        specifiedType: specifiedType) as PaginationEntity<T>;
  } */

  static PaginationEntity<T> fromJson<T>(Map<String, dynamic> json) {
    final specifiedType = FullType(PaginationEntity, [FullType(T)]);
    final serializersWithBuilder = (serializers.toBuilder()
          ..addBuilderFactory(specifiedType, () => PaginationEntityBuilder<T>())
          ..addBuilderFactory(
              FullType(BuiltList, [FullType(T)]), () => ListBuilder<T>()))
        .build();
    return serializersWithBuilder.deserialize(json,
        specifiedType: specifiedType) as PaginationEntity<T>;
  }
}
