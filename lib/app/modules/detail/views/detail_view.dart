import 'package:cached_network_image/cached_network_image.dart';

import 'package:expandable_text/expandable_text.dart';

import 'package:flutter/material.dart';

import 'package:fundamental_submission/app/modules/detail/views/components/dropdown_menu.dart';

import 'package:fundamental_submission/app/modules/detail/views/components/rating.dart';

import 'package:fundamental_submission/app/theme/color.dart';

import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: SingleChildScrollView(
      child: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Container(
            child: Expanded(
              child: Column(
                children: [
                  CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl:
                        "https://restaurant-api.dicoding.dev/images/medium/${controller.detailRestaurant.pictureId}",
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          controller.detailRestaurant.name.toString(),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Rating(
                          rating: controller.detailRestaurant.rating.toDouble())
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.all(defaultPadding / 4),
                      padding: const EdgeInsets.all(defaultPadding / 2),
                      constraints: const BoxConstraints(
                        maxWidth: 250,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: primaryColor,
                      ),
                      child: Row(
                        children: [
                          Text(
                            controller.detailRestaurant.city.toString(),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Divider(
                              height: 10,
                              color: Colors.white,
                            ),
                          ),
                          Text(controller.detailRestaurant.address.toString(),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExpandableText(
                        controller.detailRestaurant.description.toString(),
                        expandText: 'show more',
                        collapseText: 'show less',
                        maxLines: 3,
                        linkColor: Colors.blue,
                      )),
                  DropdownMenuz(
                      listData: controller.listCategories, hint: "Categories"),
                  Row(
                    children: [
                      DropdownMenuz(
                          listData: controller.listFoods, hint: "Foods"),
                      DropdownMenuz(
                          listData: controller.listDrinks, hint: "Drinks"),
                    ],
                  ),
                  InkWell(
                    onTap: () => controller.MoveToCustomerReviews(),
                    child: Container(
                      padding: const EdgeInsets.all(defaultPadding / 2),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: Colors.white.withOpacity(0.15)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Customer Reviews"),
                          Icon(Icons.keyboard_arrow_right_outlined)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
      }),
    ));
  }
}
