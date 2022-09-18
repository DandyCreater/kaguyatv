import 'dart:convert';

import 'package:eko_projects/domain/model/dashboard/animeFY/dashboard_animeFY_model.dart';
import 'package:eko_projects/domain/model/dashboard/dashboard_serial_menu_model.dart';
import 'package:flutter/services.dart';

class SearchHelper {
  Future<List<Serials>> getAnimeInformation(String name) async {
    final jsonData =
        await rootBundle.loadString('assets/json/serialDashboard.json');
    final decodeData = jsonDecode(jsonData);
    var data = OKContentSerial.fromJson(decodeData["OKContentSerial"]);

    List<Serials>? oldData = data.serials;
    List<Serials>? newData = [];

    var check = oldData!
        .where((element) => element.title!.toLowerCase().contains(name))
        .toList();

    for (var items in check) {
      newData.add(items);
    }
    print(newData);
    return newData;
  }
}
