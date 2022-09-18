class LoginModel {
  String? responseStatus;
  OkContent? okContent;
  String? failContent;

  LoginModel({this.responseStatus, this.okContent, this.failContent});

  LoginModel.fromJson(Map<String, dynamic> json) {
    responseStatus = json['ResponseStatus'];
    okContent = json['OkContent'] != null
        ? new OkContent.fromJson(json['OkContent'])
        : null;
    failContent = json['failContent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseStatus'] = this.responseStatus;
    if (this.okContent != null) {
      data['OkContent'] = this.okContent!.toJson();
    }
    data['failContent'] = this.failContent;
    return data;
  }
}

class OkContent {
  List<User>? user;

  OkContent({this.user});

  OkContent.fromJson(Map<String, dynamic> json) {
    if (json['user'] != null) {
      user = <User>[];
      json['user'].forEach((v) {
        user!.add(new User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  String? username;
  String? password;

  User({this.username, this.password});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}
