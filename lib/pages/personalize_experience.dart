import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_garden/utlis/routes.dart';
import 'package:smart_garden/utlis/theme.dart';
import 'package:smart_garden/widgets/authWidgets/auth_input.dart';
import 'package:smart_garden/widgets/custom_button.dart';
import 'package:velocity_x/velocity_x.dart';

class PersonalizeExperience extends StatefulWidget {
  const PersonalizeExperience({Key? key}) : super(key: key);

  @override
  State<PersonalizeExperience> createState() => _PersonalizeExperienceState();
}

class _PersonalizeExperienceState extends State<PersonalizeExperience> {
  final TextEditingController emailController = TextEditingController();
  String name = '';

  Future<void> navigateToHome() async {
    // Perform login logic

    Navigator.pushReplacementNamed(context, MyRoutes.rootPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.themeGreenBgColor,
      extendBodyBehindAppBar: true,
      body: Container(
        child: SizedBox(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                "Let’s personalize your experience"
                    .text
                    .fontFamily('NoeDisplay')
                    .fontWeight(FontWeight.w500)
                    .size(32)
                    .color(Colors.white)
                    .make(),
                const SizedBox(height: 10),
                "What can we call you? Could be your name, a nickname or something funny ☺."
                    .text
                    .fontFamily('ProximaNovaAlt')
                    .fontWeight(FontWeight.w400)
                    .size(18)
                    .color(Colors.white)
                    .make(),
                const SizedBox(height: 30),
                AuthInput(
                  hintText: "Name",
                  prefixIcon: SvgPicture.asset(
                    'assets/icons/user_icon.svg',
                    semanticsLabel: 'Email logo',
                  ),
                  controller: emailController,
                  onChanged: (value) => {name = value, setState(() {})},
                ),
                Spacer(),
                CustomButton(
                  onPressedButton: () {
                    // Navigator.pushNamed(context, MyRoutes.rootPage);
                    navigateToHome();

                    // Navigator.pushReplacementNamed(context, MyRoutes.rootPage);
                  },
                  text: "Continue",
                  textStyle: TextStyle(
                    fontFamily: "ProximaNovaAlt",
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: MyTheme.green_20,
                  ),
                ).pOnly(bottom: 25),
              ],
            ).pSymmetric(h: 20),
          ),
        ),
      ),
    );
  }
}
