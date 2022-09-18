// // ignore: file_names
// class DashboardAnimeFYModel {
//   String? responseStatus;
//   OKContentSerial? oKContentSerial;
//   String? failContent;

//   DashboardAnimeFYModel(
//       {this.responseStatus, this.oKContentSerial, this.failContent});

//   DashboardAnimeFYModel.fromJson(Map<String, dynamic> json) {
//     responseStatus = json['ResponseStatus'];
//     oKContentSerial = json['OKContentSerial'] != null
//         ? new OKContentSerial.fromJson(json['OKContentSerial'])
//         : null;
//     failContent = json['failContent'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ResponseStatus'] = this.responseStatus;
//     if (this.oKContentSerial != null) {
//       data['OKContentSerial'] = this.oKContentSerial!.toJson();
//     }
//     data['failContent'] = this.failContent;
//     return data;
//   }
// }

// class OKContentSerial {
//   List<Serials>? serials;

//   OKContentSerial({this.serials});

//   OKContentSerial.fromJson(Map<String, dynamic> json) {
//     if (json['serials'] != null) {
//       serials = <Serials>[];
//       json['serials'].forEach((v) {
//         serials!.add(new Serials.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.serials != null) {
//       data['serials'] = this.serials!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Serials {
//   String? imageUrl;
//   String? title;

//   Serials({this.imageUrl, this.title});

//   Serials.fromJson(Map<String, dynamic> json) {
//     imageUrl = json['imageUrl'];
//     title = json['title'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['imageUrl'] = this.imageUrl;
//     data['title'] = this.title;
//     return data;
//   }
// }
