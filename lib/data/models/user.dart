class User {
  String name;
  String userName;
  String phone;
  String token;

  User({
    this.name,
    this.userName,
    this.phone,
    this.token,
  });

  User.fromJson(Map<String, dynamic> json) {
    userName = json['username'];
    phone = json['telephone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    return data;
  }
}
