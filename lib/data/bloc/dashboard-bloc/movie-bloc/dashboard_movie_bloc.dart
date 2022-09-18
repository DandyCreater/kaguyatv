import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:eko_projects/domain/model/homepage/movie_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'dashboard_movie_event.dart';
part 'dashboard_movie_state.dart';

class DashboardMovieBloc
    extends Bloc<DashboardMovieEvent, DashboardMovieState> {
  DashboardMovieBloc() : super(DashboardMovieInitial()) {
    on<FetchDashboardMovie>((event, emit) async {
      emit(DashboardMovieLoading());

      final jsonData =
          await rootBundle.loadString("assets/json/movieDashboard.json");
      final dataDecodes = jsonDecode(jsonData);
      var data = OKContentMovie.fromJson(dataDecodes["OKContentMovie"]);

      if (dataDecodes["ResponseStatus"] == "OK") {
        emit(DashboardMovieLoaded(data));
      } else {
        emit(const DashboardMovieFailed("Fetch Dashboard Movie Failed !!"));
      }
    });
  }
}
