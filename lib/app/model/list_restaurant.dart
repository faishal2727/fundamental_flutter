import 'package:fundamental_submission/app/model/restaurant.dart';

class ListRestaurant {
  bool error;
  String message;
  int count;
  List<Restaurant> restaurants;

  ListRestaurant(
      {required this.error,
      required this.message,
      required this.count,
      required this.restaurants});

  factory ListRestaurant.fromJson(Map<String, dynamic> json) {
    return ListRestaurant(
        error: json["error"],
        message: json["message"],
        count: json["count"],
        restaurants: List<Restaurant>.from(json["restaurants"].map((datas) => Restaurant.fromJson(datas))));
  }
}
