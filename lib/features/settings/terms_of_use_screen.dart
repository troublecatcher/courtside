import 'package:auto_route/auto_route.dart';
import 'package:courtside/app/init/remote_config_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:courtside/app/main.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class TermsOfUseScreen extends StatelessWidget {
  const TermsOfUseScreen({super.key});

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
          'Terms of Use',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.white),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Builder(builder: (context) {
          final termsOfUse = GetIt.I<RemoteConfigService>().termsOfUse;
          if (termsOfUse != null && termsOfUse != '') {
            return InAppWebView(
              initialUrlRequest: URLRequest(
                url: WebUri(termsOfUse),
              ),
            );
          } else {
            return const Center(
              child: Text('Failed to load Terms of Use'),
            );
          }
        }),
      ),
    );
  }
}
