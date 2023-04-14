

import 'package:fundamental_submission/app/model/menu.dart';

class DetailRestaurant {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  String address;
  dynamic rating;
  List<Categories> categories;
  Menus menus;
  List<CustomerReviews> customerReviews;

  DetailRestaurant(
      {required this.id,
      required this.name,
      required this.description,
      required this.pictureId,
      required this.city,
      required this.address,
      required this.rating,
      required this.categories,
      required this.menus,
      required this.customerReviews});

  factory DetailRestaurant.fromJson(Map<String, dynamic> json) {
    return DetailRestaurant(
      id: json["id"],
      name: json["name"] ?? "",
      description: json["description"] ?? "",
      city: json["city"] ?? "",
      address: json["address"] ?? "",
      pictureId: json["pictureId"] ?? "",
      categories: List<Categories>.from((json["categories"] as List)
          .map((datas) => Categories.fromJson(datas))),
      menus: Menus.fromJson(json["menus"]),
      rating: json["rating"],
      customerReviews: List<CustomerReviews>.from(
          (json["customerReviews"] as List)
              .map((datas) => CustomerReviews.fromJson(datas))),
    );
  }
}

class Categories {
  String name;

  Categories({required this.name});

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(name: json["name"]);
  }
}

class CustomerReviews {
  String name;
  String review;
  String date;

  CustomerReviews(
      {required this.name, required this.review, required this.date});

  factory CustomerReviews.fromJson(Map<String, dynamic> json) {
    print("$json");
    return CustomerReviews(
        name: json["name"],
        review: json["review"] ?? "",
        date: json["date"] ?? "");
  }
}
