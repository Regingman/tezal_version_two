import 'package:tezal_version_two/data/models/budget.dart';

class Container {
  int id;
  String name;
  int number;
  Budget budget;

  Container.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    number = json['number'];
    if (json['budget'] != null) {
      json['budget'].forEach((v) {
        budget = Budget.fromJson(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['number'] = this.number;
    data['budget'] = this.budget;
    return data;
  }

  Container(this.budget, this.id, this.name, this.number);
}
