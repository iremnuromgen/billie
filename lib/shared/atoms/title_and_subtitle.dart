import 'package:flutter/material.dart';
import 'package:billie_app/core/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitle extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomTitle({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      softWrap: true,
      overflow: TextOverflow.visible,
      maxLines: null,
      style: TextStyle(
        fontFamily: 'NunitoExtraBold',
        decoration: TextDecoration.none,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: AppColors.defaultTitleColor,
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  final FontWeight? fontWeight;
  final List<Shadow>? shadows;

  const CustomText({
    Key? key,
    required this.text,
    required this.fontSize,
    this.shadows,
    this.fontWeight,
    this.textColor = AppColors.defaultSubtitleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      softWrap: true,
      overflow: TextOverflow.visible,
      maxLines: null,
      style: TextStyle(
        fontFamily: 'NunitoMedium',
        decoration: TextDecoration.none,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: textColor,
        shadows: shadows
      ),
    );
  }
}
