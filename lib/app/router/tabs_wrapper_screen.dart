import 'package:auto_route/auto_route.dart';
import 'package:courtside/app/router/router.dart';
import 'package:courtside/shared/cs_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TabWrapperScreen extends StatelessWidget {
  const TabWrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: CupertinoColors.black,
      routes: const [
        MatchesRoute(),
        PuzzlesRoute(),
        NewsRoute(),
        SettingsRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return CupertinoTabBar(
          activeColor: Theme.of(context).primaryColor,
          currentIndex: tabsRouter.activeIndex,
          onTap: (value) {
            tabsRouter.setActiveIndex(value);
          },
          items: const [
            BottomNavigationBarItem(
              icon: CSIcon(
                assetPath: 'assets/navbar/matches.svg',
                active: false,
              ),
              activeIcon: CSIcon(
                assetPath: 'assets/navbar/matches.svg',
                active: true,
              ),
              label: 'Matches',
            ),
            BottomNavigationBarItem(
              icon: CSIcon(
                assetPath: 'assets/navbar/puzzles.svg',
                active: false,
              ),
              activeIcon: CSIcon(
                assetPath: 'assets/navbar/puzzles.svg',
                active: true,
              ),
              label: 'Puzzles',
            ),
            BottomNavigationBarItem(
              icon: CSIcon(
                assetPath: 'assets/navbar/news.svg',
                active: false,
              ),
              activeIcon: CSIcon(
                assetPath: 'assets/navbar/news.svg',
                active: true,
              ),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: CSIcon(
                assetPath: 'assets/navbar/settings.svg',
                active: false,
              ),
              activeIcon: CSIcon(
                assetPath: 'assets/navbar/settings.svg',
                active: true,
              ),
              label: 'Settings',
            ),
          ],
        );
      },
    );
  }
}
