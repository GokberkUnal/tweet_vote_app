import 'package:get/route_manager.dart';
import 'package:tweet_vote_app/routes/bindings/base_binding.dart';
import 'package:tweet_vote_app/routes/routes.dart';
import 'package:tweet_vote_app/screens/base_page.dart';

class Pages {
  static List<GetPage> getPage = [
    GetPage(
      name: Routers.home,
      page: () => BasePage(),
      binding: BaseBinding(),
    ),
  ];
}
