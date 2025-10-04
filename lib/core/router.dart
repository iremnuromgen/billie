import 'package:billie_app/features/auth/view/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:billie_app/features/auth/view/login_view.dart';


class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginView());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('404 - Sayfa bulunamadı')),
          ),
        );
    }
  }
}