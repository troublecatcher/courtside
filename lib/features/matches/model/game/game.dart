import 'package:courtside/features/matches/model/line_score/line_score.dart';
import 'package:courtside/features/matches/model/team_stat/team_stat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game.g.dart';

@JsonSerializable(createToJson: false)
class Game {
  final String? gameStatus;
  final String? gameDate;
  final String? arenaCapacity;
  final String? referees;
  final String? arena;
  final Map<String, TeamStat>? teamStats;
  final Map<String, LineScore>? lineScore;
  final String? awayResult;
  final String? homeResult;
  final String? homePts;
  final String? awayPts;
  final String? gameLocation;

  Game({
    required this.gameStatus,
    required this.gameDate,
    required this.arenaCapacity,
    required this.referees,
    required this.arena,
    required this.teamStats,
    required this.lineScore,
    required this.awayResult,
    required this.homeResult,
    required this.homePts,
    required this.awayPts,
    required this.gameLocation,
  });

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
}
