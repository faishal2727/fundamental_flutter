import 'dart:convert';

import 'package:fundamental_submission/app/model/list_restaurant.dart';
import 'package:fundamental_submission/app/model/response_detail.dart';
import 'package:fundamental_submission/app/model/response_search_restaurant.dart';

import 'package:fundamental_submission/app/theme/color.dart';

import 'package:http/http.dart' as http;

class ApiService {
  static Future<ListRestaurant> getListRestaurants() async {
    final response = await http.get(Uri.parse("${baseUrl}list"));
    if (response.statusCode == 200) {
      return ListRestaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load list restaurants');
    }
  }

  static Future<ResponseDetailRestaurant> getDetailRestaurants(
      String id) async {
    final response = await http.get(Uri.parse("${baseUrl}detail/$id"));
    if (response.statusCode == 200) {
      return ResponseDetailRestaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load detail restaurants');
    }
  }

  static Future<ResponseSearchRestaurant> getResultSearch(String query) async {
    final response = await http.get(Uri.parse("${baseUrl}search?q=$query"));
    if (response.statusCode == 200) {
      return ResponseSearchRestaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load search restaurants');
    }
  }
}
