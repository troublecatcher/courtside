import 'package:json_annotation/json_annotation.dart';

part 'line_score.g.dart';

@JsonSerializable(createToJson: false)
class LineScore {
  final String? totalPts;
  @JsonKey(name: '1Q')
  final String? q1;
  @JsonKey(name: '2Q')
  final String? q2;
  @JsonKey(name: '3Q')
  final String? q3;
  @JsonKey(name: '4Q')
  final String? q4;

  LineScore({
    required this.totalPts,
    required this.q1,
    required this.q2,
    required this.q3,
    required this.q4,
  });

  factory LineScore.fromJson(Map<String, dynamic> json) =>
      _$LineScoreFromJson(json);
}
