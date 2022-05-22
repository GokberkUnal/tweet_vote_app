import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:tweet_vote_app/controllers/rank_controller.dart';

class RankScreen extends GetView<RankController> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "Ranks",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[900],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Card(
                child: PieChart(
              dataMap: controller.dataMap,
              animationDuration: Duration(milliseconds: 800),
              chartLegendSpacing: 32,
              chartRadius: MediaQuery.of(context).size.width * 0.4,
              colorList: controller.colorList,
              initialAngleInDegree: 0,
              ringStrokeWidth: 32,
              centerText: "Votes",
              legendOptions: LegendOptions(
                showLegendsInRow: true,
                legendPosition: LegendPosition.bottom,
                showLegends: true,
                legendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              chartValuesOptions: ChartValuesOptions(
                showChartValueBackground: true,
                showChartValues: true,
                showChartValuesInPercentage: false,
                showChartValuesOutside: false,
                decimalPlaces: 1,
              ),
            )),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                  itemCount: controller.rankedTweets.length,
                  itemBuilder: (BuildContext ctx, int i) {
                    print(controller.rankedTweets[i].like);
                    return Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Card(
                              margin: EdgeInsets.zero,
                              child: ListTile(
                                title: new Text(
                                  controller.rankedTweets[i].tweet.toString(),
                                  style: new TextStyle(
                                      fontWeight: FontWeight.w400),
                                ),
                              )),
                          Card(
                            margin: EdgeInsets.zero,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.thumb_down_sharp,
                                      color: Colors.red,
                                    ),
                                    Icon(
                                      Icons.rotate_left,
                                      color: Colors.yellow,
                                    ),
                                    Icon(
                                      Icons.thumb_up_sharp,
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(controller.rankedTweets[i].dislike
                                        .toString()),
                                    Text(controller.rankedTweets[i].neutral
                                        .toString()),
                                    Text(controller.rankedTweets[i].like
                                        .toString())
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.009),
                    );
                  }),
            ),
          ],
        ),
        padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.009),
      ),
    ));
  }
}
