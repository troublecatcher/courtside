import 'package:auto_route/auto_route.dart';
import 'package:courtside/app/router/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool share = true;

    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            largeTitle: const Text(
              'Settings',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: CupertinoListSection.insetGrouped(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              additionalDividerMargin: 0,
              dividerMargin: 32.w,
              margin: EdgeInsets.all(16.w),
              children: [
                Builder(builder: (ctx) {
                  return CupertinoListTile(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    leadingSize: 24.r,
                    leadingToTitle: 8.w,
                    padding: EdgeInsets.symmetric(vertical: 13.h),
                    leading: SvgPicture.asset('assets/icons/share.svg'),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text(
                      'Share with friends',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white),
                    ),
                    onTap: () {
                      if (share) {
                        share = false;
                        final box = ctx.findRenderObject() as RenderBox?;
                        Share.shareWithResult('Check out Courtside!',
                                sharePositionOrigin:
                                    box!.localToGlobal(Offset.zero) & box.size)
                            .whenComplete(
                          () => share = true,
                        );
                      }
                    },
                  );
                }),
                CupertinoListTile(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  leadingSize: 24.r,
                  leadingToTitle: 8.w,
                  padding: EdgeInsets.symmetric(vertical: 13.h),
                  leading: SvgPicture.asset('assets/icons/subscription.svg'),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    'Subscription info',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  ),
                  onTap: () =>
                      context.router.push(const SubscriptionInfoRoute()),
                ),
                CupertinoListTile(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  leadingSize: 24.r,
                  leadingToTitle: 8.w,
                  padding: EdgeInsets.symmetric(vertical: 13.h),
                  leading: SvgPicture.asset('assets/icons/terms.svg'),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    'Terms of Use',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  ),
                  onTap: () => context.router.push(const TermsOfUseRoute()),
                ),
                CupertinoListTile(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  leadingSize: 24.r,
                  leadingToTitle: 8.w,
                  padding: EdgeInsets.symmetric(vertical: 13.h),
                  leading: SvgPicture.asset('assets/icons/privacy.svg'),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    'Privacy Policy',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  ),
                  onTap: () => context.router.push(const PrivacyPolicyRoute()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
