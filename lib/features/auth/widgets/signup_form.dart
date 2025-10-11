import 'package:billie_app/core/constants/app_colors.dart';
import 'package:billie_app/features/auth/widgets/password_requirements_box.dart';
import 'package:billie_app/shared/atoms/custom_button.dart';
import 'package:billie_app/shared/atoms/custom_divider.dart';
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
  final _signupFullNameController = TextEditingController();
  final _signupEmailController = TextEditingController();
  final _signupPasswordController = TextEditingController();
  final _signupConfirmPasswordController = TextEditingController();

  final FocusNode _confirmPasswordFocus = FocusNode();

  bool _showPasswordRequirements = false;
  String _currentPassword = "";
  bool _obscurePassword = true; //şifre gizli mi değil mi?
  String? _passwordError; // 👈 hata mesajı için
  bool _isConfirmFocused = false;

  @override
  void initState() {
    super.initState();
    _confirmPasswordFocus.addListener(() {
      setState(() {
        _isConfirmFocused = _confirmPasswordFocus.hasFocus;
      });
      _validatePasswords();
    });
  }

  @override
  void dispose() {
    _signupEmailController.dispose();
    _signupPasswordController.dispose();
    _signupFullNameController.dispose();
    _signupConfirmPasswordController.dispose();
    _confirmPasswordFocus.dispose();
    super.dispose();
  }

  void _validatePasswords() {
    final password = _signupPasswordController.text.trim();
    final confirm = _signupConfirmPasswordController.text.trim();

    setState(() {
      if (confirm.isNotEmpty && password != confirm) {
        _passwordError = AppLocalizations.of(context)!.passwordsDoNotMatch;
      } else {
        _passwordError = null;
      }
    });
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
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextField(
                  controller: _signupFullNameController,
                  hintText: loc.fullNameHint,
                  prefixIcon: Icons.person,
                  onTap: () {
                    setState(() {
                      _showPasswordRequirements = false;
                    });
                  },
                ),
                const SizedBox(height: AppSizes.md),
                CustomTextField(
                  controller: _signupEmailController,
                  hintText: loc.emailHint,
                  prefixIcon: Icons.email_outlined,
                  onTap: () {
                    setState(() {
                      _showPasswordRequirements = false;
                    });
                  },
                ),
                const SizedBox(height: AppSizes.md),
                CustomTextField(
                  controller: _signupPasswordController,
                  hintText: loc.passwordHint,
                  prefixIcon: Icons.lock,
                  obscureText: _obscurePassword,
                  onChanged: (value) {
                    setState(() {
                      _currentPassword = value;
                    });
                    _validatePasswords();
                  },
                  onTap: () {
                    setState(() {
                      _showPasswordRequirements = true;
                    });
                  },
                  onToggleVisibility: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
                if (_showPasswordRequirements) ...[
                  SizedBox(height: AppSizes.sm),
                  PasswordRequirementsBox(password: _currentPassword),
                ],
                SizedBox(height: _showPasswordRequirements ? AppSizes.sm : AppSizes.md),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      controller: _signupConfirmPasswordController,
                      focusNode: _confirmPasswordFocus,
                      hintText: loc.confirmPasswordHint,
                      prefixIcon: Icons.lock,
                      onChanged: (_) => _validatePasswords(),
                      onTap: () {
                        setState(() {
                          _showPasswordRequirements = false;
                        });
                      },
                    ),
                    if (_isConfirmFocused && _passwordError != null) ...[
                      const SizedBox(height: AppSizes.xs),
                      CustomText(
                        text: _passwordError!,
                        fontSize: 13,
                        textColor: Colors.red,
                      )
                    ],
                  ],
                ),
                SizedBox(height: _isConfirmFocused && _passwordError != null ? AppSizes.xs : AppSizes.md),
                CustomButton(
                  height: 56,
                  width: double.infinity,
                  borderRadius: BorderRadius.circular(10),
                  borderColor: AppColors.purple,
                  text: loc.signupText,
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  color: AppColors.purple,
                  onTap: () {
                    _validatePasswords();
                    if (_passwordError == null) {
                      print("Kayıt başarılı");
                    }
                  },
                ),
                const SizedBox(height: AppSizes.md),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(child: CustomDivider()),
                    CustomText(
                      text: loc.orText,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    const Expanded(child: CustomDivider()),
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
                  iconColor: const Color(0xFF4285F4),
                  iconSize: 36,
                  text: loc.loginWithGoogle,
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