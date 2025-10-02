import 'package:billie_app/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:billie_app/core/constants/app_colors.dart';

class CustomButton extends StatefulWidget {
  final double? width;
  final double? height;
  final String? text;
  final IconData? icon;

  // Background
  final Color? color;
  final Color? pressedColor;

  // Border
  final Color? borderColor;
  final Color? pressedBorderColor;
  final double borderWidth;

  // İçerik (metin/ikon) rengi
  final Color? contentColor;
  final Color? pressedContentColor;

  final BorderRadius? borderRadius;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    required this.width,
    required this.height,
    required this.onTap,
    this.contentColor,
    this.pressedContentColor,
    this.borderColor,
    this.pressedBorderColor,
    this.borderWidth = 2,
    this.text,
    this.icon,
    this.color,
    this.pressedColor,
    this.borderRadius,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _pressed = false;

  void _setPressed(bool value) => setState(() => _pressed = value);

  @override
  Widget build(BuildContext context) {
    // Güvenli varsayılanlar:
    final Color bgColor = _pressed
        ? (widget.pressedColor ?? widget.color ?? AppColors.purple)
        : (widget.color ?? Colors.white);

    final Color brColor = _pressed
        ? (widget.pressedBorderColor ?? widget.borderColor ?? AppColors.purple)
        : (widget.borderColor ?? AppColors.purple);

    final Color ctColor = _pressed
        ? (widget.pressedContentColor ?? Colors.white)
        : (widget.contentColor ?? AppColors.purple);

    return GestureDetector(
      onTapDown: (_) => _setPressed(true),
      onTapUp: (_) {
        _setPressed(false);
        widget.onTap();
      },
      onTapCancel: () => _setPressed(false),
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: widget.borderRadius,
          border: Border.all(color: brColor, width: widget.borderWidth),
        ),
        alignment: Alignment.center,
        child: _buildContent(ctColor),
      ),
    );
  }

  Widget _buildContent(Color contentColor) {
    if (widget.icon != null && widget.text != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(widget.icon, color: contentColor),
          const SizedBox(width: AppSizes.sm),
          Text(
            widget.text!,
            style: TextStyle(color: contentColor, fontSize: 16),
          ),
        ],
      );
    } else if (widget.icon != null) {
      return Icon(widget.icon, color: contentColor);
    } else if (widget.text != null) {
      return Text(
        widget.text!,
        style: TextStyle(color: contentColor, fontSize: 16),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}