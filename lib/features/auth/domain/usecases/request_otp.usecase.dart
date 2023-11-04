import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/core/errors/failures.dart';
import 'package:flutter_template/core/usecases/usecase.dart';
import 'package:flutter_template/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_template/features/auth/domain/entities/auth.entity.dart';
import 'package:flutter_template/shared/global_contexts.dart';

class RequestOTP implements UseCase<AuthOTP, RequestOTPCommand> {
  final authRepository = AuthRepositoryImpl();
  @override
  Future<Either<Failure, AuthOTP>?> call(RequestOTPCommand params) async {
    return await getIt.get<AuthRepositoryImpl>().requestOtp(email: params.email);
  }
}

class RequestOTPCommand extends Equatable {
  final String email;

  const RequestOTPCommand({required this.email});
  
  @override
  List<Object?> get props => throw UnimplementedError();
}