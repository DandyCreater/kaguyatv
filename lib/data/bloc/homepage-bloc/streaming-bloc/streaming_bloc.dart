import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:eko_projects/domain/model/homepage/streaming_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'streaming_event.dart';
part 'streaming_state.dart';

class StreamingBloc extends Bloc<StreamingEvent, StreamingState> {
  StreamingBloc() : super(StreamingInitial()) {
    on<FetchStream>((event, emit) async {
      emit(StreamingLoading());

      final jsonData =
          await rootBundle.loadString('assets/json/streamDashboard.json');
      final dataDecode = jsonDecode(jsonData);
      var data = OKContentStream.fromJson(dataDecode["OKContentStream"]);

      if (dataDecode["ResponseStatus"] == "OK") {
        emit(StreamingLoaded(data));
      } else {
        emit(const StreamingFailed("Fetch Streaming Failed!"));
      }
    });
  }
}
