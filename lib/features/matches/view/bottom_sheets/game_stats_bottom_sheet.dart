import 'package:auto_route/auto_route.dart';
import 'package:courtside/features/matches/controller/match_info_provider.dart';
import 'package:courtside/features/matches/view/matches_screen.dart';
import 'package:courtside/features/matches/model/score/score.dart';
import 'package:courtside/shared/cs_close_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class GameStatsBottomSheet extends ConsumerStatefulWidget {
  final Score score;
  const GameStatsBottomSheet({super.key, required this.score});

  @override
  ConsumerState<GameStatsBottomSheet> createState() =>
      _GameStatsBottomSheetState();
}

class _GameStatsBottomSheetState extends ConsumerState<GameStatsBottomSheet> {
  @override
  void initState() {
    super.initState();
    // gameIdProvider = StateProvider<String>((ref) => widget.score.gameID);
    gameIdProvider = StateProvider<String>((ref) => widget.score.gameID);
  }

  @override
  Widget build(BuildContext context) {
    final matchInfoData = ref.watch(matchInfoProvider);
    return IntrinsicHeight(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
          color: const Color.fromRGBO(17, 17, 17, 1),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.r)),
                  child: Image.asset(
                    'assets/bg/game.png',
                    height: 192.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 192.h,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(17, 17, 17, 0),
                        Color.fromRGBO(17, 17, 17, 1),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 6.h),
                      Container(
                        height: 5.h,
                        width: 36.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.5.r),
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          const Expanded(
                            child: SizedBox.shrink(),
                          ),
                          const Expanded(
                              child: Text(
                            'Game stats',
                            textAlign: TextAlign.center,
                          )),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 16.w),
                                child: const CSCloseButton(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 44.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 73.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  'assets/icon.png',
                                  width: 48.r,
                                  height: 48.r,
                                ),
                                SizedBox(height: 8.h),
                                Text(widget.score.home),
                              ],
                            ),
                            const Text('vs'),
                            Column(
                              children: [
                                Image.asset(
                                  'assets/icon.png',
                                  width: 48.r,
                                  height: 48.r,
                                ),
                                SizedBox(height: 8.h),
                                Text(widget.score.away),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (widget.score.gameStatus == 'Not Started Yet')
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100.h),
                child: Text(
                    'Scheduled for ${DateFormat('dd.MM.yyyy').format(DateTime.fromMillisecondsSinceEpoch(double.parse(widget.score.gameTimeEpoch).toInt() * 1000))}, ${DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(double.parse(widget.score.gameTimeEpoch).toInt() * 1000))}'),
              )
            else
              matchInfoData.when(
                data: (data) {
                  return Column(
                    children: [
                      SizedBox(height: 16.h),
                      Container(
                        padding: EdgeInsets.all(16.r),
                        margin: EdgeInsets.symmetric(horizontal: 16.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                              color: const Color.fromRGBO(250, 250, 250, 0.08),
                              width: 1),
                        ),
                        child: FittedBox(
                          child: DataTable(
                            dividerThickness: 0,
                            columns: const [
                              DataColumn(label: Text('')),
                              DataColumn(label: Text('AST')),
                              DataColumn(label: Text('BLK')),
                              DataColumn(label: Text('REB')),
                              DataColumn(label: Text('TOV')),
                              DataColumn(label: Text('STL')),
                            ],
                            rows: [
                              DataRow(
                                cells: [
                                  DataCell(Text(widget.score.home)),
                                  DataCell(
                                    Text(data
                                        .teamStats![widget.score.home]!.ast!),
                                  ),
                                  DataCell(
                                    Text(data
                                        .teamStats![widget.score.home]!.blk!),
                                  ),
                                  DataCell(
                                    Text(data
                                        .teamStats![widget.score.home]!.reb!),
                                  ),
                                  DataCell(
                                    Text(data
                                        .teamStats![widget.score.home]!.tov!),
                                  ),
                                  DataCell(
                                    Text(data
                                        .teamStats![widget.score.home]!.stl!),
                                  ),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(Text(widget.score.away)),
                                  DataCell(
                                    Text(data
                                        .teamStats![widget.score.away]!.ast!),
                                  ),
                                  DataCell(
                                    Text(data
                                        .teamStats![widget.score.away]!.blk!),
                                  ),
                                  DataCell(
                                    Text(data
                                        .teamStats![widget.score.away]!.reb!),
                                  ),
                                  DataCell(
                                    Text(data
                                        .teamStats![widget.score.away]!.tov!),
                                  ),
                                  DataCell(
                                    Text(data
                                        .teamStats![widget.score.away]!.stl!),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        padding: EdgeInsets.all(16.r),
                        margin: EdgeInsets.symmetric(horizontal: 16.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                              color: const Color.fromRGBO(250, 250, 250, 0.08),
                              width: 1),
                        ),
                        child: FittedBox(
                          child: DataTable(
                            dividerThickness: 0,
                            columns: const [
                              DataColumn(label: Text('')),
                              DataColumn(label: Text('Q1')),
                              DataColumn(label: Text('Q2')),
                              DataColumn(label: Text('Q3')),
                              DataColumn(label: Text('Q4')),
                              DataColumn(label: Text('Total')),
                            ],
                            rows: [
                              DataRow(
                                cells: [
                                  DataCell(Text(widget.score.home)),
                                  DataCell(
                                    Text(data
                                        .lineScore![widget.score.home]!.q1!),
                                  ),
                                  DataCell(
                                    Text(data
                                        .lineScore![widget.score.home]!.q2!),
                                  ),
                                  DataCell(
                                    Text(data
                                        .lineScore![widget.score.home]!.q3!),
                                  ),
                                  DataCell(
                                    Text(data
                                        .lineScore![widget.score.home]!.q4!),
                                  ),
                                  DataCell(
                                    Text(data.lineScore![widget.score.home]!
                                        .totalPts!),
                                  ),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(Text(widget.score.away)),
                                  DataCell(
                                    Text(data
                                        .lineScore![widget.score.away]!.q1!),
                                  ),
                                  DataCell(
                                    Text(data
                                        .lineScore![widget.score.away]!.q2!),
                                  ),
                                  DataCell(
                                    Text(data
                                        .lineScore![widget.score.away]!.q3!),
                                  ),
                                  DataCell(
                                    Text(data
                                        .lineScore![widget.score.away]!.q4!),
                                  ),
                                  DataCell(
                                    Text(data.lineScore![widget.score.away]!
                                        .totalPts!),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Text(DateFormat('EEEE d MMMM yyyy')
                                        .format(
                                            DateTime.fromMillisecondsSinceEpoch(
                                                double.parse(widget.score
                                                            .gameTimeEpoch)
                                                        .toInt() *
                                                    1000)))),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    DateFormat('HH:mm').format(
                                        DateTime.fromMillisecondsSinceEpoch(
                                            double.parse(widget
                                                        .score.gameTimeEpoch)
                                                    .toInt() *
                                                1000)),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4.h),
                            Row(
                              children: [
                                Expanded(child: Text(data.arena!)),
                                Expanded(
                                    child: Text(
                                  data.gameLocation!,
                                  textAlign: TextAlign.end,
                                )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                error: (error, stackTrace) => Padding(
                  padding: EdgeInsets.only(bottom: 200.h),
                  child: Text(error.toString()),
                ),
                loading: () => Padding(
                  padding: EdgeInsets.only(bottom: 200.h),
                  child: const CupertinoActivityIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
