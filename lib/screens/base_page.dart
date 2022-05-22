import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:tweet_vote_app/controllers/base_controller.dart';

import 'package:tweet_vote_app/routes/start_tab.dart';

class BasePage extends GetView<BaseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        title: Text("Twitter"),
      ),
      body: GetBuilder<BaseController>(
          builder: (tx) => PageView(
                physics: new NeverScrollableScrollPhysics(),
                controller: controller.pageViewController,
                children: <Widget>[StartScreenRouter()],
              )),
    );
  }
}
