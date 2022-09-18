import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:eko_projects/domain/model/homepage/dorama_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'dorama_event.dart';
part 'dorama_state.dart';

class DoramaBloc extends Bloc<DoramaEvent, DoramaState> {
  DoramaBloc() : super(DoramaInitial()) {
    on<FetchDorama>((event, emit) async {
      emit(DoramaLoading());

      final jsonData =
          await rootBundle.loadString('assets/json/doramaDashboard.json');
      final dataDecode = jsonDecode(jsonData);
      var data = OKContentDorama.fromJson(dataDecode["OKContentDorama"]);

      if (dataDecode["ResponseStatus"] == "OK") {
        emit(DoramaLoaded(data));
      } else {
        emit(const DoramaFailed("Fetch Dorama Error!"));
      }
    });
  }
}
