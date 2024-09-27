import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:smart_garden/utlis/theme.dart';

import 'package:velocity_x/velocity_x.dart';

class GardenDetails extends StatelessWidget {
  const GardenDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.lightGrenish,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 414, // Make container full width
                height: 245, // Set a height for the container
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image:
                        AssetImage("assets/images/garden_details_banner.png"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/chevron_left_icon.svg',
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          "Go back"
                              .text
                              .fontFamily(MyTheme.proximaNovaAltfontFamily)
                              .fontWeight(FontWeight.w700)
                              .size(18.sp)
                              .color(MyTheme.green_20)
                              .make(),
                        ],
                      ),
                    ).pSymmetric(v: 8),
                    Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.w),
                        color: Colors.white,
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: SizedBox(
                          width: 24.w, // Explicitly set size
                          height: 24.w,
                          // Explicitly set size
                          child: SvgPicture.asset(
                            "assets/icons/list_dot_icon.svg",
                            fit: BoxFit.contain,
                            // Avoid scaling the SVG
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ).pSymmetric(h: 16),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Charlie’s Garden"
                  .text
                  .fontFamily(MyTheme.noeDispalyfontFamily)
                  .fontWeight(FontWeight.w500)
                  .size(32.sp)
                  .make(),
              "ID: 1344295024"
                  .text
                  .fontFamily(MyTheme.proximaNovaAltfontFamily)
                  .fontWeight(FontWeight.w400)
                  .size(14.sp)
                  .color(Color(0xFF111111).withOpacity(0.50))
                  .make(),
              // CustomTabBar(),
            ],
          ).pSymmetric(h: 16, v: 16)
        ],
      ),
    );
  }
}

// class CustomTabBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 60,
//       decoration: BoxDecoration(
//         color: Colors.green[50], // Light background color
//         borderRadius: BorderRadius.circular(25),
//       ),
//       child: TabBar(
//         indicator: BoxDecoration(
//           color: Colors.white, // Selected tab background color
//           borderRadius: BorderRadius.circular(25),
//         ),
//         labelColor: Colors.green[900], // Selected tab text color
//         unselectedLabelColor: Colors.green[300], // Unselected tab text color
//         labelStyle: const TextStyle(
//           fontWeight: FontWeight.bold, // Bold text for selected tab
//         ),
//         tabs: const [
//           Tab(text: "PLANTS"),
//           Tab(text: "LOG"),
//           Tab(text: "SETTINGS"),
//         ],
//       ),
//     );
//   }
// }
