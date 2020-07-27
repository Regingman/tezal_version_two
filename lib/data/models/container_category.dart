import 'package:tezal_version_two/data/models/container.dart';

class ContainerCategory {
  int id;
  String name;
  List<Container> container;

  ContainerCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    /* var list = json['container'];
    for (var arr in list) {
      container.add(Container.fromJson(arr));
    }*/
    if (json['container'] != null) {
      container = List<Container>();
      json['container'].forEach((v) {
        container.add(Container.fromJson(v));
      });
    }
  }

  ContainerCategory(this.id, this.name, this.container);
}
