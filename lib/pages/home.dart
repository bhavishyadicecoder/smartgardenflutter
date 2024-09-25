import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_garden/utlis/theme.dart';
import 'package:smart_garden/widgets/home_carousel.dart';
import 'package:smart_garden/widgets/row_card.dart';
import 'package:smart_garden/widgets/row_multi_card.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final imagesList = [
    "assets/images/banner_image1.jpeg",
    "assets/images/banner_image2.png",
    "assets/images/banner_image3.jpeg",
    "assets/images/banner_image1.jpeg",
    "assets/images/banner_image2.png",
    "assets/images/banner_image3.jpeg", // Add your image paths here
  ];

  final _rowContainerList = [
    {
      'icon': 'assets/icons/humidity_icon.svg',
      'name': 'Humidity',
      'val': '74%'
    },
    {
      'icon': 'assets/icons/temp_icon.svg',
      'name': 'Temperature',
      'val': '23°c',
    },
    {
      'icon': 'assets/icons/water_level_icon.svg',
      'name': 'Water Level',
      'val': '85%'
    },
  ];

  final _conectivityList = [
    {
      'icon': 'assets/icons/contectivity_icon.svg',
      'name': 'Connectivity',
      'val': 'Online'
    },
  ];

  final _nutrientLevelList = [
    {
      'label': 'Nutrient Level',
      'firstIcon': 'assets/icons/meserment_icon.svg',
      'secondIcon': 'assets/icons/plant_refil_icon.svg',
      'gramName': '5 grams left',
      'refillName': 'Refill in 2 days'
    },
  ];

  final _plantStatusList = [
    {
      'label': 'Status',
      'firstIcon': 'assets/icons/plant_growing_icon.svg',
      'secondIcon': 'assets/icons/timer_icon.svg',
      'gramName': '6 plants growing',
      'refillName': 'Next harvest in 3 days'
    },
  ];

  final _lighttStatusList = [
    {
      'icon': 'assets/icons/light_icon.svg',
      'name': 'Light Status',
      'val': 'On'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.lightGrenish,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 20),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Hello, Isaac 🌿"
                      .text
                      .fontFamily(MyTheme.noeDispalyfontFamily)
                      .fontWeight(FontWeight.w500)
                      .size(Vx.dp32)
                      .make(),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF0C9359).withOpacity(0.1),
                    ),
                    child: SizedBox(
                      width: 24, // Explicitly set size
                      height: 24, // Explicitly set size
                      child: SvgPicture.asset(
                        "assets/icons/setting_icon.svg",
                        fit: BoxFit.none, // Avoid scaling the SVG
                      ),
                    ),
                  ),
                ],
              ).pOnly(top: 12, right: 20, left: 20),
              const SizedBox(
                height: 20,
              ),
              // Stack to overlay Container halfway on the Carousel
              Stack(
                children: [
                  // Carousel part
                  HomeCarousel(imagesList: imagesList),

                  // Positioned container
                  Positioned(
                    left: 20,
                    right: 20,
                    bottom:
                        28, // Adjust this value to position the container halfway
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 35),
                      // width: 304.0,
                      child: Material(
                        elevation: 1,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        borderOnForeground: false,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Charlie’s Garden"
                                    .text
                                    .fontFamily(
                                        MyTheme.proximaNovaAltfontFamily)
                                    .fontWeight(FontWeight.w600)
                                    .size(21)
                                    .make(),
                                const SizedBox(
                                  height: 4,
                                ),
                                "ID: 1344295024"
                                    .text
                                    .fontFamily(
                                        MyTheme.proximaNovaAltfontFamily)
                                    .fontWeight(FontWeight.w400)
                                    .size(14)
                                    .color(MyTheme.grey_50)
                                    .make(),
                              ],
                            ),
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xFF0C9359).withOpacity(0.1),
                              ),
                              child: SizedBox(
                                width: 24, // Explicitly set size
                                height: 24, // Explicitly set size
                                child: SvgPicture.asset(
                                  "assets/icons/chevron_right.svg",
                                  fit: BoxFit.none, // Avoid scaling the SVG
                                ),
                              ),
                            ),
                          ],
                        ).pSymmetric(v: 10, h: 18),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              RowCard(
                rowContainerList: _rowContainerList,
              ).pSymmetric(h: 20),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RowCard(rowContainerList: _conectivityList),
                  RowMultiCard(
                    rowContainerList: _nutrientLevelList,
                  )
                ],
              ).pSymmetric(h: 20),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RowMultiCard(
                    rowContainerList: _plantStatusList,
                  ),
                  RowCard(rowContainerList: _lighttStatusList),
                ],
              ).pSymmetric(h: 20),
              // Spacing after the carousel & container
            ],
          ),
        ),
      ),
    );
  }
}
