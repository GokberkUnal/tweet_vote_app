import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tweet_vote_app/routes/bindings/like_binding.dart';
import 'package:tweet_vote_app/screens/tweet_screen.dart';

class TweetTabRouter extends StatefulWidget {
  static const navigatorIndex = 1;

  @override
  _TweetTabRouterState createState() => _TweetTabRouterState();

  static Route onGenerateRouter(RouteSettings settings) {
    if (settings.name == '/') {
      return GetPageRoute(
          settings: settings,
          page: () => TweetScreen(),
          binding: LikeBinding());
    }

    throw Exception('no page');
  }
}

class _TweetTabRouterState extends State<TweetTabRouter> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(TweetTabRouter.navigatorIndex),
      initialRoute: '/',
      onGenerateRoute: TweetTabRouter.onGenerateRouter,
    );
  }
}
