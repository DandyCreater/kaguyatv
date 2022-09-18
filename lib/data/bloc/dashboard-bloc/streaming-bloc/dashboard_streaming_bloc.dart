import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:eko_projects/domain/model/dashboard/dashboard_streaming_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'dashboard_streaming_event.dart';
part 'dashboard_streaming_state.dart';

class DashboardStreamingBloc
    extends Bloc<DashboardStreamingEvent, DashboardStreamingState> {
  DashboardStreamingBloc() : super(DashboardStreamingInitial()) {
    on<FetchDashboardStreaming>((event, emit) async {
      emit(DashboardStreamingLoading());
      final jsonData =
          await rootBundle.loadString("assets/json/streamDashboard.json");
      final dataDecodes = jsonDecode(jsonData);
      var data = OKContentStream.fromJson(dataDecodes["OKContentStream"]);

      if (dataDecodes["ResponseStatus"] == "OK") {
        emit(DashboardStreamingLoaded(data));
      } else {
        emit(const DashboardStreamingFailed(
            "Fetch Dashboard Streaming Error !!"));
      }
    });
  }
}
