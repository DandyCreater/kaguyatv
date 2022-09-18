class MovieModel {
  String? responseStatus;
  OKContentMovie? oKContentMovie;
  String? failContent;

  MovieModel({this.responseStatus, this.oKContentMovie, this.failContent});

  MovieModel.fromJson(Map<String, dynamic> json) {
    responseStatus = json['ResponseStatus'];
    oKContentMovie = json['OKContentMovie'] != null
        ? new OKContentMovie.fromJson(json['OKContentMovie'])
        : null;
    failContent = json['failContent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseStatus'] = this.responseStatus;
    if (this.oKContentMovie != null) {
      data['OKContentMovie'] = this.oKContentMovie!.toJson();
    }
    data['failContent'] = this.failContent;
    return data;
  }
}

class OKContentMovie {
  List<Movie>? movie;

  OKContentMovie({this.movie});

  OKContentMovie.fromJson(Map<String, dynamic> json) {
    if (json['movie'] != null) {
      movie = <Movie>[];
      json['movie'].forEach((v) {
        movie!.add(new Movie.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.movie != null) {
      data['movie'] = this.movie!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Movie {
  String? imageUrl;
  String? title;

  Movie({this.imageUrl, this.title});

  Movie.fromJson(Map<String, dynamic> json) {
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
