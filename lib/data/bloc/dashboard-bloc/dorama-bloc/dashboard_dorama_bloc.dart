import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:eko_projects/domain/model/dashboard/dashboard_dorama_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'dashboard_dorama_event.dart';
part 'dashboard_dorama_state.dart';

class DashboardDoramaBloc
    extends Bloc<DashboardDoramaEvent, DashboardDoramaState> {
  DashboardDoramaBloc() : super(DashboardDoramaInitial()) {
    on<FetchDashboardDorama>((event, emit) async {
      emit(DashboardDoramaLoading());

      final jsonData =
          await rootBundle.loadString('assets/json/doramaDashboard.json');
      final dataDecodes = jsonDecode(jsonData);
      var data = OKContentDorama.fromJson(dataDecodes["OKContentDorama"]);

      if (dataDecodes["ResponseStatus"] == "OK") {
        emit(DashboardDoramaLoaded(data));
      } else {
        emit(const DashboardDoramaFailed("Fetch Dashboard Dorama Error !"));
      }
    });
  }
}
