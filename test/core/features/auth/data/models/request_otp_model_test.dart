import 'package:flutter_template/features/auth/data/models/request_otp.model.dart';
import 'package:flutter_template/features/auth/domain/entities/auth.entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tRequestOtpModel = RequestOTPModel(message: 'OK', otp: '1234');

  test('should be a subclass of RequestOTP entity', () async {
    expect(tRequestOtpModel, isA<AuthOTP>());
  });
}