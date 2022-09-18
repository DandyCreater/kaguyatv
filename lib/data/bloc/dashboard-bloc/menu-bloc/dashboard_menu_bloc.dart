import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:eko_projects/domain/model/homepage/menu_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'dashboard_menu_event.dart';
part 'dashboard_menu_state.dart';

class DashboardMenuBloc extends Bloc<DashboardMenuEvent, DashboardMenuState> {
  DashboardMenuBloc() : super(DashboardMenuInitial()) {
    on<FetchDashboardMenu>((event, emit) async {
      emit(DashboardMenuLoading());
      final jsonData = await rootBundle.loadString('assets/json/menubar.json');
      final dataDecode = jsonDecode(jsonData);
      var data = OKContentMenu.fromJson(dataDecode["OKContentMenu"]);

      if (dataDecode["ResponseStatus"] == "OK") {
        emit(DashboardMenuSuccess(data));
      } else {
        emit(const DashboardMenuFailed("Fetch Menu Dashboard Failed !"));
      }
    });
  }
}
