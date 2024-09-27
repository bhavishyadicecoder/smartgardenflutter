import 'package:flutter/material.dart';
import 'package:smart_garden/pages/garden_details.dart';
import 'package:smart_garden/pages/login.dart';
import 'package:smart_garden/pages/personalize_experience.dart';
import 'package:smart_garden/pages/register.dart';
import 'package:smart_garden/pages/root_page.dart';
import 'package:smart_garden/pages/welcome.dart';
import 'package:smart_garden/utlis/routes.dart';
import 'package:smart_garden/utlis/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil to manage responsiveness globally
    return ScreenUtilInit(
      designSize: const Size(360, 690), // Set the design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          initialRoute: MyRoutes.rootPage,
          debugShowCheckedModeBanner: false,
          theme: MyTheme.lightTheme(context),
          routes: {
            MyRoutes.loginRoute: (context) => const Login(),
            MyRoutes.registerRoute: (context) => const Register(),
            MyRoutes.welcomeRoute: (context) => const Welcome(),
            MyRoutes.personalExperience: (context) =>
                const PersonalizeExperience(),
            MyRoutes.rootPage: (context) => const RootPage(),
            MyRoutes.gardenDetailRoute: (context) => const GardenDetails(),
          },
        );
      },
    );
  }
}
