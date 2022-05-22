import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tweet_vote_app/screens/start_tab.dart';

import 'bindings/start_binding.dart';

class StartScreenRouter extends StatefulWidget {
  static const navigatorIndex = 0;

  @override
  _StartScreenRouterState createState() => _StartScreenRouterState();
  static Route onGenerateRouter(RouteSettings settings) {
    if (settings.name == '/') {
      return GetPageRoute(
        settings: settings,
        page: () => StartTab(),
        binding: StartBinding(),
      );
    }
    throw ('no page');
  }
}

class _StartScreenRouterState extends State<StartScreenRouter> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(StartScreenRouter.navigatorIndex),
      initialRoute: '/',
      onGenerateRoute: StartScreenRouter.onGenerateRouter,
    );
  }
}
