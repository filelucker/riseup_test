class EmailResponse {
  EmailResponse({
      List<Hydra_member>? hydramember,
      int? hydratotalItems,}){
    _hydramember = hydramember;
    _hydratotalItems = hydratotalItems;
}

  EmailResponse.fromJson(dynamic json) {
    if (json['hydra:member'] != null) {
      _hydramember = [];
      json['hydra:member'].forEach((v) {
        _hydramember?.add(Hydra_member.fromJson(v));
      });
    }
    _hydratotalItems = json['hydra:totalItems'];
  }
  List<Hydra_member>? _hydramember;
  int? _hydratotalItems;
EmailResponse copyWith({  List<Hydra_member>? hydramember,
  int? hydratotalItems,
}) => EmailResponse(  hydramember: hydramember ?? _hydramember,
  hydratotalItems: hydratotalItems ?? _hydratotalItems,
);
  List<Hydra_member>? get hydramember => _hydramember;
  int? get hydratotalItems => _hydratotalItems;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_hydramember != null) {
      map['hydra:member'] = _hydramember?.map((v) => v.toJson()).toList();
    }
    map['hydra:totalItems'] = _hydratotalItems;
    return map;
  }

}

class Hydra_member {
  Hydra_member({
      String? id,
      String? accountId,
      String? msgid,
      From? from,
      List<To>? to,
      String? subject,
      String? intro,
      bool? seen,
      bool? isDeleted,
      bool? hasAttachments,
      int? size,
      String? downloadUrl,
      String? createdAt,
      String? updatedAt,}){

    _id = id;
    _accountId = accountId;
    _msgid = msgid;
    _from = from;
    _to = to;
    _subject = subject;
    _intro = intro;
    _seen = seen;
    _isDeleted = isDeleted;
    _hasAttachments = hasAttachments;
    _size = size;
    _downloadUrl = downloadUrl;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Hydra_member.fromJson(dynamic json) {

    _id = json['id'];
    _accountId = json['accountId'];
    _msgid = json['msgid'];
    _from = json['from'] != null ? From.fromJson(json['from']) : null;
    if (json['to'] != null) {
      _to = [];
      json['to'].forEach((v) {
        _to?.add(To.fromJson(v));
      });
    }
    _subject = json['subject'];
    _intro = json['intro'];
    _seen = json['seen'];
    _isDeleted = json['isDeleted'];
    _hasAttachments = json['hasAttachments'];
    _size = json['size'];
    _downloadUrl = json['downloadUrl'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  String? _id;
  String? _accountId;
  String? _msgid;
  From? _from;
  List<To>? _to;
  String? _subject;
  String? _intro;
  bool? _seen;
  bool? _isDeleted;
  bool? _hasAttachments;
  int? _size;
  String? _downloadUrl;
  String? _createdAt;
  String? _updatedAt;
Hydra_member copyWith({  String? id,

  String? accountId,
  String? msgid,
  From? from,
  List<To>? to,
  String? subject,
  String? intro,
  bool? seen,
  bool? isDeleted,
  bool? hasAttachments,
  int? size,
  String? downloadUrl,
  String? createdAt,
  String? updatedAt,
}) => Hydra_member(
  id: id ?? _id,
  accountId: accountId ?? _accountId,
  msgid: msgid ?? _msgid,
  from: from ?? _from,
  to: to ?? _to,
  subject: subject ?? _subject,
  intro: intro ?? _intro,
  seen: seen ?? _seen,
  isDeleted: isDeleted ?? _isDeleted,
  hasAttachments: hasAttachments ?? _hasAttachments,
  size: size ?? _size,
  downloadUrl: downloadUrl ?? _downloadUrl,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);

  String? get id => _id;
  String? get accountId => _accountId;
  String? get msgid => _msgid;
  From? get from => _from;
  List<To>? get to => _to;
  String? get subject => _subject;
  String? get intro => _intro;
  bool? get seen => _seen;
  bool? get isDeleted => _isDeleted;
  bool? get hasAttachments => _hasAttachments;
  int? get size => _size;
  String? get downloadUrl => _downloadUrl;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['id'] = _id;
    map['accountId'] = _accountId;
    map['msgid'] = _msgid;
    if (_from != null) {
      map['from'] = _from?.toJson();
    }
    if (_to != null) {
      map['to'] = _to?.map((v) => v.toJson()).toList();
    }
    map['subject'] = _subject;
    map['intro'] = _intro;
    map['seen'] = _seen;
    map['isDeleted'] = _isDeleted;
    map['hasAttachments'] = _hasAttachments;
    map['size'] = _size;
    map['downloadUrl'] = _downloadUrl;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}

class To {
  To({
      String? address,
      String? name,}){
    _address = address;
    _name = name;
}

  To.fromJson(dynamic json) {
    _address = json['address'];
    _name = json['name'];
  }
  String? _address;
  String? _name;
To copyWith({  String? address,
  String? name,
}) => To(  address: address ?? _address,
  name: name ?? _name,
);
  String? get address => _address;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = _address;
    map['name'] = _name;
    return map;
  }

}

class From {
  From({
      String? address,
      String? name,}){
    _address = address;
    _name = name;
}

  From.fromJson(dynamic json) {
    _address = json['address'];
    _name = json['name'];
  }
  String? _address;
  String? _name;
From copyWith({  String? address,
  String? name,
}) => From(  address: address ?? _address,
  name: name ?? _name,
);
  String? get address => _address;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = _address;
    map['name'] = _name;
    return map;
  }

}