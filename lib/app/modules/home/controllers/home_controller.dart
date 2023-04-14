import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:fundamental_submission/app/data/api_service.dart';
import 'package:fundamental_submission/app/model/restaurant.dart';
import 'package:fundamental_submission/app/modules/detail/bindings/detail_binding.dart';
import 'package:fundamental_submission/app/modules/detail/views/detail_view.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController search = TextEditingController();

  var isLoading = true.obs;
  var listRestaurant = <Restaurant>[].obs;
  var connectionStatus = 0.obs;
  final connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  @override
  void onInit() {
    getListRestaurants();
    connectivitySubscription =
        connectivity.onConnectivityChanged.listen(checkConnectivity);
    super.onInit();
  }

  void moveToDetail(String id) {
    DetailBinding().dependencies();
    Get.to(() => DetailView(),
        arguments: id,
        transition: Transition.leftToRight,
        duration: const Duration(milliseconds: 500));
  }

  void getListRestaurants() async {
    try {
      isLoading(true);
      final result = await connectivity.checkConnectivity();
      checkConnectivity(result);
      var restaurants = await ApiService.getListRestaurants();
      if (restaurants != null && connectionStatus != 0) {
        listRestaurant.assignAll(restaurants.restaurants);
      }
    } finally {
      isLoading(false);
    }
  }

  checkConnectivity(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        connectionStatus(2);
        break;
      case ConnectivityResult.wifi:
        connectionStatus(1);
        break;
      default:
        connectionStatus(0);
    }

    connectionStatus.refresh();
  }

  void getSearchRestaurant(String query) async {
    try {
      isLoading(true);
      var restaurants = await ApiService.getResultSearch(query);
      if (restaurants != null) {
        listRestaurant.assignAll(restaurants.restaurant);
      }
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {
    connectivitySubscription.cancel();
  }
}
