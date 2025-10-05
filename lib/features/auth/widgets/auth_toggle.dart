import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthToggle extends StatelessWidget {
  final bool isLogin;
  final VoidCallback onLoginTap;
  final VoidCallback onSignUpTap;

  const AuthToggle({
    super.key,
    required this.isLogin,
    required this.onLoginTap,
    required this.onSignUpTap,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Center(
      child: Container(
        width: 320,
        height: 56,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Stack(
          children: [
            //Kayan beyaz arka plan
            AnimatedAlign(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              alignment:
                  isLogin ? Alignment.centerLeft : Alignment.centerRight,
              child: Container(
                width: 158,
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
            ),

            Row(
              children: [
                // Sign In
                Expanded(
                  child: GestureDetector(
                    onTap: onLoginTap,
                    child: Center(
                      child: Text(
                        loc.loginText,
                        style: TextStyle(
                          color: isLogin
                              ? Colors.black
                              : Colors.grey.shade600,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: 'NunitoMedium',
                        ),
                      ),
                    ),
                  ),
                ),

                // Sign Up
                Expanded(
                  child: GestureDetector(
                    onTap: onSignUpTap,
                    child: Center(
                      child: Text(
                        loc.signupText,
                        style: TextStyle(
                          color: !isLogin
                              ? Colors.black
                              : Colors.grey.shade600,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: 'NunitoMedium',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}