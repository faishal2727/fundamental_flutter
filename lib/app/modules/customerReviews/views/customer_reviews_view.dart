import 'package:flutter/material.dart';

import 'package:fundamental_submission/app/modules/detail/views/components/customer_review.dart';
import 'package:fundamental_submission/app/theme/color.dart';

import 'package:get/get.dart';

import '../controllers/customer_reviews_controller.dart';

class CustomerReviewsView extends GetView<CustomerReviewsController> {
  CustomerReviewsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          title: Text("Customer Reviews"),
        ),
      body: Container(
        padding: EdgeInsets.all(defaultPadding / 2),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: controller.customerReviews.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomerReview(
                          customerReviews: controller.customerReviews[index]);
                    }))
          ],
        ),
      )
    );
  }
}
