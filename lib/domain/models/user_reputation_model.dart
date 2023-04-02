import 'package:equatable/equatable.dart';

class UserReputationModel extends Equatable {
  final ReputationHistoryType type;
  final int change;
  final int? postId;
  final DateTime createdData;

  const UserReputationModel(
      this.type, this.change, this.postId, this.createdData);

  @override
  List<Object?> get props => [type, change, createdData];
}

enum ReputationHistoryType {
  askerAcceptsAnswer,
  askerUnacceptAnswer,
  answerAccepted,
  answerUnaccepted,
  voterUndownvotes,
  voterDownvotes,
  postDownvoted,
  postUndownvoted,
  postUpvoted,
  postUnupvoted,
  suggestedEditApprovalReceived,
  postFlaggedAsSpam,
  postFlaggedAsOffensive,
  bountyGiven,
  bountyEarned,
  bountyCancelled,
  postDeleted,
  postUndeleted,
  associationBonus,
  arbitraryReputationChange,
  voteFraudReversal,
  postMigrated,
  userDeleted,
  exampleUpvoted,
  exampleUnupvoted,
  proposedChangeApproved,
  docLinkUpvoted,
  docLinkUnupvoted,
  docSourceRemoved,
  suggestedEditApprovalOverridden,
}
