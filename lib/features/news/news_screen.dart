import 'package:auto_route/auto_route.dart';
import 'package:courtside/app/router/router.dart';
import 'package:courtside/features/news/news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            largeTitle: const Text(
              'News',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 16.h),
          ),
          SliverList.separated(
            itemCount: News.newsList.length,
            itemBuilder: (context, index) {
              final news = News.newsList[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () =>
                      context.router.push(NewsSingleRoute(news: news)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.asset(
                          news.img,
                          height: 200.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'News',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        news.title,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 18.sp, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => Padding(
              padding: EdgeInsets.all(16.r),
              child: const Divider(),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 16.h),
          ),
        ],
      ),
    );
  }
}
