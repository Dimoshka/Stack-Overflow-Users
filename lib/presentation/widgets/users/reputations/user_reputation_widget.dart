import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/models/models.dart';
import 'cubit/user_reputation_cubit.dart';
import 'user_reputation_list_item_widget.dart';

class UserReputationsWidget extends StatefulWidget {
  final int? userId;

  const UserReputationsWidget({super.key, required this.userId});

  @override
  State<UserReputationsWidget> createState() => _UserReputationsWidgetState();
}

class _UserReputationsWidgetState extends State<UserReputationsWidget> {
  final _scrollController = ScrollController();
  final int _limit = 30;

  PaginationModel<UserReputationModel> _reputations =
      PaginationModel<UserReputationModel>.empty();

  bool _isNowLoadinMore = false;
  int _page = 1;

  @override
  void initState() {
    super.initState();
    if (widget.userId == null) return;
    _scrollController.addListener(() {
      if (!_reputations.isMore || _isNowLoadinMore) return;
      if (_scrollController.position.maxScrollExtent <=
          _scrollController.offset + 400) {
        _isNowLoadinMore = true;
        _page += 1;
        context
            .read<UserReputationCubit>()
            .loadReputations(widget.userId!, _page, _limit);
      }
    });
    context
        .read<UserReputationCubit>()
        .loadReputations(widget.userId!, _page, _limit);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocListener<UserReputationCubit, UserReputationState>(
        listenWhen: (_, current) => current is ReputationsLoaded,
        listener: (context, state) {
          if (state is ReputationsLoaded) {
            _isNowLoadinMore = false;
            _reputations = _reputations.addAll(state.reputations);
          }
        },
        child: BlocBuilder<UserReputationCubit, UserReputationState>(
          builder: (context, state) {
            return Expanded(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _reputations.items.length,
                itemBuilder: (context, index) => UserReputationListItemWidget(
                  reputation: _reputations.items[index],
                  onTap: () {},
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
