// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    MatchesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MatchesScreen(),
      );
    },
    NewsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewsScreen(),
      );
    },
    NewsSingleRoute.name: (routeData) {
      final args = routeData.argsAs<NewsSingleRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NewsSingleScreen(
          key: args.key,
          news: args.news,
        ),
      );
    },
    NewsWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewsWrapperScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    PrivacyPolicyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PrivacyPolicyScreen(),
      );
    },
    PromotionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PromotionScreen(),
      );
    },
    PuzzlesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PuzzlesScreen(),
      );
    },
    PuzzlesSolvingRoute.name: (routeData) {
      final args = routeData.argsAs<PuzzlesSolvingRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PuzzlesSolvingScreen(
          key: args.key,
          puzzle: args.puzzle,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    SubscriptionInfoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SubscriptionInfoScreen(),
      );
    },
    TabWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TabWrapperScreen(),
      );
    },
    TermsOfUseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TermsOfUseScreen(),
      );
    },
  };
}

/// generated route for
/// [MatchesScreen]
class MatchesRoute extends PageRouteInfo<void> {
  const MatchesRoute({List<PageRouteInfo>? children})
      : super(
          MatchesRoute.name,
          initialChildren: children,
        );

  static const String name = 'MatchesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewsScreen]
class NewsRoute extends PageRouteInfo<void> {
  const NewsRoute({List<PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewsSingleScreen]
class NewsSingleRoute extends PageRouteInfo<NewsSingleRouteArgs> {
  NewsSingleRoute({
    Key? key,
    required News news,
    List<PageRouteInfo>? children,
  }) : super(
          NewsSingleRoute.name,
          args: NewsSingleRouteArgs(
            key: key,
            news: news,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsSingleRoute';

  static const PageInfo<NewsSingleRouteArgs> page =
      PageInfo<NewsSingleRouteArgs>(name);
}

class NewsSingleRouteArgs {
  const NewsSingleRouteArgs({
    this.key,
    required this.news,
  });

  final Key? key;

  final News news;

  @override
  String toString() {
    return 'NewsSingleRouteArgs{key: $key, news: $news}';
  }
}

/// generated route for
/// [NewsWrapperScreen]
class NewsWrapperRoute extends PageRouteInfo<void> {
  const NewsWrapperRoute({List<PageRouteInfo>? children})
      : super(
          NewsWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PrivacyPolicyScreen]
class PrivacyPolicyRoute extends PageRouteInfo<void> {
  const PrivacyPolicyRoute({List<PageRouteInfo>? children})
      : super(
          PrivacyPolicyRoute.name,
          initialChildren: children,
        );

  static const String name = 'PrivacyPolicyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PromotionScreen]
class PromotionRoute extends PageRouteInfo<void> {
  const PromotionRoute({List<PageRouteInfo>? children})
      : super(
          PromotionRoute.name,
          initialChildren: children,
        );

  static const String name = 'PromotionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PuzzlesScreen]
class PuzzlesRoute extends PageRouteInfo<void> {
  const PuzzlesRoute({List<PageRouteInfo>? children})
      : super(
          PuzzlesRoute.name,
          initialChildren: children,
        );

  static const String name = 'PuzzlesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PuzzlesSolvingScreen]
class PuzzlesSolvingRoute extends PageRouteInfo<PuzzlesSolvingRouteArgs> {
  PuzzlesSolvingRoute({
    Key? key,
    required Puzzle puzzle,
    List<PageRouteInfo>? children,
  }) : super(
          PuzzlesSolvingRoute.name,
          args: PuzzlesSolvingRouteArgs(
            key: key,
            puzzle: puzzle,
          ),
          initialChildren: children,
        );

  static const String name = 'PuzzlesSolvingRoute';

  static const PageInfo<PuzzlesSolvingRouteArgs> page =
      PageInfo<PuzzlesSolvingRouteArgs>(name);
}

class PuzzlesSolvingRouteArgs {
  const PuzzlesSolvingRouteArgs({
    this.key,
    required this.puzzle,
  });

  final Key? key;

  final Puzzle puzzle;

  @override
  String toString() {
    return 'PuzzlesSolvingRouteArgs{key: $key, puzzle: $puzzle}';
  }
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SubscriptionInfoScreen]
class SubscriptionInfoRoute extends PageRouteInfo<void> {
  const SubscriptionInfoRoute({List<PageRouteInfo>? children})
      : super(
          SubscriptionInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'SubscriptionInfoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TabWrapperScreen]
class TabWrapperRoute extends PageRouteInfo<void> {
  const TabWrapperRoute({List<PageRouteInfo>? children})
      : super(
          TabWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'TabWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TermsOfUseScreen]
class TermsOfUseRoute extends PageRouteInfo<void> {
  const TermsOfUseRoute({List<PageRouteInfo>? children})
      : super(
          TermsOfUseRoute.name,
          initialChildren: children,
        );

  static const String name = 'TermsOfUseRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
