import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tweet_vote_app/routes/pages.dart';
import 'package:tweet_vote_app/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(StarterApp());
}

class StarterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primaryColor: Colors.grey[900],
      accentColor: Colors.white),
      smartManagement: SmartManagement.full,
      debugShowCheckedModeBanner: false,
      title: 'Ponte Delivery',
      initialRoute: Routers.home,
      getPages: Pages.getPage,
    );
  }
}
