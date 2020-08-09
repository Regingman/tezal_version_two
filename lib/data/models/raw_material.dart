class RawMaterial {
  int id;
  int amountInBlock;
  String description;
  String name;
  int unitId;
  int volume;

  RawMaterial.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amountInBlock = json['amountInBlock'];
    description = json['description'];
    name = json['name'];
    unitId = json['unitId'];
    volume = json['volume'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['amountInBlock'] = this.amountInBlock;
    data['description'] = this.description;
    data['name'] = this.name;
    data['unitId'] = this.unitId;
    data['volume'] = this.volume;
    return data;
  }

  RawMaterial(this.amountInBlock, this.id, this.description, this.name,
      this.unitId, this.volume);
}
