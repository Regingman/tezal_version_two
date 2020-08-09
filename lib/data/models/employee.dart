class Employee {
  int id;
  int containerId;
  int userId;
  int roleId;

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    containerId = json['containerId'];
    userId = json['userId'];
    roleId = json['roleId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['containerId'] = this.containerId;
    data['userId'] = this.userId;
    data['roleId'] = this.roleId;
    return data;
  }

  Employee(this.id, this.containerId, this.roleId, this.userId);
}
