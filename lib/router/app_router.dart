import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lightweight_electrum/feature/auth/view/login_screen.dart';
import 'package:lightweight_electrum/feature/auth/view/register_screen.dart';
import 'package:lightweight_electrum/feature/booking/view/bike_detail_screen.dart';
import 'package:lightweight_electrum/feature/home/view/home_screen.dart';
import 'package:lightweight_electrum/screen/book_form_screen.dart';
import 'package:lightweight_electrum/screen/success_book_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => RegisterScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/bike-detail/:bikeId',
        name: 'bike-detail',
        builder: (context, state) {
          final bikeId = state.pathParameters['bikeId']!;
          return BikeDetailScreen(bikeId: bikeId);
        },
      ),
      GoRoute(
        path: '/book-form',
        name: 'book-form',
        builder: (context, state) {
          final bikeDetailJson = state.extra as Map<String, dynamic>?;
          if (bikeDetailJson == null) {
            return Scaffold(body: Center(child: Text('No bike selected')));
          }
          return BookFormScreen(bikeDetailJson: bikeDetailJson);
        },
      ),
      GoRoute(
        path: '/success-book',
        name: 'success-book',
        builder: (context, state) => const SuccessBookScreen(),
      ),
    ],
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}
