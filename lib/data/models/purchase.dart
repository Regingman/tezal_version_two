class Purchase {
  int id;
  String barCode;
  int containerId;
  int count;
  int priceForOne;
  String publisher;
  double summ;

  Purchase.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    barCode = json['barCode'];
    containerId = json['containerId'];
    count = json['count'];
    priceForOne = json['priceForOne'];
    publisher = json['publisher'];
    summ = json['summ'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['barCode'] = this.barCode;
    data['containerId'] = this.containerId;
    data['count'] = this.count;
    data['priceForOne'] = this.priceForOne;
    data['publisher'] = this.publisher;
    data['summ'] = this.summ;
    return data;
  }

  Purchase(this.id, this.barCode, this.containerId, this.count,
      this.priceForOne, this.publisher, this.summ);
}
