import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/cubit/app_cubit.dart';
import 'package:flutter_bloc_practice/cubit/app_cubit_logics.dart';
import 'package:flutter_bloc_practice/cubit/app_cubit_states.dart';
import 'package:flutter_bloc_practice/misc/colors.dart';
import 'package:flutter_bloc_practice/services/data_service.dart';
import 'package:flutter_bloc_practice/widgets/app_large_text.dart';
import 'package:flutter_bloc_practice/widgets/app_text.dart';
import 'package:flutter_bloc_practice/widgets/responsive_button.dart';

import '../widgets/app_buttons.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final place =
        (BlocProvider.of<AppCubits>(context).state as DetailState).place;
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
          // final place = (state as DetailState).place;
          int gottonStar = place.stars ?? 0;
          int nPeopleGroup = place.people ?? 0;
          return Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              '${DataServices.BASE_URL}/uploads/${place.img ?? ''}'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                    margin: const EdgeInsets.only(top: 30, left: 20),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              BlocProvider.of<AppCubits>(context).goHome();
                            },
                            icon: Icon(Icons.menu))
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 350,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 350,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppLargeText(
                                    text: place.name ?? "",
                                    color: Colors.black54),
                                AppText(
                                    text: "\$ ${place.price ?? 0}",
                                    color: AppColors.mainColor)
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on,
                                    color: AppColors.mainColor),
                                AppText(
                                    text: place.location ?? '',
                                    color: AppColors.textColor1),
                              ],
                            ),
                            Row(
                              children: [
                                Wrap(
                                  children: List.generate(
                                      5,
                                      (index) => Icon(
                                            index < gottonStar
                                                ? Icons.star
                                                : Icons.star_border_outlined,
                                            color: index < gottonStar
                                                ? Colors.yellow
                                                : Colors.grey,
                                          )),
                                ),
                                AppText(
                                  text: "(${(place.stars ?? 0) * 1.0})",
                                  color: AppColors.textColor2,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AppLargeText(
                              text: "People",
                              color: Colors.black.withOpacity(0.8),
                              size: 20,
                            ),
                            AppText(
                              text: "Number of people in your group",
                              color: AppColors.mainTextColor,
                              size: 14,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Wrap(
                              children: List.generate(
                                5,
                                (index) => InkWell(
                                  onTap: () {
                                    setState(() {
                                      nPeopleGroup = index + 1;
                                    });
                                  },
                                  child: AppButtons(
                                    backgroundColor: index == nPeopleGroup
                                        ? Colors.black87
                                        : null,
                                    textColor: index == nPeopleGroup
                                        ? Colors.white
                                        : null,
                                    child: AppText(
                                      text: (index + 1).toString(),
                                      color: (index + 1) == nPeopleGroup
                                          ? Colors.white
                                          : Colors.black87,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AppLargeText(
                              text: "Description",
                              color: Colors.black.withOpacity(0.8),
                              size: 20,
                            ),
                            AppText(
                              text: place.description ?? '',
                              color: AppColors.mainTextColor,
                              size: 14,
                            ),
                            SizedBox(
                              height: 100,
                            )
                          ]),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    child: Container(
                      // color: Colors.red,
                      width: MediaQuery.of(context).size.width - 40,
                      // height: 80,
                      margin: const EdgeInsets.only(
                          bottom: 20, left: 20, right: 20),
                      child: Row(children: [
                        AppButtons(
                          child: Icon(
                            Icons.favorite_outline,
                          ),
                        ),
                        Expanded(
                          child: ResponsiveButton(
                            isResponsive: true,
                          ),
                        )
                      ]),
                    ))
              ],
            ),
          );
        }),
      ),
    );
  }
}
