import 'package:equatable/equatable.dart';

class PaginationModel<T> extends Equatable {
  final List<T> items;
  final bool isMore;
  final int max;
  final int remaining;

  const PaginationModel(
      {required this.items,
      required this.isMore,
      required this.max,
      required this.remaining});

  factory PaginationModel.empty() => PaginationModel<T>(
      items: List<T>.empty(growable: true),
      isMore: false,
      max: 0,
      remaining: 0);

  PaginationModel<T> addAll(PaginationModel<T> pagination) =>
      PaginationModel<T>(
          items: items..addAll(pagination.items),
          isMore: pagination.isMore,
          max: pagination.max,
          remaining: pagination.remaining);

  @override
  List<Object?> get props => [isMore, max, remaining, items];
}
