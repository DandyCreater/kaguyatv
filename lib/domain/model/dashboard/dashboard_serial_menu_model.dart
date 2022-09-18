class DashboardSerialModel {
  String? responseStatus;
  OKContentSerial? oKContentSerial;
  String? failContent;

  DashboardSerialModel(
      {this.responseStatus, this.oKContentSerial, this.failContent});

  DashboardSerialModel.fromJson(Map<String, dynamic> json) {
    responseStatus = json['ResponseStatus'];
    oKContentSerial = json['OKContentSerial'] != null
        ? new OKContentSerial.fromJson(json['OKContentSerial'])
        : null;
    failContent = json['failContent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseStatus'] = this.responseStatus;
    if (this.oKContentSerial != null) {
      data['OKContentSerial'] = this.oKContentSerial!.toJson();
    }
    data['failContent'] = this.failContent;
    return data;
  }
}

class OKContentSerial {
  List<Serials>? serials;

  OKContentSerial({this.serials});

  OKContentSerial.fromJson(Map<String, dynamic> json) {
    if (json['serials'] != null) {
      serials = <Serials>[];
      json['serials'].forEach((v) {
        serials!.add(new Serials.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.serials != null) {
      data['serials'] = this.serials!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Serials {
  String? imageUrl;
  String? title;
  String? subImageUrl;
  String? session;
  String? rating;
  String? genre;
  String? description;

  Serials(
      {this.imageUrl,
      this.title,
      this.subImageUrl,
      this.session,
      this.rating,
      this.genre,
      this.description});

  Serials.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    title = json['title'];
    subImageUrl = json['subImageUrl'];
    session = json['session'];
    rating = json['rating'];
    genre = json['genre'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['title'] = this.title;
    data['subImageUrl'] = this.subImageUrl;
    data['session'] = this.session;
    data['rating'] = this.rating;
    data['genre'] = this.genre;
    data['description'] = this.description;
    return data;
  }
}
