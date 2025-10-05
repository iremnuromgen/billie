import 'package:flutter/material.dart';
import 'package:billie_app/core/constants/app_sizes.dart';
import 'package:billie_app/shared/atoms/title_and_subtitle.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

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
                  text: loc.loginScreenTitle,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: AppSizes.sm),
                CustomSubtitle(text: loc.loginScreenSubtitle, fontSize: 16),
              ],
            ),
          ),
        ),
        //form
        Expanded(
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 320,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Form burada olacak"),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}