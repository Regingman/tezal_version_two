class User {
  String name;
  String sname;
  String phone;
  String img;
  String password;
  String token;
  bool isActive;
  DateTime isActiveBefore;

  User({
    this.name,
    this.sname,
    this.phone,
    this.img,
    this.password,
    this.token,
    this.isActive,
    this.isActiveBefore,
  });

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sname = json['sname'];
    phone = json['phone'];
    img = json['img'];
    password = json['password'];
    token = json['token'];
    isActive = json['isActive'];

    isActiveBefore = DateTime.parse(json['isActiveBefore']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['sname'] = this.sname;
    data['phone'] = this.phone;
    data['img'] = this.img;
    data['token'] = this.token;
    data['isActive'] = this.isActive;
    data['isActiveBefore'] = this.isActiveBefore.toString();
    return data;
  }
}
