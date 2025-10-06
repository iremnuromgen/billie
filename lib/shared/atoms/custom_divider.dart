import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double thickness;
  final Color color;
  final double indent;
  final double endIndent;

  const CustomDivider({
    super.key,
    this.thickness = 1.0,
    this.color = const Color(0xFFD1D5DB),
    this.indent = 10.0,
    this.endIndent = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness,
      color: color,
      indent: indent,
      endIndent: endIndent,
    );
  }
}