import 'package:flutter/material.dart';
import 'package:fundamental_submission/app/modules/home/controllers/home_controller.dart';
import 'package:fundamental_submission/app/theme/color.dart';
import 'package:get/get.dart';

class SearchField extends StatelessWidget {
  final controller = Get.find<HomeController>();
  SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.search,
      
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: secondaryColor,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {
            controller.getSearchRestaurant(controller.search.text.toString());
          },
          child: Container(
            padding: const EdgeInsets.all(defaultPadding * 0.75),
            margin: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
