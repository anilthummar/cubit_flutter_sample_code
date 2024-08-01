

import 'package:equatable/equatable.dart';

sealed class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();
}

final class ForgotPasswordInitial extends ForgotPasswordState {
  @override
  List<Object> get props => [];
}

class ForgotPasswordLoading extends ForgotPasswordState {
  @override
  List<Object> get props => [];
}

class ForgotPasswordSuccess extends ForgotPasswordState {

  @override
  List<Object> get props => [];
}

class ForgotPasswordFailure extends ForgotPasswordState {
  final String error;

  ForgotPasswordFailure(this.error);
  @override
  List<Object> get props => [error];
}
