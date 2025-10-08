import 'package:billie_app/features/home/view/dashboard_view.dart';
import 'package:billie_app/features/onboarding/view/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:billie_app/features/auth/view/auth_view.dart';


class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case '/login':
        return MaterialPageRoute(builder: (_) => const AuthView());
      case '/dashboard':
        return MaterialPageRoute(builder: (_) => const DashboardView());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('404 - Sayfa bulunamadı')),
          ),
        );
    }
  }
}