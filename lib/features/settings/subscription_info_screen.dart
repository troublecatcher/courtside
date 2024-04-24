import 'package:auto_route/auto_route.dart';
import 'package:courtside/app/init/remote_config_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class SubscriptionInfoScreen extends StatelessWidget {
  const SubscriptionInfoScreen({super.key});

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
          'Subscription Info',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.white),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Builder(builder: (context) {
          final subscription = GetIt.I<RemoteConfigService>().subscription;
          if (subscription != null && subscription != '') {
            return InAppWebView(
              initialUrlRequest: URLRequest(
                url: WebUri(subscription),
              ),
            );
          } else {
            return const Center(
              child: Text('Failed to load Subscription Info'),
            );
          }
        }),
      ),
    );
  }
}
