import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/cubit/app_cubit.dart';
import 'package:flutter_bloc_practice/misc/colors.dart';
import 'package:flutter_bloc_practice/widgets/app_large_text.dart';
import 'package:flutter_bloc_practice/widgets/app_text.dart';
import 'package:flutter_bloc_practice/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

final List<String> cover_images = [
  "welcome-one.png",
  "welcome-two.png",
  "welcome-three.png",
];

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (_, index) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/${cover_images[index]}"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(
                top: 150,
                left: 20,
                right: 20,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: "Trips"),
                        AppText(
                          text: "Mountain",
                          size: 30,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20, bottom: 20),
                          width: 250,
                          child: AppText(
                            text:
                                "Mountain hikes give you an incredible sense of freedom along with endurance test",
                            color: AppColors.textColor2,
                            size: 14,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context).getData();
                          },
                          child: const ResponsiveButton(
                            width: 120,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        ...List.generate(
                          3,
                          (indexSlider) => Container(
                            margin: EdgeInsets.only(bottom: 4),
                            width: 8,
                            height: index == indexSlider ? 25 : 8,
                            decoration: BoxDecoration(
                              color: AppColors.mainColor.withOpacity(
                                  index == indexSlider ? 1.0 : 0.3),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    )
                  ]),
            ),
          );
        },
      ),
    );
  }
}
