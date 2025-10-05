import 'package:flutter/material.dart';
import 'package:billie_app/core/constants/app_sizes.dart';
import 'package:billie_app/shared/atoms/title_and_subtitle.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Column(
      key: key,
      children: [
        //Title and Subtitle
        SizedBox(
          height: 150,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.xl),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTitle(
                  text: loc.signupScreenTitle,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: AppSizes.sm),
                CustomSubtitle(text: loc.signupScreenSubtitle, fontSize: 16),
              ],
            ),
          ),
        ),
        //form
        
      ],
    );
  }
}