import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tezal_version_two/data/models/raw_material.dart';
import '../api_service.dart';

class RawMaterialProvaider {
  // rateAllByContainer
  Future<List<RawMaterial>> getAllRM() async {
    var response = await http.get(
      ApiService.rawMaterial,
      headers: {"Content-Type": "application/json"},
    );
    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse == 401) throw Exception(jsonResponse);
    List<RawMaterial> rawMaterials = [];
    for (var json in jsonResponse) {
      rawMaterials.add(RawMaterial.fromJson(json));
    }
    return rawMaterials;
  }
}
