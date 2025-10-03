import 'package:billie_app/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:billie_app/shared/atoms/title_and_subtitle.dart';
import 'package:billie_app/shared/atoms/custom_button.dart';

class OnboardingPage extends StatelessWidget {
  final String? image;
  final String title;
  final String subtitle;
  final double titleFontSize;
  final VoidCallback onNext;

  const OnboardingPage({
    super.key,
    this.image,
    required this.title,
    required this.subtitle,
    this.titleFontSize = 24,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          //Image
          Expanded(
            flex: 6,
            child: Center(
              child: image != null && image!.isNotEmpty
                  ? Image.asset(
                      image!,
                      width: 320,
                      height: 320,
                      fit: BoxFit.contain,
                    )
                  : const SizedBox(height: 320),
            ),
          ),
          //Title and Subtitle
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTitle(
                    text: title,
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 8),
                  CustomSubtitle(text: subtitle, fontSize: 16),
                ],
              ),
            ),
          ),
          //Button
          SizedBox(
            height: 120,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
                child: CustomButton(
                  width: 70,
                  height: 70,
                  borderRadius: BorderRadius.circular(20),
                  icon: Icons.arrow_forward_ios,
                  onTap: onNext,
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}