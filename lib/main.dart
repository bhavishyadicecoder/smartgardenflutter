import 'package:flutter/material.dart';
import 'package:smart_garden/pages/login.dart';
import 'package:smart_garden/pages/personalize_experience.dart';
import 'package:smart_garden/pages/register.dart';
import 'package:smart_garden/pages/welcome.dart';
import 'package:smart_garden/utlis/routes.dart';
import 'package:smart_garden/utlis/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MyRoutes.welcomeRoute,
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(context),
      routes: {
        MyRoutes.loginRoute: (context) => const Login(),
        MyRoutes.registerRoute: (context) => const Register(),
        MyRoutes.welcomeRoute: (context) => const Welcome(),
        MyRoutes.personalExperience: (context) => const PersonalizeExperience(),
      },
    );
  }
}
