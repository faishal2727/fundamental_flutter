import 'package:flutter/material.dart';
import 'package:fundamental_submission/app/modules/home/controllers/home_controller.dart';
import 'package:fundamental_submission/app/modules/home/views/components/card_restaurant.dart';
import 'package:get/get.dart';

class ListRestaurant extends StatelessWidget {
  ListRestaurant({Key? key}) : super(key: key);

  final controller = Get.put<HomeController>(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return Expanded(
            child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.listRestaurant.length,
          itemBuilder: (context, index) {
            var restaurant = controller.listRestaurant[index];
            return CardRestaurant(
                id: (String id) {
                  controller.moveToDetail(id);
                },
                restaurant: restaurant);
          },
        ));
      }
    });
  }
}
