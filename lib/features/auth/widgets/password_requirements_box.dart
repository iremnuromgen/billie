//şifre şartları kutusu
import 'package:flutter/material.dart';

class PasswordRequirementsBox extends StatelessWidget {
  final String password;

  const PasswordRequirementsBox({super.key, required this.password});

  bool _hasLowercase(String pass) => RegExp(r'[a-z]').hasMatch(pass);
  bool _hasUppercase(String pass) => RegExp(r'[A-Z]').hasMatch(pass);
  bool _hasDigit(String pass) => RegExp(r'\d').hasMatch(pass);
  bool _hasSpecial(String pass) => RegExp(r'[!@#$%^&*]').hasMatch(pass);
  bool _hasMinLength(String pass) => pass.length >= 8;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildItem("En az 8 karakter", _hasMinLength(password)),
          _buildItem("En az 1 büyük harf (A–Z)", _hasUppercase(password)),
          _buildItem("En az 1 küçük harf (a–z)", _hasLowercase(password)),
          _buildItem("En az 1 rakam (0–9)", _hasDigit(password)),
          _buildItem("En az 1 özel karakter (!, @, #, \$, %...)", _hasSpecial(password)),
        ],
      ),
    );
  }

  Widget _buildItem(String text, bool passed) {
    return Row(
      children: [
        Icon(
          passed ? Icons.check_circle : Icons.radio_button_unchecked,
          color: passed ? Colors.green : Colors.grey,
          size: 18,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            color: passed ? Colors.green.shade800 : Colors.grey.shade700,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}