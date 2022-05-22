import 'package:get/instance_manager.dart';
import 'package:tweet_vote_app/controllers/rank_controller.dart';

class RankBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<RankController>(
      RankController(),
    );
  }
}
