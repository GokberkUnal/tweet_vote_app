import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tweet_vote_app/controllers/start_controller.dart';
import 'package:tweet_vote_app/models/settings.dart';

import 'package:tweet_vote_app/routes/tweet_screen_router.dart';

class StartTab extends GetView<StartController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[900],
                ),
                height: MediaQuery.of(context).size.height * 0.2,
                child: Icon(
                  Icons.query_stats_rounded,
                  color: Colors.white,
                  size: MediaQuery.of(context).size.height * 0.2,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 0.82,
                height: MediaQuery.of(context).size.height * 0.08,
                padding:
                    EdgeInsets.only(top: 6, left: 16, right: 16, bottom: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 5)
                    ]),
                child: TextField(
                  controller: controller.queryController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.query_stats,
                      color: Colors.black,
                    ),
                    hintText: 'Query',
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.09,
                width: MediaQuery.of(context).size.width * 0.6,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    if(controller.queryController.text.isNotEmpty){controller.setting =
                        Settings(controller.queryController.text);
                    Get.to(() => TweetTabRouter());}
                    else ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Give me some word!",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.05)),
                          duration: Duration(milliseconds: 500)));
                  },
                  
                  backgroundColor: Colors.black,
                  label: Text("Lets Start!",style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
