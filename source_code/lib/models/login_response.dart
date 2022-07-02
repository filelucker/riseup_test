class LoginResponse {
  LoginResponse({
      String? token, 
      String? id,}){
    _token = token;
    _id = id;
}

  LoginResponse.fromJson(dynamic json) {
    _token = json['token'];
    _id = json['id'];
  }
  String? _token;
  String? _id;
LoginResponse copyWith({  String? token,
  String? id,
}) => LoginResponse(  token: token ?? _token,
  id: id ?? _id,
);
  String? get token => _token;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    map['id'] = _id;
    return map;
  }

}