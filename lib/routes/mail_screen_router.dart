import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tweet_vote_app/routes/bindings/mail_binding.dart';
import 'package:tweet_vote_app/screens/mail_screen.dart';

class MailScreenRouter extends StatefulWidget {
  static const navigatorIndex = 3;

  @override
  _MailScreenRouterState createState() => _MailScreenRouterState();
  static Route onGenerateRouter(RouteSettings settings) {
    if (settings.name == '/') {
      return GetPageRoute(
        settings: settings,
        page: () => MailScreen(),
        binding: MailBinding(),
      );
    }
    throw ('no page');
  }
}

class _MailScreenRouterState extends State<MailScreenRouter> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(MailScreenRouter.navigatorIndex),
      initialRoute: '/',
      onGenerateRoute: MailScreenRouter.onGenerateRouter,
    );
  }
}
