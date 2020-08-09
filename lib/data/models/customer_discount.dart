class CustomerDiscount {
  int id;
  int percent;
  int summ;
  int clientId;
  int discountId;

  CustomerDiscount.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    percent = json['percent'];
    summ = json['summ'];
    clientId = json['clientId'];
    discountId = json['discountId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['percent'] = this.percent;
    data['summ'] = this.summ;
    data['clientId'] = this.clientId;
    data['discountId'] = this.discountId;
    return data;
  }

  CustomerDiscount(
      this.id, this.clientId, this.discountId, this.percent, this.summ);
}
