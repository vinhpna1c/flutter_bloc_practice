import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/cubit/app_cubit.dart';
import 'package:flutter_bloc_practice/cubit/app_cubit_states.dart';
import 'package:flutter_bloc_practice/misc/colors.dart';
import 'package:flutter_bloc_practice/models/place.dart';
import 'package:flutter_bloc_practice/services/data_service.dart';
import 'package:flutter_bloc_practice/widgets/app_large_text.dart';
import 'package:flutter_bloc_practice/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final exploreMap = {
    "Balloning": "balloning.png",
    "Hiking": "hiking.png",
    "Kayaking": "kayaking.png",
    "Snorkling": "snorkling.png"
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
          if (state is LoadedState) {
            final places = state.places;
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.menu,
                            size: 30,
                            color: Colors.black54,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppLargeText(text: "Discover"),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 6),
                      child: TabBar(
                          controller: _tabController,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          isScrollable: true,
                          labelPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4.0),
                          indicatorSize: TabBarIndicatorSize.label,
                          dividerColor: Colors.transparent,
                          indicator: CircleTabIndicator(
                              color: AppColors.mainColor, radius: 4),
                          tabs: const [
                            Tab(
                              text: "Places",
                            ),
                            Tab(
                              text: "Inspiration",
                            ),
                            Tab(
                              text: "Emotion",
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 300,
                      child: TabBarView(controller: _tabController, children: [
                        ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(places.length, (index) {
                            Place place = places[index];
                            return GestureDetector(
                              onTap: () {
                                BlocProvider.of<AppCubits>(context)
                                    .getDetailPlace(place);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 12),
                                width: 200,
                                height: 300,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        '${DataServices.BASE_URL}/uploads/${place.img}'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                        Text("HI 2"),
                        Text("HI 3"),
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                            text: "Explore more",
                            size: 22,
                          ),
                          AppText(
                            text: "See all",
                            color: AppColors.textColor1,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 120,
                      child:
                          ListView(scrollDirection: Axis.horizontal, children: [
                        ...exploreMap.keys.map((option) => Container(
                              margin: const EdgeInsets.only(right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                        image: DecorationImage(
                                            image: AssetImage(
                                              'assets/img/${exploreMap[option]!}',
                                            ),
                                            fit: BoxFit.cover)),
                                  ),
                                  AppText(
                                      text: option,
                                      size: 14,
                                      color: AppColors.textColor2)
                                ],
                              ),
                            ))
                      ]),
                    )
                  ]),
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(
      color: color,
      radius: radius,
    );
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _painter = Paint();
    _painter.color = color;
    _painter.isAntiAlias = true;
    final Offset newOffset = Offset(
        configuration.size!.width / 2 - radius / 2, configuration.size!.height);
    canvas.drawCircle(offset + newOffset, radius, _painter);
  }
}
