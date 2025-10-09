//regex ve validation fonksiyonları
import 'dart:math';

class PasswordValidator {
  static final RegExp _regex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$',
  );

  //şifre geçerli mi?
  static bool isValid(String password) {
    return _regex.hasMatch(password) && !_hasRepeatedSequence(password);
  }

  //yinelenen karakterleri engelle
  static bool _hasRepeatedSequence(String password) {
    for (int i = 0; i < password.length - 2; i++) {
      String seq = password.substring(i, i + 2);
      if (password.indexOf(seq, i + 2) != -1) return true;
    }
    return false;
  }

  //şifre gücünü 0 - 100 arasında hesapla
  static int calculateStrength(String password) {
    int score = 0;
    if (password.length >= 8) score += 20;
    if (RegExp(r'[A-Z]').hasMatch(password)) score += 20;
    if (RegExp(r'[a-z]').hasMatch(password)) score += 20;
    if (RegExp(r'\d').hasMatch(password)) score += 20;
    if (RegExp(r'[!@#$%^&*]').hasMatch(password)) score += 20;
    return min(score, 100);
  }

  //şifre gücü seviyesi (zayıf - orta - güçlü)
  static String getStrengthLabel(int score) {
    if (score < 40) return 'Zayıf';
    if (score < 80) return 'Orta';
    return 'Güçlü';
  }
}