import 'package:flutter/material.dart';
import 'package:billie_app/core/constants/app_sizes.dart';
import 'package:billie_app/shared/atoms/title_and_subtitle.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:billie_app/shared/atoms/custom_text_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Title and Subtitle
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.xxl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: AppSizes.sm),
              CustomTitle(
                text: loc.signupScreenTitle,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: AppSizes.sm),
              CustomText(
                text: loc.signupScreenSubtitle,
                fontSize: 16,
              ),
              const SizedBox(height: AppSizes.xl),
            ],
          ),
        ),

        // Form alanı
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 320,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 188, 120, 120),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextField(
                  controller: _emailController,
                  hintText: loc.emailHint,
                  prefixIcon: Icons.email_outlined,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}