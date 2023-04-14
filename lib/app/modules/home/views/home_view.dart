import 'package:flutter/material.dart';
import 'package:fundamental_submission/app/components/responsive.dart';
import 'package:fundamental_submission/app/modules/home/views/components/grid_restaurant.dart';
import 'package:fundamental_submission/app/modules/home/views/components/list_restaurants.dart';
import 'package:fundamental_submission/app/modules/home/views/components/search_field.dart';
import 'package:fundamental_submission/app/theme/color.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
        ),
        body: Obx(() {
          return controller.connectionStatus == 0
              ? Container(
                child:const Center(child:Text("No Connection")))
              : Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Column(
                    children: [
                      SearchField(),
                      Responsive(
                          mobile: ListRestaurant(),
                          tablet: CardGridView(crossAxisCount: 3),
                          desktop: CardGridView(
                            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
                          ))
                    ],
                  ),
                );
        }));
  }
}
