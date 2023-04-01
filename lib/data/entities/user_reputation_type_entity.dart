import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../domain/models/models.dart';
import 'entities.dart';

part 'user_reputation_type_entity.g.dart';

class ReputationHistoryTypeEntity extends EnumClass implements BaseModel {
  static Serializer<ReputationHistoryTypeEntity> get serializer =>
      _$reputationHistoryTypeEntitySerializer;

  @BuiltValueEnumConst(wireName: 'asker_accepts_answer')
  static const ReputationHistoryTypeEntity askerAcceptsAnswer =
      _$askerAcceptsAnswer;
  @BuiltValueEnumConst(wireName: 'asker_unaccept_answer')
  static const ReputationHistoryTypeEntity askerUnacceptAnswer =
      _$askerUnacceptAnswer;
  @BuiltValueEnumConst(wireName: 'answer_accepted')
  static const ReputationHistoryTypeEntity answerAccepted = _$answerAccepted;
  @BuiltValueEnumConst(wireName: 'answer_unaccepted')
  static const ReputationHistoryTypeEntity answerUnaccepted =
      _$answerUnaccepted;
  @BuiltValueEnumConst(wireName: 'voter_undownvotes')
  static const ReputationHistoryTypeEntity voterUndownvotes =
      _$voterUndownvotes;
  @BuiltValueEnumConst(wireName: 'voter_downvotes')
  static const ReputationHistoryTypeEntity voterDownvotes = _$voterDownvotes;
  @BuiltValueEnumConst(wireName: 'post_downvoted')
  static const ReputationHistoryTypeEntity postDownvoted = _$postDownvoted;
  @BuiltValueEnumConst(wireName: 'post_undownvoted')
  static const ReputationHistoryTypeEntity postUndownvoted = _$postUndownvoted;
  @BuiltValueEnumConst(wireName: 'post_upvoted')
  static const ReputationHistoryTypeEntity postUpvoted = _$postUpvoted;
  @BuiltValueEnumConst(wireName: 'post_unupvoted')
  static const ReputationHistoryTypeEntity postUnupvoted = _$postUnupvoted;
  @BuiltValueEnumConst(wireName: 'suggested_edit_approval_received')
  static const ReputationHistoryTypeEntity suggestedEditApprovalReceived =
      _$suggestedEditApprovalReceived;
  @BuiltValueEnumConst(wireName: 'post_flagged_as_spam')
  static const ReputationHistoryTypeEntity postFlaggedAsSpam =
      _$postFlaggedAsSpam;
  @BuiltValueEnumConst(wireName: 'post_flagged_as_offensive')
  static const ReputationHistoryTypeEntity postFlaggedAsOffensive =
      _$postFlaggedAsOffensive;
  @BuiltValueEnumConst(wireName: 'bounty_given')
  static const ReputationHistoryTypeEntity bountyGiven = _$bountyGiven;
  @BuiltValueEnumConst(wireName: 'bounty_earned')
  static const ReputationHistoryTypeEntity bountyEarned = _$bountyEarned;
  @BuiltValueEnumConst(wireName: 'bounty_cancelled')
  static const ReputationHistoryTypeEntity bountyCancelled = _$bountyCancelled;
  @BuiltValueEnumConst(wireName: 'post_deleted')
  static const ReputationHistoryTypeEntity postDeleted = _$postDeleted;
  @BuiltValueEnumConst(wireName: 'post_undeleted')
  static const ReputationHistoryTypeEntity postUndeleted = _$postUndeleted;
  @BuiltValueEnumConst(wireName: 'association_bonus')
  static const ReputationHistoryTypeEntity associationBonus =
      _$associationBonus;
  @BuiltValueEnumConst(wireName: 'arbitrary_reputation_change')
  static const ReputationHistoryTypeEntity arbitraryReputationChange =
      _$arbitraryReputationChange;
  @BuiltValueEnumConst(wireName: 'vote_fraud_reversal')
  static const ReputationHistoryTypeEntity voteFraudReversal =
      _$voteFraudReversal;
  @BuiltValueEnumConst(wireName: 'post_migrated')
  static const ReputationHistoryTypeEntity postMigrated = _$postMigrated;
  @BuiltValueEnumConst(wireName: 'user_deleted')
  static const ReputationHistoryTypeEntity userDeleted = _$userDeleted;
  @BuiltValueEnumConst(wireName: 'example_upvoted')
  static const ReputationHistoryTypeEntity exampleUpvoted = _$exampleUpvoted;
  @BuiltValueEnumConst(wireName: 'example_unupvoted')
  static const ReputationHistoryTypeEntity exampleUnupvoted =
      _$exampleUnupvoted;
  @BuiltValueEnumConst(wireName: 'proposed_change_approved')
  static const ReputationHistoryTypeEntity proposedChangeApproved =
      _$proposedChangeApproved;
  @BuiltValueEnumConst(wireName: 'doc_link_upvoted')
  static const ReputationHistoryTypeEntity docLinkUpvoted = _$docLinkUpvoted;
  @BuiltValueEnumConst(wireName: 'doc_link_unupvoted')
  static const ReputationHistoryTypeEntity docLinkUnupvoted =
      _$docLinkUnupvoted;
  @BuiltValueEnumConst(wireName: 'doc_source_removed')
  static const ReputationHistoryTypeEntity docSourceRemoved =
      _$docSourceRemoved;
  @BuiltValueEnumConst(wireName: 'suggested_edit_approval_overridden')
  static const ReputationHistoryTypeEntity suggestedEditApprovalOverridden =
      _$suggestedEditApprovalOverridden;

