import 'package:auto_route/auto_route.dart';
import 'package:confetti/confetti.dart';
import 'package:courtside/features/puzzles/puzzles.dart';
import 'package:courtside/shared/cs_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';

@RoutePage()
class PuzzlesSolvingScreen extends StatefulWidget {
  final Puzzle puzzle;
  const PuzzlesSolvingScreen({super.key, required this.puzzle});

  @override
  _PuzzlesSolvingScreenState createState() => _PuzzlesSolvingScreenState();
}

class _PuzzlesSolvingScreenState extends State<PuzzlesSolvingScreen> {
  late List<List<int>> puzzleGrid;
  late int emptyTileRow, emptyTileCol;
  late ConfettiController confettiController;
  bool inProgress = false;

  @override
  void initState() {
    super.initState();
    initializePuzzleGrid();
    confettiController =
        ConfettiController(duration: const Duration(milliseconds: 800));
  }

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }

  void initializePuzzleGrid() {
    puzzleGrid = [];
    List<int> puzzlePieces = List.generate(15, (index) => index);

    puzzlePieces.shuffle();

    for (int i = 0; i < 4; i++) {
      List<int> row = [];
      for (int j = 0; j < 4; j++) {
        if (i == 3 && j == 3) {
          row.add(15);
          emptyTileRow = i;
          emptyTileCol = j;
        } else {
          row.add(puzzlePieces.removeAt(0));
        }
      }
      puzzleGrid.add(row);
    }
  }

  void handleDrag(int row, int col, DragUpdateDetails details) {
    if (details.delta.dx.abs() > details.delta.dy.abs()) {
      if (details.delta.dx > 0) {
        moveTile(row, col, row, col + 1);
      } else {
        moveTile(row, col, row, col - 1);
      }
    } else {
      if (details.delta.dy > 0) {
        moveTile(row, col, row + 1, col);
      } else {
        moveTile(row, col, row - 1, col);
      }
    }
  }

  void moveTile(int oldRow, int oldCol, int newRow, int newCol) {
    if (newRow >= 0 &&
        newRow < 4 &&
        newCol >= 0 &&
        newCol < 4 &&
        puzzleGrid[newRow][newCol] == 15) {
      setState(() {
        puzzleGrid[newRow][newCol] = puzzleGrid[oldRow][oldCol];
        puzzleGrid[oldRow][oldCol] = 15;
        emptyTileRow = newRow;
        emptyTileCol = newCol;
        checkIfPuzzleSolved();
      });
    }
  }

  void checkIfPuzzleSolved() {
    int expectedValue = 0;
    for (int row = 0; row < 4; row++) {
      for (int col = 0; col < 4; col++) {
        if (puzzleGrid[row][col] != expectedValue) {
          return;
        }
        expectedValue++;
      }
    }
    setState(() {
      confettiController.play();
      inProgress = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        padding: EdgeInsetsDirectional.zero,
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => context.router.popForced(),
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
        ),
        middle: Column(
          children: [
            Text(
              'Puzzles',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white, fontSize: 16),
            ),
            Text(
              widget.puzzle.name,
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 500),
                  crossFadeState: inProgress
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  firstChild: Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Image.asset(
                        'assets/puzzles/full/${widget.puzzle.index + 1}.jpg'),
                  ),
                  secondChild: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(16.r),
                    crossAxisSpacing: 4.r,
                    mainAxisSpacing: 4.r,
                    crossAxisCount: 4,
                    children: List.generate(16, (index) {
                      final row = index ~/ 4;
                      final col = index % 4;
                      final tileValue = puzzleGrid[row][col];

                      if (tileValue == 15) {
                        return Opacity(
                          opacity: 0.2,
                          child: Image.asset(
                            'assets/puzzles/${widget.puzzle.index + 1}/${tileValue + 1}.png',
                          ),
                        );
                      }
                      return GestureDetector(
                        onPanUpdate: (details) => handleDrag(row, col, details),
                        child: Image.asset(
                          'assets/puzzles/${widget.puzzle.index + 1}/${tileValue + 1}.png',
                        ),
                      );
                    }),
                  ),
                ),
                CSButton(
                  title: !inProgress ? 'Shuffle' : 'Restart',
                  onPressed: () {
                    setState(() {
                      if (!inProgress) {
                        initializePuzzleGrid();
                      }
                      inProgress = !inProgress;
                    });
                  },
                ),
                SizedBox(height: 8.h),
                Material(
                  color: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: const Text(
                        'When you press the Shuffle button, the game will start.'),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: confettiController,
                blastDirection: pi / 2,
                numberOfParticles: 20,
                emissionFrequency: 0.5,
                blastDirectionality: BlastDirectionality.explosive,
                gravity: 0.3,
                colors: [
                  Theme.of(context).primaryColor,
                ],
                shouldLoop: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
