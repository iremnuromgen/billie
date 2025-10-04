import 'package:billie_app/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:billie_app/core/constants/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PageIndicatorRow extends StatefulWidget {
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
  State<PageIndicatorRow> createState() => _PageIndicatorRowState();
}

class _PageIndicatorRowState extends State<PageIndicatorRow> {
  bool _isPressed = false; // 👈 basılı olup olmadığını takip eder

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return SizedBox(
      height: AppSizes.lg,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(widget.totalPages, (index) {
              final isActive = index == widget.currentPageIndex;
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
                    const BoxShadow(
                      offset: Offset(0, 2),
                      blurRadius: 4,
                      color: Colors.black26,
                    ),
                  ],
                ),
              );
            }),
          ),

          Positioned(
            right: 0,
            child: GestureDetector(
              onTapDown: (_) => setState(() => _isPressed = true),
              onTapUp: (_) {
                setState(() => _isPressed = false);
                widget.onSkip();
              },
              onTapCancel: () => setState(() => _isPressed = false),
              child: AnimatedOpacity(
                opacity: _isPressed ? 0.5 : 1.0,
                duration: const Duration(milliseconds: 120),
                child: Text(
                  localization.onBoardingSkip,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'NunitoMedium',
                    color: AppColors.purple.withOpacity(0.7),
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                    shadows: const [
                      Shadow(
                        offset: Offset(0, 4),
                        blurRadius: 12,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}