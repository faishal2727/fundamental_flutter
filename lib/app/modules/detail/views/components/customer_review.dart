import 'package:flutter/material.dart';
import 'package:fundamental_submission/app/model/detail_restaurant.dart';
import 'package:fundamental_submission/app/theme/color.dart';


class CustomerReview extends StatelessWidget {
  CustomerReviews customerReviews;
  CustomerReview({ Key? key ,required this.customerReviews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(defaultPadding / 2),
      padding: EdgeInsets.all(defaultPadding / 2),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: primaryColor)
      ),
      child: Column(
       children: [
         Text(customerReviews.name,textAlign: TextAlign.left,style: const TextStyle(fontWeight: FontWeight.bold),),
         Text(customerReviews.review),
         Align(
           alignment: Alignment.centerRight,
           child: Text(customerReviews.date))
       ],
      ),
    );
  }
}