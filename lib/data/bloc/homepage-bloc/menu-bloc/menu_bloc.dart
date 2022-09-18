import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:eko_projects/domain/model/homepage/menu_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(MenuInitial()) {
    on<FetchMenu>((event, emit) async {
      emit(MenuLoading());
      final jsonData = await rootBundle.loadString('assets/json/menubar.json');
      final dataDecode = jsonDecode(jsonData);

      final abc = await rootBundle.loadString('assets/json/user.json');

      final encodeData = jsonEncode(jsonDecode(abc));
      print(encodeData);

      var data = OKContentMenu.fromJson(dataDecode["OKContentMenu"]);
      if (dataDecode["ResponseStatus"] == "OK") {
        emit(MenuLoaded(data));
      } else {
        emit(const MenuFailed("Fetch Menu Error"));
      }
    });
  }
}
