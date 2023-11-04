import 'package:dartz/dartz.dart';
import 'package:flutter_template/core/errors/exceptions.dart';
import 'package:flutter_template/core/errors/failures.dart';
import 'package:flutter_template/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_template/features/auth/domain/entities/auth.entity.dart';
import 'package:flutter_template/features/auth/domain/repositories/auth.repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource remoteDataSource = AuthRemoteDataSourceImpl();
  
  @override
  Future<Either<Failure, OTP>> requestOtp({required String email}) async {
    try {
      return Right(await remoteDataSource.requestOTP(email: email));
    } on ServerException catch(_) {
      return Left(ServerFailure());
    }
  }
  
  @override
  Future<Either<Failure, BaseResponse>> verifyOtp({required String email, required String otp}) {
    // TODO: implement verifyOtp
    throw UnimplementedError();
  }

  // E.g.
  /**
   * 
  Future<Either<Failure, SomeResponse>> methodName(
      Command c) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await getData();
        localDataSource.dump(remoteData);
        return Right(remoteData);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final local = await localDataSource.getData();
        return Right(local!);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
   */
}
