import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/errors/failures.dart';
import 'package:flutter_template/features/auth/domain/entities/auth.entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, OTP>> requestOtp({required String email});
  Future<Either<Failure, BaseResponse>> verifyOtp({required String email, required String otp});
}