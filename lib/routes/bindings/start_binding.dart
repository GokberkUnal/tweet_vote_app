import 'package:get/instance_manager.dart';
import 'package:tweet_vote_app/controllers/start_controller.dart';

class StartBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<StartController>(
      StartController(),
    );
  }
}
