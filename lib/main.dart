import 'package:flutter/material.dart';
import 'package:lightweight_electrum/router/app_router.dart';
import 'package:lightweight_electrum/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Lightweight Electrum',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      routerConfig: AppRouter.router,
    );
  }
}
