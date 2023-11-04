import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/assets.dart';
import 'package:flutter_template/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_template/shared/constants.dart';
import 'package:flutter_template/shared/extensions.dart';
import 'package:flutter_template/shared/global_contexts.dart';

class OTPAuthScreen extends StatefulWidget {
  const OTPAuthScreen({super.key});

  @override
  State<OTPAuthScreen> createState() => _OTPAuthScreenState();
}

class _OTPAuthScreenState extends State<OTPAuthScreen> {
  late AuthenticationBloc _authenticationBloc;

  @override
  Widget build(BuildContext context) {
    _authenticationBloc = context.watch<AuthenticationBloc>();

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listenWhen: (previous, current) {
        if (previous.status != current.status) {
          return true;
        }

        return false;
      },
      listener: (context, state) {
        switch (state.status) {
          case AuthenticationStatus.authenticated:
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('${state.message}')));
            break;
          case AuthenticationStatus.unauthenticated:
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Unauthenticated')));
            break;
          case AuthenticationStatus.initial:
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Initial')));
            break;
          default:
            break;
        }
      },
      child: Scaffold(
        body: Stack(children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                AppAsset.fiteloBg,
                width: appMediaQuery.size.width,
              )),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                AppAsset.userOnboarding,
                width: appMediaQuery.size.width.sp,
                height: appMediaQuery.size.width.sp,
              )),
          Positioned(
              top: appMediaQuery.size.height * 0.5,
              left: 0,
              right: 0,
              bottom: 0,
              child: _buildOTPRequestForm(context)
                  .padding(const EdgeInsets.symmetric(horizontal: 24.0))),
          Positioned(
            bottom: appMediaQuery.size.height * 0.05,
            left: 0,
            right: 0,
            child: Text(
                "By continuing, you agree to our\nTerms of service Privacy Policy Content Policy",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF2F323B),
                )),
          )
        ]),
      ),
    );
  }

  Widget _buildOTPRequestForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Welcome',
          style:
              appTextTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ).centerAlign(),
        Spacing.smallHeight(),
        Text('Please login to dashboard', style: appTextTheme.bodyMedium)
            .centerAlign(),
        Spacing.largeHeight(),
        TextFormField(
          controller: _authenticationBloc.emailController,
          decoration: const InputDecoration(hintText: 'Email'),
        ),
        Spacing.smallHeight(),
        ElevatedButton(
            onPressed: () {
              context.read<AuthenticationBloc>().add(const RequestOTPEvent());
            },
            child: const Text('Request OTP')),
      ],
    );
  }
}
