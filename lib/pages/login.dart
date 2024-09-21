import 'package:flutter/material.dart';
import 'package:smart_garden/utlis/routes.dart';
import 'package:smart_garden/utlis/theme.dart';
import 'package:smart_garden/widgets/authWidgets/auth_input.dart';
import 'package:smart_garden/widgets/authWidgets/social_app_button.dart';
import 'package:smart_garden/widgets/custom_button.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;
  String email = '';
  String password = '';

  void onPressedButton() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.themeGreenBgColor,
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [MyTheme.green_10, MyTheme.green_20],
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
            child: SingleChildScrollView(
              // Wrap Column with SingleChildScrollView
              physics:
                  const BouncingScrollPhysics(), // Optional: Smooth scrolling
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 100),
                    "Welcome back"
                        .text
                        .fontFamily("NoeDisplay")
                        .fontWeight(FontWeight.w500)
                        .color(Colors.white)
                        .size(32)
                        .make(),
                    const SizedBox(height: 10),
                    "Let’s get back to growing your Aepod plants, shall we?"
                        .text
                        .fontFamily('ProximaNovaAlt')
                        .fontWeight(FontWeight.w400)
                        .size(18)
                        .color(Colors.white)
                        .make(),
                    const SizedBox(height: 30),
                    AuthInput(
                      hintText: "Email Address",
                      prefixIcon: SvgPicture.asset('assets/icons/mail_icon.svg',
                          semanticsLabel: 'Email Logo'),
                      controller: emailController,
                      onChanged: (value) => {email = value, setState(() {})},
                    ),
                    const SizedBox(height: 25),

                    AuthInput(
                      hintText: "Password",
                      onChanged: (value) => {password = value, setState(() {})},
                      prefixIcon: SvgPicture.asset('assets/icons/lock_icon.svg',
                          semanticsLabel: 'Visiblity Logo'),
                      suffixIcon: InkWell(
                        onTap: () {
                          isPasswordVisible = !isPasswordVisible;
                          setState(() {});
                        },
                        child: SvgPicture.asset(
                          height: 24,
                          width: 24,
                          colorFilter: const ColorFilter.mode(
                              Colors.white, BlendMode.srcIn),
                          isPasswordVisible
                              ? 'assets/icons/eye-show.svg'
                              : 'assets/icons/eye_password_icon.svg',
                          semanticsLabel: 'Eye Icon',
                        ),
                      ),
                      controller: passwordController,
                      isObscure: !isPasswordVisible,
                    ),
                    const SizedBox(height: 12),
                    "Forgot your password?"
                        .text
                        .fontFamily("ProximaNovaAlt")
                        .fontWeight(FontWeight.w700)
                        .color(Colors.white)
                        .size(18)
                        .make(),
                    const SizedBox(height: 36),
                    "Or Login using social media"
                        .text
                        .fontFamily("ProximaNovaAlt")
                        .fontWeight(FontWeight.w400)
                        .size(18)
                        .color(Colors.white)
                        .make(),
                    const SizedBox(height: 22),
                    const SocialAppButton(),
                    const SizedBox(
                        height: 96), // Add some space before the button
                    CustomButton(
                      onPressedButton: onPressedButton,
                      text: "Login",
                      textStyle: TextStyle(
                        fontFamily: "ProximaNovaAlt",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: MyTheme.green_20,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Align(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) =>
                              //           Register()), // Navigate to the RegisterPage
                              // );
                              Navigator.pushNamed(
                                  context, MyRoutes.registerRoute);
                            },
                            child: const Text(
                              "New here? Register",
                              style: TextStyle(
                                fontFamily: "ProximaNovaAlt",
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ) // .make() converts the text to a widget
                            ),
                      ),
                    ).pOnly(bottom: 15),
                    // const SizedBox(height: 25), // Add some bottom padding
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
