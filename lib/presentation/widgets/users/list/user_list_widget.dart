import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_route.dart';
import '../../../../domain/models/models.dart';
import 'cubit/user_list_cubit.dart';
import 'user_list_item_widget.dart';

class UserListWidget extends StatefulWidget {
  final int? selectedUserId;

  const UserListWidget({super.key, this.selectedUserId});

  @override
  State<UserListWidget> createState() => _UserListWidgetState();
}

class _UserListWidgetState extends State<UserListWidget> {
  final _searchController = TextEditingController();
  final _filteredUsers = List<UserModel>.empty(growable: true);
  final _scrollController = ScrollController();
  final int _limit = 30;

  PaginationModel<UserModel> _users = PaginationModel<UserModel>.empty();
  Set<int> _userBookmarked = Set<int>.identity();

  bool _isNowLoadinMore = false;
  int _page = 1;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearch);
    _scrollController.addListener(() {
      if (!_users.isMore || _isNowLoadinMore) return;
      if (_scrollController.position.maxScrollExtent <=
          _scrollController.offset + 400) {
        _isNowLoadinMore = true;
        _page += 1;
        context.read<UserListCubit>().loadUsers(_page, _limit);
      }
    });
    context.read<UserListCubit>().loadUsers(_page, _limit);
    context.read<UserListCubit>().loadBookmarks();
  }

  @override
  void didUpdateWidget(covariant UserListWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedUserId != widget.selectedUserId) {
      setState(() {});
    }
  }

  void _onSearch() {
    if (_users.items.isNotEmpty && _searchController.text.isNotEmpty) {
      _filteredUsers.clear();
      _filteredUsers.addAll(_users.items.where((element) => element.name
          .toLowerCase()
          .contains(_searchController.text.toLowerCase())));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocListener<UserListCubit, UserListState>(
        listener: (context, state) {
          if (state is UsersLoaded) {
            _isNowLoadinMore = false;
            _users = _users.addAll(state.users);
            _filteredUsers.clear();
            _filteredUsers.addAll(_users.items);
          } else if (state is BookmarksLoaded) {
            _userBookmarked.clear();
            _userBookmarked.addAll(state.userBookmarked);
          }
        },
        child: BlocBuilder<UserListCubit, UserListState>(
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                        icon: const Icon(Icons.search),
                        label: Text(AppLocalizations.of(context)!.search),
                        suffix: IconButton(
                            onPressed: () => setState(() {
                                  _searchController.clear();
                                  _filteredUsers.clear();
                                  _filteredUsers.addAll(_users.items);
                                }),
                            icon: const Icon(Icons.clear))),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: _filteredUsers.length,
                    itemBuilder: (context, index) {
                      final user = _filteredUsers[index];
                      final inBookmark = _userBookmarked.contains(user.id);
                      return UserListItemWidget(
                        user: user.copyWith(inBookmark),
                        isSelected: user.id == widget.selectedUserId,
                        onTap: () => context.goNamed(
                            AppRoute.reputationsRouteName,
                            params: {'userId': user.id.toString()}),
                        onBookmark: () => context
                            .read<UserListCubit>()
                            .changeBookmark(user.id, inBookmark),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearch);
    _searchController.dispose();
    super.dispose();
  }
}
