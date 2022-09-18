import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:eko_projects/domain/model/homepage/serial_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'serial_event.dart';
part 'serial_state.dart';

class SerialBloc extends Bloc<SerialEvent, SerialState> {
  SerialBloc() : super(SerialInitial()) {
    on<FetchSerial>((event, emit) async {
      emit(SerialLoading());

      final jsonData =
          await rootBundle.loadString('assets/json/serialDashboard.json');
      final dataDecode = jsonDecode(jsonData);
      var data = OKContentSerial.fromJson(dataDecode["OKContentSerial"]);

      if (dataDecode["ResponseStatus"] == "OK") {
        emit(SerialLoaded(data));
      } else {
        emit(const SerialFailed("Fetch Serial Failed"));
      }
    });
  }
}
