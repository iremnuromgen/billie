import 'package:billie_app/core/constants/app_sizes.dart';
import 'package:billie_app/features/auth/widgets/auth_toggle.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:billie_app/shared/atoms/title_and_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:billie_app/core/constants/app_colors.dart';
import '../widgets/login_form.dart';
import '../widgets/signup_form.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  bool _isLogin = true; // 👈 Hangi sekme aktif

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.defaultBackground,
      body: SafeArea(
        child: Column(
          children: [
            //Toggle
            SizedBox(
              height: 100,
              child: Center(
                child: AuthToggle(
                  isLogin: _isLogin,
                  onLoginTap: () => setState(() => _isLogin = true),
                  onSignUpTap: () => setState(() => _isLogin = false),
                ),
              ),
            ),
            //Form
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, anim) => FadeTransition(
                  opacity: anim,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.1, 0),
                      end: Offset.zero,
                    ).animate(anim),
                    child: child,
                  ),
                ),
                child: _isLogin
                    ? const LoginForm(key: ValueKey('login'))
                    : const SignUpForm(key: ValueKey('signup')),
              ),
            ),
            //yönlendirme
            SizedBox(
              height: 80,
              child: Center(
                child: GestureDetector(
                  onTap: () => setState(() => _isLogin = !_isLogin),
                  child: Text.rich(
                    TextSpan(
                      text: _isLogin
                          ? loc.authNoAccount
                          : loc.authHaveAccount,
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 15,
                      ),
                      children: [
                        TextSpan(
                          text: _isLogin
                              ? " ${loc.signupText}"
                              : " ${loc.loginText}",
                          style: TextStyle(
                            color: AppColors.purple,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}