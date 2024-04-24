import 'package:json_annotation/json_annotation.dart';

part 'team_stat.g.dart';

@JsonSerializable(createToJson: false)
class TeamStat {
  final String? fga;
  final String? ast;
  final String? tptfgp;
  final String? tptfgm;
  final String? fastBreakPts;
  final String? fgm;
  final String? fgp;
  final String? reb;
  final String? fta;
  final String? teamID;
  final String? poStringsInPaString;
  final String? tptfga;
  @JsonKey(name: 'OffReb')
  final String? offReb;
  final String? ftm;
  final String? blk;
  final String? tech;
  @JsonKey(name: 'DefReb')
  final String? defReb;
  final String? ftp;
  final String? largestLead;
  final String? flagrantFouls;
  final String? stl;
  final String? team;
  final String? teamAbv;
  final String? pts;
  @JsonKey(name: 'PF')
  final String? pf;
  @JsonKey(name: 'TOV')
  final String? tov;
  final String? ptsOffTOV;

  TeamStat({
    required this.fga,
    required this.ast,
    required this.tptfgp,
    required this.tptfgm,
    required this.fastBreakPts,
    required this.fgm,
    required this.fgp,
    required this.reb,
    required this.fta,
    required this.teamID,
    required this.poStringsInPaString,
    required this.tptfga,
    required this.offReb,
    required this.ftm,
    required this.blk,
    required this.tech,
    required this.defReb,
    required this.ftp,
    required this.largestLead,
    required this.flagrantFouls,
    required this.stl,
    required this.team,
    required this.teamAbv,
    required this.pts,
    required this.pf,
    required this.tov,
    required this.ptsOffTOV,
  });

  factory TeamStat.fromJson(Map<String, dynamic> json) =>
      _$TeamStatFromJson(json);
}
