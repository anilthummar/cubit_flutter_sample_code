import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'forgot_password_state.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login(String username, String password) async {
    emit(LoginLoading());

    try {
      // Simulate network call
      await Future.delayed(const Duration(seconds: 1));

      if (username == "u" && password == "p") {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure("Invalid username or password"));
      }
    } catch (e) {
      emit(LoginFailure("An error occurred"));
    }
  }

}

