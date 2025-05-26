import 'package:flutter/material.dart';
import 'package:billie_app/core/constants/app_sizes.dart';
import 'package:billie_app/core/constants/app_colors.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnboardingFirstView extends StatefulWidget {
  const OnboardingFirstView({super.key});

  @override
  State<OnboardingFirstView> createState() => _OnboardingFirstViewState();
}

class _OnboardingFirstViewState extends State<OnboardingFirstView> {
  @override
  Widget build(BuildContext context) {
    final Localization = AppLocalizations.of(context)!;
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/billie-bg.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      )
    );
  }
}