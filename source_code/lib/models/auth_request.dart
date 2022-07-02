
class AuthRequest {
  String? address;
  String? password;

  AuthRequest({this.address, this.password});

  AuthRequest.fromJson(dynamic obj) {
    this.address = obj['address'];
    this.password = obj['password'];
  }

  Map<String, dynamic> toJson() {
    var map = Map<String, dynamic>();
    map["address"] = address;
    map["password"] = password;
    return map;
  }
}
