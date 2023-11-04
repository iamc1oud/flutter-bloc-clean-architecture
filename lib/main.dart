import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template/core/logic/injection_container.dart';
import 'package:flutter_template/core/routing.dart';
import 'package:flutter_template/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_template/features/auth/presentation/otp_auth_screen.dart';
import 'package:flutter_template/shared/widgets/forms/decorated_input_border.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Future.microtask(() => loadServiceLocator());
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => AuthenticationBloc(),
      )
    ],
    child: const MyApp(),
  ));
}

final inputDecorationBorder = DecoratedInputBorder(
    child: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
            color: Colors.black.withOpacity(0.1), style: BorderStyle.solid)),
    shadow: BoxShadow(
        color: Colors.grey.withOpacity(0.12), blurRadius: 10, spreadRadius: 5));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp.router(
          title: 'Flutter Demo',
          routerConfig: appRouter,
          // TODO: Separate the theme data in separate file.
          theme: ThemeData(
            colorScheme: const ColorScheme.light(
              primary: Colors.orange,
            ),
            inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: Colors.white,
                isDense: false,
                border: inputDecorationBorder,
                focusedBorder: inputDecorationBorder,
                activeIndicatorBorder: const BorderSide(color: Colors.black),
                enabledBorder: inputDecorationBorder.copyWith()),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                    textStyle: MaterialStatePropertyAll(TextStyle(
                        fontSize: 16.sp, fontWeight: FontWeight.w600)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0))),
                    elevation: const MaterialStatePropertyAll(0.0),
                    fixedSize:
                        MaterialStatePropertyAll(Size.fromHeight(45.sp)))),
            useMaterial3: false,
          )),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const OTPAuthScreen();
  }
}
