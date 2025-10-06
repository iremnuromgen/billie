import 'package:flutter/material.dart';
import 'package:billie_app/core/constants/app_sizes.dart';
import 'package:billie_app/core/constants/app_colors.dart';

class CustomButton extends StatefulWidget {
  final double? width;
  final double? height;
  final String? text;
  final IconData? icon;

  // Yeni parametreler
  final double? iconSize;
  final Color? iconColor;

  final TextStyle? textStyle;

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
    this.icon,
    this.iconSize,
    this.iconColor,
    this.text,
    this.textStyle,
    this.color,
    this.pressedColor,
    this.borderColor,
    this.pressedBorderColor,
    this.borderWidth = 2,
    this.contentColor,
    this.pressedContentColor,
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
          borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
          border: Border.all(color: brColor, width: widget.borderWidth),
        ),
        alignment: Alignment.center,
        child: _buildContent(ctColor),
      ),
    );
  }

  Widget _buildContent(Color contentColor) {
    final textStyle = widget.textStyle ??
        TextStyle(
          color: contentColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: 'NunitoMedium',
        );

    final iconColor = widget.iconColor ?? contentColor;
    final iconSize = widget.iconSize ?? 24.0;

  
    if (widget.icon != null && widget.text != null) {
      return Stack(
        alignment: Alignment.center,
        children: [
          // ikon solda
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: AppSizes.md),
              child: Icon(widget.icon, color: iconColor, size: iconSize),
            ),
          ),
          // yazı ortada
          Center(
            child: Text(
              widget.text!,
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    } 
    else if (widget.text != null) {
      return Text(widget.text!, style: textStyle, textAlign: TextAlign.center);
    } 
    else if (widget.icon != null) {
      return Icon(widget.icon, color: iconColor, size: iconSize);
    } 
    else {
      return const SizedBox.shrink();
    }
  }
}