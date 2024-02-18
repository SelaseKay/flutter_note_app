import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/config/app_colors.dart';
import 'package:note_app/config/theme.dart';
import 'package:note_app/resources/app_strings.dart';
import 'package:note_app/ux/navigation/navigation.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    final systemTheme = SystemUiOverlayStyle.light
        .copyWith(systemNavigationBarColor: AppColors.primaryColor);

    SystemChrome.setSystemUIOverlayStyle(systemTheme);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.noteApp,
      theme: AppTheme.theme,
      onGenerateRoute: Navigation.onGenerateRoute,
      navigatorKey: Navigation.navigatorKey,
      initialRoute: Navigation.entry,
    );
  }
}
