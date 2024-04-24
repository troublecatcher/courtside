import 'package:json_annotation/json_annotation.dart';

part 'score.g.dart';

@JsonSerializable(createToJson: false)
class Score {
  final String away;
  final String home;
  final String gameID;
  final String awayPts;
  final String homePts;
  final String gameClock;
  final String gameStatus;
  final String gameTime;
  @JsonKey(name: 'gameTime_epoch')
  final String gameTimeEpoch;

  Score({
    required this.away,
    required this.home,
    required this.gameID,
    required this.awayPts,
    required this.homePts,
    required this.gameClock,
    required this.gameStatus,
    required this.gameTime,
    required this.gameTimeEpoch,
  });

  factory Score.fromJson(Map<String, dynamic> json) => _$ScoreFromJson(json);
}
