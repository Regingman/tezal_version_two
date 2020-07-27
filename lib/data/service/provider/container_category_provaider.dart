import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tezal_version_two/data/models/container_category.dart';

import '../api_service.dart';

class ContainerCategoryProvaider {
  Future<List<ContainerCategory>> getAll(String token) async {
    List<ContainerCategory> containerCategory = [];
    var containerCategoryResponse = await http.get(
      ApiService.containerCategory,
      headers: {"Authorization": token},
    );
    var jsonResponse = jsonDecode(containerCategoryResponse.body);

    for (var json in jsonResponse) {
      containerCategory.add(ContainerCategory.fromJson(json));
    }

    print("containerCategory: " +
        containerCategoryResponse.statusCode.toString());
    return containerCategory;
  }
}
