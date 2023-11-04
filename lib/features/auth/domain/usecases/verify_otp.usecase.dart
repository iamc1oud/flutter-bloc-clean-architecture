import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/core/errors/failures.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_template/features/auth/domain/entities/auth.entity.dart';
import 'package:flutter_template/shared/global_contexts.dart';

class VerifyOTP implements UseCase<BaseResponse, VerifyOTPCommand> {
  final authRepository = AuthRepositoryImpl();
  @override
  Future<Either<Failure, BaseResponse>?> call(VerifyOTPCommand params) async {
    return await getIt.get<AuthRepositoryImpl>().verifyOtp(email: params.email, otp: params.otp);
  }
}

class VerifyOTPCommand extends Equatable {
  final String email;
  final String otp;

  const VerifyOTPCommand(this.otp, {required this.email});
  
  @override
  List<Object?> get props => throw UnimplementedError();
}