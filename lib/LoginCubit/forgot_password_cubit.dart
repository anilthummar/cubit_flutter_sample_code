
import 'package:flutter_bloc/flutter_bloc.dart';

import 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());

  void forgotPassword(String emailaddresss) async {

    emit(ForgotPasswordLoading());

    try {
      // Simulate network call
      await Future.delayed(const Duration(seconds: 1));

      if (emailaddresss == "test@test.com" ) {
        emit(ForgotPasswordSuccess());
      } else {
        emit(ForgotPasswordFailure("Invalid Email address"));
      }
    } catch (e) {
      emit(ForgotPasswordFailure("An error occurred"));
    }
  }
}
