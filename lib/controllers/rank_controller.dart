import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tweet_vote_app/controllers/tweet_controller.dart';
import 'package:tweet_vote_app/models/tweet.dart';
import 'package:tweet_vote_app/models/vote.dart';

class RankController extends GetxController {
  late final List<Tweet> rankedTweets;

  Vote vote = new Vote(0, 0, 0);
  Map<String, double> dataMap = {};

  List<Color> colorList = [
    Colors.green,
    Colors.red,
    Colors.yellow,
  ];

  void _votecount(Vote vote, List<Tweet> tw) {
    for (int i = 0; i < tw.length; i++) {
      if (tw[i].like == 1) {
        vote.like++;
      } else if (tw[i].dislike == 1) {
        vote.dislike++;
      } else {
        vote.neutral++;
      }
    }
    dataMap = {
      "Like": vote.like,
      "Dislike": vote.dislike,
      "Neutral": vote.neutral,
    };
  }

  @override
  void onInit() {
    final controller = Get.find<TweetController>();
    rankedTweets = controller.sqfdata;
    _votecount(vote, rankedTweets);
    super.onInit();
  }
}
