import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../domain/models/models.dart';

class UserReputationListItemWidget extends StatelessWidget {
  final UserReputationModel reputation;
  final VoidCallback? onTap;

  const UserReputationListItemWidget(
      {super.key, required this.reputation, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(DateFormat.yMEd().format(reputation.createdData)),
      subtitle: Text(reputation.type.name),
      trailing: Text(reputation.change.toString()),
    );
  }
}
