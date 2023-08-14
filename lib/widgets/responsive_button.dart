import 'package:flutter/material.dart';
import 'package:flutter_bloc_practice/misc/colors.dart';
import 'package:flutter_bloc_practice/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  final bool isResponsive;
  final double? width;
  const ResponsiveButton({super.key, this.isResponsive = false, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mainColor,
      ),
      child: Row(
          mainAxisAlignment: isResponsive
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isResponsive
                ? AppText(
                    text: "Book Trip Now",
                    color: Colors.white,
                  )
                : SizedBox(),
            Image.asset('assets/img/button-one.png'),
          ]),
    );
  }
}
