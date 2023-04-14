
import 'package:fundamental_submission/app/model/detail_restaurant.dart';

class ResponseDetailRestaurant {
  bool error;
  String message;
  DetailRestaurant restaurant;

  ResponseDetailRestaurant(
      {required this.error, required this.message, required this.restaurant});

  factory ResponseDetailRestaurant.fromJson(Map<String, dynamic> json) {
    return ResponseDetailRestaurant(
        error: json["error"],
        message: json["message"],
        restaurant: DetailRestaurant.fromJson(json["restaurant"]));
  }
}
