import 'package:fundamental_submission/app/model/restaurant.dart';

class ResponseSearchRestaurant {
  bool error;
  int founded;
  List<Restaurant> restaurant;

  ResponseSearchRestaurant(
      {required this.error, required this.founded, required this.restaurant});

  factory ResponseSearchRestaurant.fromJson(Map<String, dynamic> json) {
    return ResponseSearchRestaurant(
        error: json["error"],
        founded: json["founded"],
        restaurant: List<Restaurant>.from(
            (json["restaurants"] as List ).map((e) => Restaurant.fromJson(e))));
  }
}
