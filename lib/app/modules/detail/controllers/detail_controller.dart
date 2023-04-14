import 'dart:io';

import 'package:fundamental_submission/app/data/api_service.dart';
import 'package:fundamental_submission/app/model/detail_restaurant.dart';
import 'package:fundamental_submission/app/modules/customerReviews/bindings/customer_reviews_binding.dart';
import 'package:fundamental_submission/app/modules/customerReviews/views/customer_reviews_view.dart';

import 'package:http/http.dart' as http;

import 'package:get/get.dart';

class DetailController extends GetxController {
  late String id;
  late DetailRestaurant detailRestaurant;
  List<String> listCategories = [];
  List<String> listFoods = [];
  List<String> listDrinks = [];
  static List<CustomerReviews> customerReviews = [];
  RxBool isLoading = true.obs;
  RxString message = "".obs;

  @override
  void onInit() {
    super.onInit();
    id = Get.arguments;
    isLoading.value = false;
    getDetailRestaurant(id);
  }

  void getDetailRestaurant(String id) async {
    try {
      isLoading(true);
      var datas = await ApiService.getDetailRestaurants(id);
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isLoading(false);
        message.value = "";
        if (datas != null) {
          detailRestaurant = datas.restaurant;
          datas.restaurant.categories.forEach((x) {
            listCategories.add(x.name);
          });
          datas.restaurant.menus.foods.forEach((x) {
            listFoods.add(x.name);
          });
          datas.restaurant.menus.drinks.forEach((x) {
            listDrinks.add(x.name);
          });
          print(" suu ${datas.restaurant.customerReviews}");

          customerReviews.addAll(datas.restaurant.customerReviews);
          print("${customerReviews.length}");
        }
      }
    } catch (e) {
      message.value = "$e";
      print(message.value);
      isLoading(false);
    }
  }

  void MoveToCustomerReviews() {
    CustomerReviewsBinding().dependencies();
    Get.to(CustomerReviewsView(), arguments: customerReviews);
  }
}
