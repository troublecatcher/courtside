import 'package:auto_route/auto_route.dart';
import 'package:courtside/features/news/news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class NewsSingleScreen extends StatelessWidget {
  final News news;
  const NewsSingleScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            collapsedHeight: 110.h,
            surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            leading: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => context.router.popForced(),
              child: Icon(
                Icons.arrow_back,
                color: Theme.of(context).primaryColor,
              ),
            ),
            expandedHeight: 372.h,
            pinned: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.blurBackground,
                StretchMode.zoomBackground,
              ],
              titlePadding: EdgeInsets.all(16.r),
              centerTitle: false,
              title: Text(news.title),
              background: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(news.img),
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
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Text(news.content),
            ),
          ),
        ],
      ),
    );
  }
}
