import 'package:flutter/material.dart';
import 'package:billie_app/core/constants/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PageIndicatorRow extends StatelessWidget {
  final int currentPageIndex;
  final int totalPages;
  final VoidCallback onSkip;

  const PageIndicatorRow({
    super.key,
    required this.currentPageIndex,
    this.totalPages = 4,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return SizedBox(
      height: 24,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(totalPages, (index) {
              final isActive = index == currentPageIndex;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: 48,
                height: 6,
                decoration: BoxDecoration(
                  color: isActive
                      ? AppColors.purple
                      : const Color.fromARGB(255, 235, 232, 229),
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 2),
                      blurRadius: 4,
                      color: Colors.black26
                    )
                  ]
                ),
              );
            }),
          ),

          
          Positioned(
            right: 0,
            child: GestureDetector(
              onTap: onSkip,
              child: Text(
                localization.onBoardingSkip,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'NunitoMedium',
                  color: AppColors.purple.withOpacity(0.7),//%70 opak
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 4),
                      blurRadius: 12,
                      color: Colors.black26
                    )
                  ]
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
