import 'package:flutter/material.dart';
import 'package:flutter_bloc_practice/misc/colors.dart';

class ResponsiveButton extends StatelessWidget {
  final bool isResponsive;
  final double? width;
  const ResponsiveButton({super.key, this.isResponsive = false, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mainColor,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset('assets/img/button-one.png'),
      ]),
    );
  }
}
