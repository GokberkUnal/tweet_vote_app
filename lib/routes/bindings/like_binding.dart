import 'package:get/instance_manager.dart';
import 'package:tweet_vote_app/controllers/start_controller.dart';
import 'package:tweet_vote_app/controllers/tweet_controller.dart';

class LikeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TweetController>(
      () => TweetController(),
    );

    Get.lazyPut<StartController>(
      () => StartController(),
    );
  }
}
