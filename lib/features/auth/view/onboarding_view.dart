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

  /// Localization kullanarak sayfa içeriklerini döndürüyoruz
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _goNext() {
    if (_pageIndex < pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } else {
      // Son sayfada → login veya home’a yönlendir
      debugPrint("Onboarding tamamlandı → Login ekranına git");
      // Navigator.pushReplacementNamed(context, '/login');
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(color: AppColors.defaultBackground),
          const AnimatedBackgroundShapes(),

          Column(
            children: [
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
              // Sayfalar
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: pages.length,
                  onPageChanged: (i) => setState(() => _pageIndex = i),
                  itemBuilder: (_, i) {
                    final p = pages[i];
                    return OnboardingPage(
                      image: p["image"],
                      title: p["title"]!,
                      subtitle: p["subtitle"]!,
                      onNext: _goNext,
                      titleFontSize: i == 0 ? 32 : 24,
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}