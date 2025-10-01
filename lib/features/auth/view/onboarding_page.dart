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
    required this.onNext
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 120),
            if (image != null && image!.isNotEmpty)
              Image.asset(
                image!,
                width: 320,
                height: 320,
                fit: BoxFit.contain,
              )
            else
              const SizedBox(height: 320),
            const SizedBox(height: 120),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  CustomTitle(text: title, fontSize: titleFontSize, fontWeight: FontWeight.w600),
                  CustomSubtitle(text: subtitle, fontSize: 16),
                ],
              ),
            ),
            const SizedBox(height: 30),
            CustomButton(
              width: 70,
              height: 70,
              borderRadius: BorderRadius.circular(20),
              icon: Icons.arrow_forward_ios,
              onTap: onNext,
            ),
          ],
        ),
      ),
    );
  }
}