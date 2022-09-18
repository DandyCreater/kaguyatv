class MenuModel {
  String? responseStatus;
  OKContentMenu? oKContentMenu;

  MenuModel({this.responseStatus, this.oKContentMenu});

  MenuModel.fromJson(Map<String, dynamic> json) {
    responseStatus = json['ResponseStatus'];
    oKContentMenu = json['OKContentMenu'] != null
        ? new OKContentMenu.fromJson(json['OKContentMenu'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseStatus'] = this.responseStatus;
    if (this.oKContentMenu != null) {
      data['OKContentMenu'] = this.oKContentMenu!.toJson();
    }
    return data;
  }
}

class OKContentMenu {
  List<Menu>? menu;

  OKContentMenu({this.menu});

  OKContentMenu.fromJson(Map<String, dynamic> json) {
    if (json['menu'] != null) {
      menu = <Menu>[];
      json['menu'].forEach((v) {
        menu!.add(new Menu.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.menu != null) {
      data['menu'] = this.menu!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Menu {
  String? imageUrl;
  String? title;

  Menu({this.imageUrl, this.title});

  Menu.fromJson(Map<String, dynamic> json) {
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
