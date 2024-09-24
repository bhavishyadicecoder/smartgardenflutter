import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_garden/utlis/theme.dart';
import 'package:smart_garden/widgets/home_carousel.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.lightGrenish,
      body: SafeArea(
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
            ).pOnly(top: 40, right: 20, left: 20),
            const SizedBox(
              height: 30,
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
                      35, // Adjust this value to position the container halfway
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
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
                                  .fontFamily(MyTheme.proximaNovaAltfontFamily)
                                  .fontWeight(FontWeight.w600)
                                  .size(21)
                                  .make(),
                              const SizedBox(
                                height: 10,
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
                      ).pSymmetric(v: 17, h: 20),
                    ),
                  ),
                )
              ],
            ),
            // const SizedBox(
            //     height: 60), // Spacing after the carousel & container
          ],
        ),
      ),
    );
  }
}
