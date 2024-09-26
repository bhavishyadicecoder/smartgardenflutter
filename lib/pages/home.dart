import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_garden/utlis/routes.dart';
import 'package:smart_garden/utlis/theme.dart';
import 'package:smart_garden/widgets/home_carousel.dart';
import 'package:smart_garden/widgets/row_card.dart';
import 'package:smart_garden/widgets/row_multi_card.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        padding: const EdgeInsets.only(bottom: 20),
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
              PositionCard(
                imagesList: imagesList,
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
                  InkWell(
                    onTap: () {
                      showModalBottomSheet<void>(
                        enableDrag: true,
                        context: context,
                        showDragHandle: true,
                        isScrollControlled: true,
                        backgroundColor: Colors.white,
                        builder: (BuildContext context) {
                          return const LightStatusBottomSheet();
                        },
                      );
                    },
                    child: RowCard(rowContainerList: _lighttStatusList),
                  ),
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

class PositionCard extends StatelessWidget {
  final List<String> imagesList;
  const PositionCard({super.key, required this.imagesList});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Carousel part
        HomeCarousel(imagesList: imagesList),

        // Positioned container
        Positioned(
          left: 20,
          right: 20,
          bottom: 28, // Adjust this value to position the container halfway
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 35),
            // width: 304.0,
            child: Material(
              elevation: 1,
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              borderOnForeground: false,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.gardenDetailRoute);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Charlie’s Garden"
                            .text
                            .fontFamily(MyTheme.proximaNovaAltfontFamily)
                            .fontWeight(FontWeight.w600)
                            .size(21)
                            .make(),
                        const SizedBox(
                          height: 4,
                        ),
                        "ID: 1344295024"
                            .text
                            .fontFamily(MyTheme.proximaNovaAltfontFamily)
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
          ),
        )
      ],
    );
  }
}

class LightStatusBottomSheet extends StatefulWidget {
  const LightStatusBottomSheet({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LightStatusBottomSheetState createState() => _LightStatusBottomSheetState();
}

class _LightStatusBottomSheetState extends State<LightStatusBottomSheet> {
  bool isLightOn = false;
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 40, left: 30, right: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 8.0,
            width: 48.0,
            decoration: BoxDecoration(
              color: MyTheme.green_50.withOpacity(0.25),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(height: 30),
          "Light Status"
              .text
              .fontFamily(MyTheme.proximaNovaAltfontFamily)
              .fontWeight(FontWeight.w600)
              .size(21)
              .make(),
          const SizedBox(height: 20),
          const Divider(
            // height: 60,
            thickness: 0.3,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "Light"
                  .text
                  .fontFamily(MyTheme.proximaNovaAltfontFamily)
                  .fontWeight(FontWeight.w600)
                  .size(21)
                  .color(MyTheme.green_50)
                  .make(),
              FlutterSwitch(
                activeColor: MyTheme.green_20,
                activeToggleColor: Colors.white,
                height: 32.0,
                valueFontSize: 14.0,
                value: status,
                borderRadius: 30.0,
                activeText: 'ON',
                inactiveText: 'OFF',
                showOnOff: true,
                onToggle: (val) {
                  setState(() {
                    status = val;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Divider(
            // height: 60,
            thickness: 0.3,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "Automatic Settings"
                  .text
                  .fontFamily(MyTheme.proximaNovaAltfontFamily)
                  .fontWeight(FontWeight.w600)
                  .size(21)
                  .color(MyTheme.green_50)
                  .make(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Off at Sunset"
                      .text
                      .fontFamily(MyTheme.proximaNovaAltfontFamily)
                      .fontWeight(FontWeight.w400)
                      .size(14)
                      .color(MyTheme.green_50.withOpacity(0.75))
                      .make(),
                  const SizedBox(width: 2),
                  SvgPicture.asset('assets/icons/chevron_right.svg')
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Divider(
            // height: 60,
            thickness: 0.3,
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: "Go to Settings"
                .text
                .fontFamily(MyTheme.proximaNovaAltfontFamily)
                .fontWeight(FontWeight.w700)
                .size(18)
                .color(MyTheme.green_20)
                .make(),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
