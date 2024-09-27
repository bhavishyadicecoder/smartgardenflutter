import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_garden/utlis/routes.dart';
import 'package:smart_garden/utlis/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.themeGreenBgColor,
        extendBodyBehindAppBar: true,
        body: Container(
          // Use a gradient as the background for the entire screen
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [MyTheme.green_10, MyTheme.green_20],
              // begin: Alignment.topLeft,
              // end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 70.h,
                    ),
                    Image.asset(
                      "assets/images/logo.png",
                      height: 32,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Image.asset(
                      "assets/images/AEPOD.png",
                      height: 16,
                    ),
                  ],
                ),

                // ),
                const Spacer(),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: "Welcome to Aepod"
                          .text
                          .fontFamily('NoeDisplay')
                          .fontWeight(FontWeight.w500)
                          .size(32.w)
                          .color(Colors.white)
                          .make(),
                    ),
                    "Grow plants easily from your home with our award-winning pods"
                        .text
                        .fontFamily('ProximaNovaAlt')
                        .fontWeight(FontWeight.w400)
                        .color(Colors.white)
                        .make(),
                    const SizedBox(
                      height: 105.0,
                    ),
                    SizedBox(
                      width:
                          double.infinity, // Makes the button take full width
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, MyRoutes.registerRoute);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                          ), // Adjust the padding as needed
                        ),
                        child: "Register"
                            .text
                            .fontFamily('ProximaNovaAlt')
                            .color(MyTheme.green_20)
                            .fontWeight(FontWeight.w700)
                            .size(18)
                            .make(),
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, MyRoutes.loginRoute);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.transparent, // Transparent background
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                              // Border radius of 4
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 16), // Removes the shadow/elevation,
                            side: const BorderSide(
                              color: Colors.white,
                              width: 2,
                            )),
                        child: "Login"
                            .text
                            .fontFamily('ProximaNovaAlt')
                            .fontWeight(FontWeight.w700)
                            .color(Colors.white)
                            .size(18)
                            .make(),
                      ),
                    )
                  ],
                ),
              ],
            ).pSymmetric(v: 20.0, h: 20.0),
          ),
        ));
  }
}
