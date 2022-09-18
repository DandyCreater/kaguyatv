class PlayRelatedModel {
  String? responseStatus;
  OKContentRelated? oKContentRelated;

  PlayRelatedModel({this.responseStatus, this.oKContentRelated});

  PlayRelatedModel.fromJson(Map<String, dynamic> json) {
    responseStatus = json['ResponseStatus'];
    oKContentRelated = json['OKContentRelated'] != null
        ? new OKContentRelated.fromJson(json['OKContentRelated'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseStatus'] = this.responseStatus;
    if (this.oKContentRelated != null) {
      data['OKContentRelated'] = this.oKContentRelated!.toJson();
    }
    return data;
  }
}

class OKContentRelated {
  List<Related>? related;

  OKContentRelated({this.related});

  OKContentRelated.fromJson(Map<String, dynamic> json) {
    if (json['related'] != null) {
      related = <Related>[];
      json['related'].forEach((v) {
        related!.add(new Related.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.related != null) {
      data['related'] = this.related!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Related {
  String? imageUrl;
  String? title;

  Related({this.imageUrl, this.title});

  Related.fromJson(Map<String, dynamic> json) {
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
