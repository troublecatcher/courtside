import 'package:auto_route/auto_route.dart';
import 'package:courtside/features/matches/controller/match_provider.dart';
import 'package:courtside/features/matches/view/bottom_sheets/date_time_bottom_sheet.dart';
import 'package:courtside/features/matches/view/bottom_sheets/game_stats_bottom_sheet.dart';
import 'package:courtside/shared/cs_close_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

late StateProvider<String> dateProvider;
late StateProvider<String> gameIdProvider;

@RoutePage()
class MatchesScreen extends ConsumerStatefulWidget {
  const MatchesScreen({super.key});

  @override
  ConsumerState<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends ConsumerState<MatchesScreen> {
  @override
  void initState() {
    super.initState();
    String formattedDate = DateFormat('yyyyMMdd').format(DateTime.now());
    dateProvider = StateProvider<String>((ref) => formattedDate);
    // dateProvider = StateProvider<String>((ref) => '20240107');
  }

  @override
  Widget build(BuildContext context) {
    final matchData = ref.watch(matchProvider);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            leadingWidth: 0,
            leading: null,
            automaticallyImplyLeading: false,
            expandedHeight: 192.h,
            pinned: true,
            actions: [
              CupertinoButton(
                padding: EdgeInsets.zero,
                child: Row(
                  children: [
                    const Icon(
                      Icons.edit_calendar_rounded,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      DateFormat('dd.MM.yyyy')
                          .format(DateTime.parse(ref.watch(dateProvider))),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
                onPressed: () => showCupertinoModalPopup(
                  context: context,
                  builder: (context) => const DateTimeBottomSheet(),
                ),
              ),
            ],
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.blurBackground,
                StretchMode.zoomBackground,
              ],
              titlePadding: EdgeInsets.all(16.r),
              centerTitle: false,
              title: const Text('Matches'),
              background: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/bg/court.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Color.fromRGBO(17, 17, 17, 0),
                          Color.fromRGBO(17, 17, 17, 1),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          matchData.when(
            data: (data) {
              return SliverList.separated(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final score = data[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        SizedBox(height: 16.h),
                        Row(
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
                                Text(score.home),
                              ],
                            ),
                            Column(
                              children: [
                                Text(score.gameStatus),
                                SizedBox(height: 8.h),
                                Row(
                                  children: [
                                    Text(score.homePts.isEmpty
                                        ? '0'
                                        : score.homePts),
                                    const Text(' - '),
                                    Text(score.awayPts.isEmpty
                                        ? '0'
                                        : score.awayPts),
                                  ],
                                ),
                                Text(DateFormat('HH:mm').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        double.parse(score.gameTimeEpoch)
                                                .toInt() *
                                            1000))),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'assets/icon.png',
                                  width: 48.r,
                                  height: 48.r,
                                ),
                                SizedBox(height: 8.h),
                                Text(score.away),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(
                                color:
                                    const Color.fromRGBO(250, 250, 250, 0.14)),
                          ),
                          child: CupertinoButton(
                            color: Colors.transparent,
                            onPressed: () => showModalBottomSheet(
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10.r),
                                ),
                              ),
                              context: context,
                              builder: (context) =>
                                  GameStatsBottomSheet(score: score),
                            ),
                            child: const Text('Game stats'),
                          ),
                        ),
                        SizedBox(height: 16.h),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  indent: 16.w,
                  endIndent: 16.w,
                  color: Colors.grey,
                ),
              );
            },
            error: (error, stackTrace) => SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 100.h),
                  child: const Text('No matches for the selected date'),
                ),
              ),
            ),
            loading: () => SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 100.h),
                  child: const CupertinoActivityIndicator(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
