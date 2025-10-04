import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:billie_app/core/constants/app_colors.dart';
import 'package:billie_app/core/constants/app_sizes.dart';
import 'package:billie_app/shared/animations/animated_background_shapes.dart';
import 'package:billie_app/shared/molecules/page_indicator_row.dart';
import 'onboarding_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController();
  int _pageIndex = 0;

  List<Map<String, String?>> get pages {
    final loc = AppLocalizations.of(context)!;
    return [
      {
        "image": "assets/images/onboarding-image-first.png",
        "title": loc.onboardingFirstTitle,
        "subtitle": loc.onboardingFirstSubtitle,
      },
      {
        "image": "assets/images/onboarding-image-second.png",
        "title": loc.onboardingSecondTitle,
        "subtitle": loc.onboardingSecondSubtitle,
      },
      {
        "image": "assets/images/onboarding-image-third.png",
        "title": loc.onboardingThirdTitle,
        "subtitle": loc.onboardingThirdSubtitle,
      },
      {
        "image": "assets/images/onboarding-image-fourth.png",
        "title": loc.onboardingFourthTitle,
        "subtitle": loc.onboardingFourthSubtitle,
      },
    ];
  }

  void _goNext() {
    if (_pageIndex < pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutCubic,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  void _skip() {
    _controller.animateToPage(
      pages.length - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(color: AppColors.defaultBackground),
          if (_pageIndex == 0) const AnimatedBackgroundShapes(),

          Column(
            children: [
              // üst kısım: page indicator
              SizedBox(
                height: 80,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
                    child: PageIndicatorRow(
                      currentPageIndex: _pageIndex,
                      totalPages: pages.length,
                      onSkip: _skip,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: pages.length,
                  onPageChanged: (i) => setState(() => _pageIndex = i),
                  itemBuilder: (context, i) {
                    return AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        double page = 0;
                        try {
                          page = _controller.page ?? _controller.initialPage.toDouble();
                        } catch (_) {
                          page = _controller.initialPage.toDouble();
                        }

                        double delta = (page - i).abs();
                        double scale = 1 - (delta * 0.15); // küçülme miktarı
                        double blur = (delta * 8).clamp(0, 8); // blur miktarı

                        return Transform.scale(
                          scale: scale,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                child!,
                                if (blur > 0)
                                  BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: blur,
                                      sigmaY: blur,
                                    ),
                                    child: Container(
                                      color: Colors.black.withOpacity(0),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: OnboardingPage(
                        image: pages[i]["image"],
                        title: pages[i]["title"]!,
                        subtitle: pages[i]["subtitle"]!,
                        onNext: _goNext,
                        titleFontSize: i == 0 ? 32 : 24,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}