import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tezal_version_two/data/models/rate.dart';
import '../api_service.dart';

class RateProvaider {
  // rateAllByContainer
  Future<List<Rate>> getRateByContainerId(int id) async {
    var response = await http.get(
      "${ApiService.rate}/$id/all",
      headers: {"Content-Type": "application/json"},
    );
    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse == 401) throw Exception(jsonResponse);
    List<Rate> rates = [];
    for (var json in jsonResponse) {
      rates.add(Rate.fromJson(json));
    }
    return rates;
  }
}
