import 'package:get/instance_manager.dart';
import 'package:tweet_vote_app/controllers/mail_controller.dart';

class MailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MailController>(
      MailController(),
    );
  }
}
