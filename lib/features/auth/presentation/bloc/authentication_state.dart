part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState(
      {this.status = AuthenticationStatus.initial,
      this.message = '',
      this.isLoading = false});

  final AuthenticationStatus? status;
  final String? message;
  final bool? isLoading;

  AuthenticationState copyWith(
      {AuthenticationStatus? newStatus,
      String? newMessage,
      bool? newIsLoading}) {
    return AuthenticationState(
        status: newStatus ?? status,
        message: newMessage ?? message,
        isLoading: newIsLoading ?? isLoading);
  }

  @override
  List<dynamic> get props => [status];
}
