import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:eko_projects/domain/helper/search_helper.dart';
import 'package:eko_projects/domain/model/dashboard/dashboard_serial_menu_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'animefy_event.dart';
part 'animefy_state.dart';

class AnimefyBloc extends Bloc<AnimefyEvent, AnimefyState> {
  AnimefyBloc() : super(AnimefyInitial()) {
    SearchHelper searchHelper = SearchHelper();
    on<FetchAnimeFY>((event, emit) async {
      final jsonData =
          await rootBundle.loadString("assets/json/serialDashboard.json");
      final dataDecode = jsonDecode(jsonData);
      var data = OKContentSerial.fromJson(dataDecode["OKContentSerial"]);

      if (dataDecode["ResponseStatus"] == "OK") {
        emit(AnimefySuccess(data));
      } else {
        emit(const AnimefyFailed(message: "Fetch Serial Grid Error"));
      }
    });
    on<searchAnimeFy>(
      (event, emit) async {
        var allData = await searchHelper.getAnimeInformation(event.name);

        OKContentSerial okContentSerial = OKContentSerial();
        okContentSerial.serials = allData;
        emit(AnimefySuccess(okContentSerial));
      },
    );
  }
}