  const ReputationHistoryTypeEntity._(String name) : super(name);

  static BuiltSet<ReputationHistoryTypeEntity> get values => _$values;
  static ReputationHistoryTypeEntity valueOf(String name) => _$valueOf(name);

  @override
  ReputationHistoryType toModel() => this ==
          ReputationHistoryTypeEntity.askerAcceptsAnswer
      ? ReputationHistoryType.askerAcceptsAnswer
      : this == ReputationHistoryTypeEntity.askerUnacceptAnswer
          ? ReputationHistoryType.askerUnacceptAnswer
          : this == ReputationHistoryTypeEntity.answerAccepted
              ? ReputationHistoryType.answerAccepted
              : this == ReputationHistoryTypeEntity.answerUnaccepted
                  ? ReputationHistoryType.answerUnaccepted
                  : this == ReputationHistoryTypeEntity.voterUndownvotes
                      ? ReputationHistoryType.voterUndownvotes
                      : this == ReputationHistoryTypeEntity.voterDownvotes
                          ? ReputationHistoryType.voterDownvotes
                          : this == ReputationHistoryTypeEntity.postDownvoted
                              ? ReputationHistoryType.postDownvoted
                              : this ==
                                      ReputationHistoryTypeEntity
                                          .postUndownvoted
                                  ? ReputationHistoryType.postUndownvoted
                                  : this ==
                                          ReputationHistoryTypeEntity
                                              .postUpvoted
                                      ? ReputationHistoryType.postUpvoted
                                      : this ==
                                              ReputationHistoryTypeEntity
                                                  .postUnupvoted
                                          ? ReputationHistoryType.postUnupvoted
                                          : this ==
                                                  ReputationHistoryTypeEntity
                                                      .suggestedEditApprovalReceived
                                              ? ReputationHistoryType
                                                  .suggestedEditApprovalReceived
                                              : this ==
                                                      ReputationHistoryTypeEntity
                                                          .postFlaggedAsSpam
                                                  ? ReputationHistoryType
                                                      .postFlaggedAsSpam
                                                  : this ==
                                                          ReputationHistoryTypeEntity
                                                              .postFlaggedAsOffensive
                                                      ? ReputationHistoryType
                                                          .postFlaggedAsOffensive
                                                      : this ==
                                                              ReputationHistoryTypeEntity
                                                                  .bountyGiven
                                                          ? ReputationHistoryType
                                                              .bountyGiven
                                                          : this ==
                                                                  ReputationHistoryTypeEntity
                                                                      .bountyEarned
                                                              ? ReputationHistoryType
                                                                  .bountyEarned
                                                              : this ==
                                                                      ReputationHistoryTypeEntity
                                                                          .bountyCancelled
                                                                  ? ReputationHistoryType
                                                                      .bountyCancelled
                                                                  : this ==
                                                                          ReputationHistoryTypeEntity
                                                                              .postDeleted
                                                                      ? ReputationHistoryType
                                                                          .postDeleted
                                                                      : this ==
                                                                              ReputationHistoryTypeEntity.postUndeleted
                                                                          ? ReputationHistoryType.postUndeleted
                                                                          : this == ReputationHistoryTypeEntity.associationBonus
                                                                              ? ReputationHistoryType.associationBonus
                                                                              : this == ReputationHistoryTypeEntity.arbitraryReputationChange
                                                                                  ? ReputationHistoryType.arbitraryReputationChange
                                                                                  : this == ReputationHistoryTypeEntity.voteFraudReversal
                                                                                      ? ReputationHistoryType.voteFraudReversal
                                                                                      : this == ReputationHistoryTypeEntity.postMigrated
                                                                                          ? ReputationHistoryType.postMigrated
                                                                                          : this == ReputationHistoryTypeEntity.userDeleted
                                                                                              ? ReputationHistoryType.userDeleted
                                                                                              : this == ReputationHistoryTypeEntity.exampleUpvoted
                                                                                                  ? ReputationHistoryType.exampleUpvoted
                                                                                                  : this == ReputationHistoryTypeEntity.exampleUnupvoted
                                                                                                      ? ReputationHistoryType.exampleUnupvoted
                                                                                                      : this == ReputationHistoryTypeEntity.proposedChangeApproved
                                                                                                          ? ReputationHistoryType.proposedChangeApproved
                                                                                                          : this == ReputationHistoryTypeEntity.docLinkUpvoted
                                                                                                              ? ReputationHistoryType.docLinkUpvoted
                                                                                                              : this == ReputationHistoryTypeEntity.docLinkUnupvoted
                                                                                                                  ? ReputationHistoryType.docLinkUnupvoted
                                                                                                                  : this == ReputationHistoryTypeEntity.docSourceRemoved
                                                                                                                      ? ReputationHistoryType.docSourceRemoved
                                                                                                                      : this == ReputationHistoryTypeEntity.suggestedEditApprovalOverridden
                                                                                                                          ? ReputationHistoryType.suggestedEditApprovalOverridden
                                                                                                                          : ReputationHistoryType.answerAccepted;
}
