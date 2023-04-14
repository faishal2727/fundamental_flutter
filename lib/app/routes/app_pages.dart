import 'package:get/get.dart';

import '../modules/customerReviews/bindings/customer_reviews_binding.dart';
import '../modules/customerReviews/views/customer_reviews_view.dart';
import '../modules/detail/bindings/detail_binding.dart';
import '../modules/detail/views/detail_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => const DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMER_REVIEWS,
      page: () => CustomerReviewsView(),
      binding: CustomerReviewsBinding(),
    ),
  ];
}
