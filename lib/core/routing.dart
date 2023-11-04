import 'package:flutter_template/features/auth/presentation/otp_auth_screen.dart';
import 'package:go_router/go_router.dart';

import '../shared/constants.dart';

final appRouter = GoRouter(
 navigatorKey: appNavigationKey,
  routes: [
  GoRoute(path: '/', builder: (_, __) => const OTPAuthScreen())
]);