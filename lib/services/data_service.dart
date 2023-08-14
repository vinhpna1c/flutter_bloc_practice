// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter_bloc_practice/models/place.dart';

class DataServices {
  static const BASE_URL = "http://mark.bslmeiyu.com";
  static const GET_PLACES = "/getplaces";
  static late final Dio apiDio;
  static initDataService() {
    apiDio = Dio(BaseOptions(baseUrl: BASE_URL));
  }

  Future<List<Place>> getInfo() async {
    final respond = await apiDio.get("/api$GET_PLACES");
    List<Place> places = [];
    try {
      if (respond.statusCode == 200) {
        for (dynamic place in respond.data) {
          places.add(Place.fromJson(place));
        }
        return places;
      }
    } catch (e) {
      print("Error get data");
    }
    return places;
  }
}
