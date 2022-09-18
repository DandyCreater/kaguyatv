class DashboardDoramaModel {
  String? responseStatus;
  OKContentDorama? oKContentDorama;

  DashboardDoramaModel({this.responseStatus, this.oKContentDorama});

  DashboardDoramaModel.fromJson(Map<String, dynamic> json) {
    responseStatus = json['ResponseStatus'];
    oKContentDorama = json['OKContentDorama'] != null
        ? new OKContentDorama.fromJson(json['OKContentDorama'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseStatus'] = this.responseStatus;
    if (this.oKContentDorama != null) {
      data['OKContentDorama'] = this.oKContentDorama!.toJson();
    }
    return data;
  }
}

class OKContentDorama {
  List<Dorama>? dorama;

  OKContentDorama({this.dorama});

  OKContentDorama.fromJson(Map<String, dynamic> json) {
    if (json['dorama'] != null) {
      dorama = <Dorama>[];
      json['dorama'].forEach((v) {
        dorama!.add(new Dorama.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dorama != null) {
      data['dorama'] = this.dorama!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dorama {
  String? imageUrl;
  String? title;

  Dorama({this.imageUrl, this.title});

  Dorama.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['title'] = this.title;
    return data;
  }
}
