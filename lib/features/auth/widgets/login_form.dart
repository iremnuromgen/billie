import 'package:billie_app/core/constants/app_colors.dart';
import 'package:billie_app/shared/atoms/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:billie_app/core/constants/app_sizes.dart';
import 'package:billie_app/shared/atoms/title_and_subtitle.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:billie_app/shared/atoms/custom_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true; //şifre gizli mi değil mi?

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                text: loc.loginScreenTitle,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              CustomText(
                text: loc.loginScreenSubtitle,
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
            padding: const EdgeInsets.all(AppSizes.lg),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.10),
                  blurRadius: 10,
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.10),
                  blurRadius: 25,
                  offset: const Offset(0, 20),
                ),
              ]
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
                const SizedBox(height: AppSizes.md),
                CustomTextField(
                  controller: _passwordController,
                  hintText: loc.passwordHint,
                  prefixIcon: Icons.lock,
                  obscureText: _obscurePassword,
                  onToggleVisibility: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
                const SizedBox(height: AppSizes.md),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      print("forgot password'e git");
                    },
                    child: CustomText(
                      text: loc.forgotPassword,
                      fontSize: 16,
                      textColor: AppColors.purple,
                    )
                  ),
                ),
                const SizedBox(height: AppSizes.md),
                CustomButton(
                  height: 56,
                  width: double.infinity,
                  borderRadius: BorderRadius.circular(10),
                  borderColor: AppColors.purple,
                  text: loc.loginText,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  color: AppColors.purple,
                  onTap: () {
                    print("giriş yapıldı");
                  }
                ),
                const SizedBox(height: AppSizes.md),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Color(0xFFD1D5DB), // açık gri
                        indent: 10,
                        endIndent: 10,
                      ),
                    ),
                    CustomText(
                      text: loc.orText,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    const Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Color(0xFFD1D5DB),
                        indent: 10,
                        endIndent: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.md),
                CustomButton(
                  height: 56,
                  width: double.infinity,
                  borderRadius: BorderRadius.circular(10),
                  borderColor: const Color(0xFFE5E7EB),
                  color: Colors.white,
                  icon: Icons.g_mobiledata,
                  iconColor: Color(0xFF4285F4),
                  iconSize: 36, // Google ikonu
                  text: loc.loginWithGoogle, // örn: “Continue with Google”
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  onTap: () {
                    print("Google ile giriş yapıldı");
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
