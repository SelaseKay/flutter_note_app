import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/config/theme.dart';
import 'package:note_app/ux/navigation/navigation.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      onGenerateRoute: Navigation.onGenerateRoute,
      navigatorKey: Navigation.navigatorKey,
      initialRoute: Navigation.entry,
    );
  }
}

