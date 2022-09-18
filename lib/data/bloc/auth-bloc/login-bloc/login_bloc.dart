import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:eko_projects/domain/helper/login_helper.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    LoginHelper loginHelper = LoginHelper();
    on<LoadingProcess>((event, emit) async {
      emit(LoginLoading());

      var data =
          await loginHelper.loginFunction(event.username!, event.password!);
      print("ini data $data");
      if (data == "Login Berhasil") {
        emit(LoginLoaded());
      } else if (data == "Username / Password Tidak Boleh Kosong") {
        emit(LoginFailed(message: data));
      } else {
        emit(LoginFailed(message: data));
      }
    });
  }
}
