part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

final class RequestOTPEvent extends AuthenticationEvent {
  const RequestOTPEvent();
}

final class AuthenticationLogoutEvent extends AuthenticationEvent {}