class DashboardStreamingModel {
  String? responseStatus;
  OKContentStream? oKContentStream;
  String? failContent;

  DashboardStreamingModel(
      {this.responseStatus, this.oKContentStream, this.failContent});

  DashboardStreamingModel.fromJson(Map<String, dynamic> json) {
    responseStatus = json['ResponseStatus'];
    oKContentStream = json['OKContentStream'] != null
        ? new OKContentStream.fromJson(json['OKContentStream'])
        : null;
    failContent = json['failContent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseStatus'] = this.responseStatus;
    if (this.oKContentStream != null) {
      data['OKContentStream'] = this.oKContentStream!.toJson();
    }
    data['failContent'] = this.failContent;
    return data;
  }
}

class OKContentStream {
  List<Items>? items;

  OKContentStream({this.items});

  OKContentStream.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? imageUrl;
  String? title;
  String? duration;

  Items({this.imageUrl, this.title, this.duration});

  Items.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    title = json['title'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['title'] = this.title;
    data['duration'] = this.duration;
    return data;
  }
}
