import 'package:flutter/material.dart';
import 'package:flutter_template/shared/constants.dart';
import 'package:get_it/get_it.dart';

final appMediaQuery = MediaQuery.of(appNavigationKey.currentState!.context);
final appTextTheme = Theme.of(appNavigationKey.currentState!.context).textTheme;

final getIt = GetIt.instance;