// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/auth/domain/usecases/request_otp.usecase.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

enum AuthenticationStatus { unauthenticated, authenticated, initial }

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  RequestOTP requestOtpUseCase = RequestOTP();

  // Form Controllers
  final emailController = TextEditingController();

  AuthenticationBloc() : super(const AuthenticationState()) {
    on<AuthenticationEvent>((event, emit) async {
      if (event is RequestOTPEvent) {
        await _onRequestOtp(emailController.text);
      }

      if(event is AuthenticationLogoutEvent) {
        emit(state.copyWith(
            newStatus: AuthenticationStatus.initial));
      }
    });
  }

  Future<void> _onRequestOtp(String email) async {
    var usecase = await requestOtpUseCase.call(RequestOTPCommand(email: email));

    usecase?.fold(
        (l) => emit(state.copyWith(
            newStatus: AuthenticationStatus.unauthenticated, newIsLoading: false)),
        (r) => emit(state.copyWith(
              newStatus: AuthenticationStatus.authenticated,
              newMessage: r.message,
              newIsLoading: false,
            )));
  }
}
