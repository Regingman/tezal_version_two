class Sale {
  int id;
  int count;
  int rateId;
  int orderId;
  double summ;

  Sale.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    count = json['count'];
    rateId = json['rateId'];
    orderId = json['orderId'];
    summ = json['summ'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['count'] = this.count;
    data['rateId'] = this.rateId;
    data['orderId'] = this.orderId;
    data['summ'] = this.summ;
    return data;
  }

  Sale(this.id, this.count, this.orderId, this.rateId, this.summ);
}
