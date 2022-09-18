import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:eko_projects/domain/model/dashboard/dashboard_serial_menu_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'dashboard_serial_event.dart';
part 'dashboard_serial_state.dart';

class DashboardSerialBloc
    extends Bloc<DashboardSerialEvent, DashboardSerialState> {
  DashboardSerialBloc() : super(DashboardSerialInitial()) {
    on<FetchDashboardSerial>((event, emit) async {
      emit(DashboardSerialLoading());

      final jsonData =
          await rootBundle.loadString('assets/json/serialDashboard.json');
      final dataDecodes = jsonDecode(jsonData);

      var data = OKContentSerial.fromJson(dataDecodes["OKContentSerial"]);

      if (dataDecodes["ResponseStatus"] == "OK") {
        emit(DashboardSerialSuccess(data));
      } else {
        emit(const DashboardSerialFailed("Fetch Dashboard Error !"));
      }
    });
  }
}
