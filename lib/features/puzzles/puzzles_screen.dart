import 'package:auto_route/auto_route.dart';
import 'package:courtside/app/router/router.dart';
import 'package:courtside/features/puzzles/puzzles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class PuzzlesScreen extends StatelessWidget {
  const PuzzlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              largeTitle: const Text(
                'Puzzles',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 4.h),
                    GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      mainAxisSpacing: 8.r,
                      crossAxisSpacing: 8.r,
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: List.generate(6, (index) {
                        final puzzle = Puzzle.values[index];
                        return CupertinoButton(
                          padding: EdgeInsets.zero,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.r),
                                child: Image.asset(
                                  'assets/puzzles/full/${index + 1}.jpg',
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
                                      Color.fromRGBO(17, 17, 17, 0.75),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: EdgeInsets.all(16.r),
                                  child: Text(
                                    puzzle.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18.sp,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          onPressed: () => context.router
                              .push(PuzzlesSolvingRoute(puzzle: puzzle)),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
