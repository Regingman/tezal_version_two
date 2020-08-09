class Rate {
  int id;
  int quantityInStock;
  int rawMaterialId;
  int retailPrice;
  int containerId;

  Rate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantityInStock = json['quantityInStock'];
    rawMaterialId = json['rawMaterialId'];
    retailPrice = json['retailPrice'];
    containerId = json['containerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['quantityInStock'] = this.quantityInStock;
    data['rawMaterialId'] = this.rawMaterialId;
    data['retailPrice'] = this.retailPrice;
    data['containerId'] = this.containerId;
    return data;
  }

  Rate(this.rawMaterialId, this.id, this.quantityInStock, this.retailPrice,
      this.containerId);
}
