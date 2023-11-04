

import 'package:flutter_template/core/errors/exceptions.dart';
import 'package:flutter_template/core/errors/failures.dart';
import 'package:flutter_template/features/auth/data/models/request_otp.model.dart';

import '../models/verify_otp_model.dart';

abstract class AuthDataSource {
  Future<RequestOTPModel> requestOTP({required String email});
  Future<VerifyOTPModel> verifyOtp({required String email});
}

class AuthRemoteDataSourceImpl implements AuthDataSource {
  @override
  Future<RequestOTPModel> requestOTP({required String email}) async {
    try {
      // var response = await getIt.get<ApiService>().get('/hello');
      return RequestOTPModel(message: 'OTP sent on your $email', otp: '1234');
    } on ServerException catch(_) {
      throw ServerFailure();
    }
  }
  
  @override
  Future<VerifyOTPModel> verifyOtp({required String email}) {
    // TODO: implement verifyOtp
    throw UnimplementedError();
  }
}
