import 'package:flutter/material.dart';
import 'package:flutter_bloc_practice/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  final Color? textColor;
  final Color? backgroundColor;
  final double size;
  final Widget? child;
  final bool isSelected;
  final Color? borderColor;
  const AppButtons({
    super.key,
    this.textColor,
    this.backgroundColor,
    this.size = 60,
    required this.child,
    this.isSelected = false,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      height: size,
      width: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: borderColor ?? Colors.transparent),
        borderRadius: BorderRadius.circular(16.0),
        color: backgroundColor ?? Colors.grey.shade200,
      ),
      child: child,
    );
  }
}
