import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:eko_projects/domain/model/homepage/movie_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<FetchMovie>((event, emit) async {
      emit(MovieLoading());
      final jsonData =
          await rootBundle.loadString('assets/json/movieDashboard.json');
      final dataDecode = jsonDecode(jsonData);
      var data = OKContentMovie.fromJson(dataDecode["OKContentMovie"]);

      if (dataDecode["ResponseStatus"] == "OK") {
        emit(MovieLoaded(data));
      } else {
        emit(const MovieFailed("Fetch Movie Failed"));
      }
    });
  }
}
