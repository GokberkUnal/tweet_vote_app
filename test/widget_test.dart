// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:flutter_test/flutter_test.dart';
import 'package:tweet_vote_app/controllers/mail_controller.dart';
import 'package:tweet_vote_app/controllers/tweet_controller.dart';
import 'package:tweet_vote_app/models/settings.dart';



void main() {
 test('Swipe and send mail',(){
   final tweetController=TweetController();
   final mailController=MailController();
   Settings settings=new Settings("one");
   tweetController.addList(settings);
   tweetController.matchEngine.currentItem!.likeAction!();
   expect(tweetController.swipedata.elementAt(0).like,1);
   tweetController.matchEngine.currentItem!.superlikeAction!();
   expect(tweetController.swipedata.elementAt(0).neutral,1);
   tweetController.matchEngine.currentItem!.nopeAction!();
   expect(tweetController.swipedata.elementAt(0).dislike,1);
   
   tweetController.queryAll();
   expect(tweetController.sqfdata.isEmpty, false);
   mailController.generateCsvFile(tweetController.sqfdata, "twreportbot@gmail.com");
   
   
   
 });
}

