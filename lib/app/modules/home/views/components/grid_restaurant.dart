import 'package:flutter/material.dart';
import 'package:fundamental_submission/app/modules/home/controllers/home_controller.dart';
import 'package:fundamental_submission/app/modules/home/views/components/card_grid_restaurant.dart';
import 'package:fundamental_submission/app/theme/color.dart';
import 'package:get/get.dart';

class CardGridView extends StatelessWidget {
  CardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;
  final controller = Get.put<HomeController>(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return Expanded(
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.listRestaurant.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: defaultPadding,
                  mainAxisSpacing: defaultPadding,
                  childAspectRatio: childAspectRatio,
                ),
                itemBuilder: (context, index) {
                  var restaurant = controller.listRestaurant[index];
                  return CardGridRestaurant(
                    restaurant: restaurant,
                    id: (String id) {
                      controller.moveToDetail(id);
                    },
                  );
                }));
      }
    });
  }
}
