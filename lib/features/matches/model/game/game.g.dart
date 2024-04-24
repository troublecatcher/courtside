// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) => Game(
      gameStatus: json['gameStatus'] as String?,
      gameDate: json['gameDate'] as String?,
      arenaCapacity: json['arenaCapacity'] as String?,
      referees: json['referees'] as String?,
      arena: json['arena'] as String?,
      teamStats: (json['teamStats'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, TeamStat.fromJson(e as Map<String, dynamic>)),
      ),
      lineScore: (json['lineScore'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, LineScore.fromJson(e as Map<String, dynamic>)),
      ),
      awayResult: json['awayResult'] as String?,
      homeResult: json['homeResult'] as String?,
      homePts: json['homePts'] as String?,
      awayPts: json['awayPts'] as String?,
      gameLocation: json['gameLocation'] as String?,
    );
