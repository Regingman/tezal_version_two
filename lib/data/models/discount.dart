class Discount {
  int id;
  int containerId;

  Discount.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    containerId = json['containerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['containerId'] = this.containerId;
    return data;
  }

  Discount(this.id, this.containerId);
}
