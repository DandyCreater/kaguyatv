import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:eko_projects/domain/model/play/play_related_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'related_play_event.dart';
part 'related_play_state.dart';

class RelatedPlayBloc extends Bloc<RelatedPlayEvent, RelatedPlayState> {
  RelatedPlayBloc() : super(RelatedPlayInitial()) {
    on<FetchRelated>((event, emit) async {
      emit(RelatedPlayLoading());

      final jsonData =
          await rootBundle.loadString("assets/json/playRelated.json");
      final dataDecodes = jsonDecode(jsonData);
      var data = OKContentRelated.fromJson(dataDecodes["OKContentRelated"]);

      if (dataDecodes["ResponseStatus"] == "OK") {
        emit(RelatedPlayLoaded(data));
      } else {
        emit(const RelatedPlayFailed("Fetch Related Failed "));
      }
    });
  }
}
