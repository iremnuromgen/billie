import 'package:flutter/material.dart';
import 'package:billie_app/core/constants/app_colors.dart';

class AnimatedBackgroundShapes extends StatefulWidget {
  const AnimatedBackgroundShapes({super.key});

  @override
  State<AnimatedBackgroundShapes> createState() => _AnimatedBackgroundShapesState();
}

class _AnimatedBackgroundShapesState extends State<AnimatedBackgroundShapes> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final Duration animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: animationDuration,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 15).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _animatedShape({
    required double top,
    required double left,
    required double width,
    required double height,
    required Color color,
    bool isOval = false,
  }) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Positioned(
          top: top + _animation.value,
          left: left,
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: color,
              shape: isOval ? BoxShape.rectangle : BoxShape.circle,
              borderRadius: isOval ? BorderRadius.circular(height / 2) : null,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        _animatedShape(
          top: 100,
          width: 32,
          height: 32,
          left: size.width - 100,
          color: AppColors.paleYellow,
        ),
        _animatedShape(
          top: 150,
          left: 60,
          width: 35,
          height: 24,
          color: AppColors.mintGreen,
          isOval: true,
        ),
        _animatedShape(
          top: size.height / 2 + 100,
          left: size.width / 2 - 120,
          width: 24,
          height: 24,
          color: AppColors.pink,
        ),
      ],
    );
  }
}