import 'package:billie_app/core/constants/app_sizes.dart';
import 'package:billie_app/shared/molecules/page_indicator_row.dart';
import 'package:flutter/material.dart';
import 'package:billie_app/shared/atoms/title_and_subtitle.dart';
import 'package:billie_app/shared/atoms/custom_button.dart';

class OnboardingPage extends StatelessWidget {
  final String? image;
  final String title;
  final String subtitle;
  final double titleFontSize;
  final int currentPageIndex;
  final int totalPages;
  final VoidCallback onNext;
  final VoidCallback onSkip;

  const OnboardingPage({
    super.key,
    this.image,
    required this.title,
    required this.subtitle,
    this.titleFontSize = 24,
    required this.currentPageIndex,
    required this.totalPages,
    required this.onNext,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          //Indicator
          Container(
            height: 80,
            color: Colors.amber,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
                child: PageIndicatorRow(
                  currentPageIndex: currentPageIndex,
                  totalPages: totalPages,
                  onSkip: onSkip,
                ),
              ),
            ),
          ),
          //Image
          Expanded(
            flex: 6,
            child: Container(
              color: Colors.red,
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
          ),
          //Title and Subtitle
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTitle(
                      text: title,
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: AppSizes.sm),
                    CustomSubtitle(text: subtitle, fontSize: 16),
                  ],
                ),
              ),
            ),
          ),
          //Button
          Container(
            color: Colors.pink,
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