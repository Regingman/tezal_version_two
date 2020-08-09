class Container {
  int id;
  String name;
  int number;
  int budgetId;
  int containerCategoryId;

  Container.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    number = json['number'];
    budgetId = json['budgetId'];
    containerCategoryId = json['containerCategoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['number'] = this.number;
    data['budgetId'] = this.budgetId;
    data['containerCategoryId'] = this.containerCategoryId;
    return data;
  }

  Container(this.budgetId, this.id, this.name, this.number);
}
