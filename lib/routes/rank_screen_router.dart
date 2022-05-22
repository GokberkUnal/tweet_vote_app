import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tweet_vote_app/routes/bindings/rank_binding.dart';
import 'package:tweet_vote_app/screens/rank_screen.dart';

class RankScreenRouter extends StatefulWidget {
  static const navigatorIndex = 2;

  @override
  _RankScreenRouterState createState() => _RankScreenRouterState();

  static Route onGenerateRouter(RouteSettings settings) {
    if (settings.name == '/') {
      return GetPageRoute(
        settings: settings,
        page: () => RankScreen(),
        binding: RankBinding(),
      );
    }
    throw ('no page');
  }
}

class _RankScreenRouterState extends State<RankScreenRouter> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(RankScreenRouter.navigatorIndex),
      initialRoute: '/',
      onGenerateRoute: RankScreenRouter.onGenerateRouter,
    );
  }
}
