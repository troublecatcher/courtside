import 'package:auto_route/auto_route.dart';
import 'package:courtside/app/init/remote_config_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
        middle: Text(
          'Privacy Policy',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.white),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Builder(builder: (context) {
          final privacyPolicy = GetIt.I<RemoteConfigService>().privacyPolicy;
          if (privacyPolicy != null && privacyPolicy != '') {
            return InAppWebView(
              initialUrlRequest: URLRequest(
                url: WebUri(privacyPolicy),
              ),
            );
          } else {
            return const Center(
              child: Text('Failed to load Privacy Policy'),
            );
          }
        }),
      ),
    );
  }
}
