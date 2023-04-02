import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../domain/models/models.dart';

class UserListItemWidget extends StatelessWidget {
  final UserModel user;
  final VoidCallback? onTap;
  final VoidCallback? onBookmark;
  final bool isSelected;

  const UserListItemWidget(
      {super.key,
      required this.user,
      this.onTap,
      this.onBookmark,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: isSelected,
      onTap: onTap,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(48.0),
        child: CachedNetworkImage(
          imageUrl: user.avatar,
          width: 48.0,
          height: 48.0,
        ),
      ),
      title: Text(user.age != null
          ? '${user.name} (${DateFormat.yMEd().format(user.age!)})'
          : user.name),
      subtitle: Text(user.location ?? ''),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(user.reputation.toString()),
          const SizedBox(
            width: 8.0,
          ),
          IconButton(
              onPressed: onBookmark,
              icon: Icon(
                user.inBookmark ? Icons.bookmark_remove : Icons.bookmark_add,
                color: user.inBookmark
                    ? Theme.of(context).colorScheme.secondary
                    : null,
              ))
        ],
      ),
    );
  }
}
