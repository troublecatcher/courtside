import 'package:auto_route/auto_route.dart';
import 'package:courtside/app/router/router.dart';
import 'package:courtside/shared/cs_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/bg/balls.png',
            ),
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Join the game! Everything about basketball in one app.',
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .navLargeTitleTextStyle
                          .copyWith(color: Colors.white, fontSize: 34.sp),
                    ),
                    SizedBox(height: 4.h),
                    const Text(
                        'News, statistics - we have everything a true basketball fan needs!'),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CSButton(
                    title: 'Get started',
                    onPressed: () {
                      GetIt.I<SharedPreferences>().setBool('ft', false);
                      context.router.replace(const MatchesRoute());
                    },
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () =>
                            context.router.push(const TermsOfUseRoute()),
                        child: Text(
                          'Terms of Use',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      const Text(' / '),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () =>
                            context.router.push(const PrivacyPolicyRoute()),
                        child: Text(
                          'Privacy Policy',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
