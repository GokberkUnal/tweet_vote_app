import 'package:get/get.dart';
import 'package:tweet_vote_app/controllers/base_controller.dart';
import 'package:tweet_vote_app/controllers/tweet_controller.dart';

class BaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseController>(
      () => BaseController(),
    );

    Get.lazyPut<TweetController>(
      () => TweetController(),
    );
  }
}
