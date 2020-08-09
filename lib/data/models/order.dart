class Order {
  int id;
  int clientId;
  int containerId;
  int orderStatusId;
  DateTime deadlineDate;

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientId = json['clientId'];
    containerId = json['containerId'];
    orderStatusId = json['orderStatusId'];
    deadlineDate = json['deadlineDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['clientId'] = this.clientId;
    data['containerId'] = this.containerId;
    data['orderStatusId'] = this.orderStatusId;
    data['deadlineDate'] = this.deadlineDate;
    return data;
  }

  Order(this.id, this.clientId, this.containerId, this.deadlineDate,
      this.orderStatusId);
}
