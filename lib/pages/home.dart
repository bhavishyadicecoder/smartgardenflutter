import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        padding: EdgeInsets.only(bottom: 20.w),
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
                      .size(32.sp)
                      .make(),
                  Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.w),
                      color: const Color(0xFF0C9359).withOpacity(0.1),
                    ),
                    child: SizedBox(
                      width: 24.w, // Explicitly set size
                      height: 24.w, // Explicitly set size
                      child: SvgPicture.asset(
                        "assets/icons/setting_icon.svg",
                        width: 24.w, // Explicitly set size
                        height: 24.w,
                        fit: BoxFit.contain, // Avoid scaling the SVG
                      ).p8(),
                    ),
                  ),
                ],
              ).pOnly(top: 12.w, right: 20.w, left: 20.w),
              SizedBox(
                height: 20.w,
              ),
              // Stack to overlay Container halfway on the Carousel
              PositionCard(
                imagesList: imagesList,
              ),

              SizedBox(
                height: 20.w,
              ),
              RowCard(
                rowContainerList: _rowContainerList,
              ).pSymmetric(h: 20.w),
              SizedBox(
                height: 10.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RowCard(rowContainerList: _conectivityList),
                  RowMultiCard(
                    rowContainerList: _nutrientLevelList,
                  )
                ],
              ).pSymmetric(h: 20.w),
              SizedBox(
                height: 10.w,
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
                        constraints: const BoxConstraints(
                          maxWidth: double.infinity,
                        ),
                        isScrollControlled: true,
                        backgroundColor: Colors.white,
                        builder: (BuildContext context) {
                          return const LightStatusBottomSheet();
                        },
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                      );
                    },
                    child: RowCard(rowContainerList: _lighttStatusList),
                  ),
                ],
              ).pSymmetric(h: 20.w),
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
          left: 20.w,
          right: 20.w,
          bottom: 28.w, // Adjust this value to position the container halfway
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
                            .size(21.w)
                            .make(),
                        const SizedBox(
                          height: 4,
                        ),
                        "ID: 1344295024"
                            .text
                            .fontFamily(MyTheme.proximaNovaAltfontFamily)
                            .fontWeight(FontWeight.w400)
                            .size(14.sp)
                            .color(MyTheme.grey_50)
                            .make(),
                      ],
                    ),
                    Container(
                      width: 32.w,
                      height: 32.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.w),
                        color: const Color(0xFF0C9359).withOpacity(0.1),
                      ),
                      child: SizedBox(
                        width: 24.w, // Explicitly set size
                        height: 24.w, // Explicitly set size
                        child: SvgPicture.asset(
                          "assets/icons/chevron_right.svg",
                          fit: BoxFit.contain, // Avoid scaling the SVG
                        ),
                      ).p8(),
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
      width: double.infinity,
      padding:
          EdgeInsets.only(top: 20.w, bottom: 30.w, left: 20.w, right: 20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // const SizedBox(height: 30),
          "Light Status"
              .text
              .fontFamily(MyTheme.proximaNovaAltfontFamily)
              .fontWeight(FontWeight.w600)
              .size(21.sp)
              .make(),
          SizedBox(height: 15.w),
          const Divider(
            // height: 60,
            thickness: 0.3,
          ),
          SizedBox(height: 15.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "Light"
                  .text
                  .fontFamily(MyTheme.proximaNovaAltfontFamily)
                  .fontWeight(FontWeight.w600)
                  .size(21.sp)
                  .color(MyTheme.green_50)
                  .make(),
              Container(
                child: FlutterSwitch(
                  activeColor: MyTheme.green_20,
                  activeToggleColor: Colors.white,
                  height: 32.w,
                  width: 75.w,
                  toggleSize: 25.w,
                  valueFontSize: 14.sp,
                  value: status,
                  borderRadius: 25.w,
                  activeText: 'ON',
                  inactiveText: 'OFF',
                  showOnOff: true,
                  padding: 4.w,
                  onToggle: (val) {
                    setState(() {
                      status = val;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 15.w),
          const Divider(
            // height: 60,
            thickness: 0.3,
          ),
          SizedBox(height: 15.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              "Automatic Settings"
                  .text
                  .fontFamily(MyTheme.proximaNovaAltfontFamily)
                  .fontWeight(FontWeight.w600)
                  .size(21.sp)
                  .color(MyTheme.green_50)
                  .make(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Off at Sunset"
                      .text
                      .fontFamily(MyTheme.proximaNovaAltfontFamily)
                      .fontWeight(FontWeight.w400)
                      .size(14.sp)
                      .color(MyTheme.green_50.withOpacity(0.75))
                      .make(),
                  const SizedBox(width: 2),
                  SvgPicture.asset(
                    'assets/icons/chevron_right.svg',
                    height: 24.w,
                    width: 24.w,
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 15.w),
          const Divider(
            // height: 60,
            thickness: 0.3,
          ),
          SizedBox(height: 20.w),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: "Go to Settings"
                .text
                .fontFamily(MyTheme.proximaNovaAltfontFamily)
                .fontWeight(FontWeight.w700)
                .size(18.sp)
                .color(MyTheme.green_20)
                .make(),
          ),
          SizedBox(height: 20.w),
        ],
      ),
    );
  }
}
