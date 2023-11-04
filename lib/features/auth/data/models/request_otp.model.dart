import 'package:flutter_template/features/auth/domain/entities/auth.entity.dart';

class RequestOTPModel extends OTP {
  RequestOTPModel({required String message, required String otp})
      : super(message: message, otp: otp);

  factory RequestOTPModel.fromJson(Map<String, dynamic> json) {
    return RequestOTPModel(message: json['message'], otp: json['otp']);
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'otp': otp};
  }
}
