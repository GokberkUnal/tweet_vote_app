import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tweet_vote_app/controllers/start_controller.dart';
import 'package:tweet_vote_app/models/content.dart';
import 'package:tweet_vote_app/models/settings.dart';
import 'package:tweet_vote_app/models/tweet.dart';
import 'package:tweet_vote_app/models/tweet_model.dart';
import 'package:tweet_vote_app/utility/app_state.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:tweet_vote_app/utility/constants.dart';
import 'package:tweet_vote_app/utility/dbHelper.dart';

class TweetController extends GetxController {
  var appState = Rx<AppState>(AppState.LOADING);

  static TweetController get to => Get.find();
  final dbHelper = DataBaseHelper.instance;
  List<SwipeItem> swipeItems = <SwipeItem>[];
  late MatchEngine matchEngine = MatchEngine();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  late List<Tweet> sqfdata = [];
  late StartController settingCont;
  List<Tweet> swipedata = [];

  void addList(Settings settings) async {
    appState.value = AppState.LOADING;

    

    Future<List<TwitModel>> _names = getData(settings.query);

    swipeFunctions(_names, swipedata);
  }

  Future<List<TwitModel>> getData(String query) async {
    final queryParameters = {
      'query': query,
    };
    var uri = Uri.https(
        'api.twitter.com', '/2/tweets/search/recent', queryParameters);
    var response = await http.get(uri, headers: {
      "Authorization": "Bearer $BEARER_TOKEN",
      "Content-Type": "application/json"
    });

    List<TwitModel> list = (jsonDecode(response.body)["data"] as List)
        .map((value) => TwitModel.fromJson(value))
        .toList();

    return list;
  }

  void _insert(int id, tw, like, dislike, neutral, isVoted) async {
    Map<String, dynamic> row = {
      DataBaseHelper.columnId: id,
      DataBaseHelper.columnTweet: tw,
      DataBaseHelper.columnLike: like,
      DataBaseHelper.columnDislike: dislike,
      DataBaseHelper.columnNeutral: neutral,
      DataBaseHelper.columnIsVoted: isVoted,
    };
    Tweet tweet = Tweet.fromMap(row);

    final fid = await dbHelper.insert(tweet);
  }

  void queryAll() async {
    final allRows = await dbHelper.queryAllRows();
    sqfdata.clear();
    allRows.forEach((row) => sqfdata.add(Tweet.fromMap(row)));
  }

  void _update(id, tweet, like, dislike, neutral, isVoted) async {
    Tweet tw = Tweet(id, tweet, like, dislike, neutral, isVoted);
    final rowsAffected = await dbHelper.update(tw);
    print(rowsAffected);
  }

  void swipeFunctions(Future<List<TwitModel>> _names, List<Tweet> data) {
    try {
      _names
          .then((value) => value.forEach((element) {
                final data = new Tweet(
                    int.tryParse(element.id), element.text, 0, 0, 0, 0);

                _insert(data.id!, data.tweet, data.like, data.dislike,
                    data.neutral, data.isVoted);

                swipeItems.add(SwipeItem(
                    content: Content(text: data.tweet.toString()),
                    likeAction: () {
                      data.like = 1;
                      data.isVoted = 1;
                      _update(data.id, data.tweet, data.like, data.dislike,
                          data.neutral, data.isVoted);
                    },
                    nopeAction: () {
                      data.dislike = 1;
                      data.isVoted = 1;
                      _update(data.id, data.tweet, data.like, data.dislike,
                          data.neutral, data.isVoted);
                    },
                    superlikeAction: () {
                      data.neutral = 1;
                      data.isVoted = 1;
                      _update(data.id, data.tweet, data.like, data.dislike,
                          data.neutral, data.isVoted);
                    }));
              }))
          .then((value) {
        appState.value = AppState.DONE;
      });
     
    } on Exception catch (e) {
      print(e);
    }
    matchEngine = MatchEngine(swipeItems: swipeItems);
  }

  @override
  void onInit() {
    settingCont = Get.find<StartController>();
    addList(settingCont.setting);

    super.onInit();
  }
}
