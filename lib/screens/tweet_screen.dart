import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:tweet_vote_app/controllers/tweet_controller.dart';
import 'package:tweet_vote_app/routes/rank_screen_router.dart';
import 'package:tweet_vote_app/routes/mail_screen_router.dart';
import 'package:tweet_vote_app/utility/app_state.dart';

class TweetScreen extends GetView<TweetController> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.grey[900],
              centerTitle: true,
              title: Text("Twitter"),
              actions: <Widget>[
                PopupMenuButton(
               

                  
                    icon: Icon(Icons.menu),
                    color: Colors.black,
                    itemBuilder: (context) => [

                          PopupMenuItem<int>(
                            padding: EdgeInsets.all(0),
                            value: 0,
                            child:  TextButton.icon(
                              
                                  
                                  label: Text(
                                    "Statistics     ",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  icon: Icon(
                                    Icons.bar_chart,
                                    color: Colors.white,
                                  ),
                                  
                                  onPressed: () {
                                    controller.queryAll();
                                    controller.queryAll();
                                    Get.to(() => RankScreenRouter());
                                  },
                                ),
                              
                            ),
                          
                          PopupMenuItem<int>(
                            padding: EdgeInsets.all(0),
                            value: 2,
                            child:  TextButton.icon(
                                label: Text(
                                  "Mail           ",
                                  style: TextStyle(color: Colors.white),
                                ),
                                icon: Icon(
                                  Icons.mail,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Get.to(() => MailScreenRouter());
                                },
                              ),
                            ),
                          
                          PopupMenuItem<int>(
                            value: 3,
                            padding: EdgeInsets.all(0),
                            child: TextButton.icon(
                                label: Text(
                                  "Again          ",
                                  style: TextStyle(color: Colors.white),
                                ),
                                icon: Icon(
                                  Icons.rotate_90_degrees_ccw,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                            ),
                          
                        ])
              ]),
          key: controller.scaffoldKey,
          body: Obx(() {
            if (controller.appState() == AppState.LOADING) {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.black,
              ));
            } else {
              return Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(children: [
                    Container(
                      height: MediaQuery.of(context).size.height - 200,
                      child: SwipeCards(
                        matchEngine: controller.matchEngine,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              alignment: Alignment.center,
                              decoration: new BoxDecoration(
                                color: Colors.grey[900],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              height: MediaQuery.of(context).size.height * 0.70,
                              width: MediaQuery.of(context).size.width,
                              child: Container(
                                child: Text(
                                  controller.swipeItems[index].content.text,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.05),
                                ),
                                margin: new EdgeInsets.all(10),
                              ));
                        },
                        onStackFinished: () {
                          controller.addList(controller.settingCont.setting);
                        },
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.10,
                      color: Colors.grey[900],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              controller.matchEngine.currentItem?.nope();
                            },
                            icon: Icon(Icons.thumb_down_alt_sharp,
                                color: Colors.red),
                            iconSize: MediaQuery.of(context).size.width * 0.09,
                          ),
                          IconButton(
                            onPressed: () {
                              controller.matchEngine.currentItem?.superLike();
                            },
                            icon: Icon(
                              Icons.rotate_left,
                              color: Colors.yellow,
                            ),
                            iconSize: MediaQuery.of(context).size.width * 0.09,
                          ),
                          IconButton(
                            onPressed: () {
                              controller.matchEngine.currentItem?.like();
                            },
                            icon: Icon(
                              Icons.thumb_up_alt_sharp,
                              color: Colors.green,
                            ),
                            iconSize: MediaQuery.of(context).size.width * 0.09,
                          )
                        ],
                      ),
                    ),
                  ]));
            }
          })),
    );
  }
}
