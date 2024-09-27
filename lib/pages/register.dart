import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_garden/utlis/routes.dart';
import 'package:smart_garden/utlis/theme.dart';
import 'package:smart_garden/widgets/authWidgets/auth_input.dart';
import 'package:smart_garden/widgets/authWidgets/social_app_button.dart';
import 'package:smart_garden/widgets/custom_button.dart';
import 'package:velocity_x/velocity_x.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String email = '';
  String password = '';
  bool isPasswordVisible = false;

  void onPressedButton() =>
      {Navigator.pushNamed(context, MyRoutes.personalExperience)};

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
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 100),
                    "Register on Aepod"
                        .text
                        .fontFamily('NoeDisplay')
                        .fontWeight(FontWeight.w500)
                        .size(32.sp)
                        .color(Colors.white)
                        .make(),
                    const SizedBox(height: 10),
                    "Create an Aepod account, We can’t wait to have you."
                        .text
                        .fontFamily('ProximaNovaAlt')
                        .fontWeight(FontWeight.w400)
                        .size(18.sp)
                        .color(Colors.white)
                        .make(),
                    const SizedBox(height: 30),
                    AuthInput(
                      hintText: "Email Address",
                      prefixIcon: SvgPicture.asset(
                        'assets/icons/mail_icon.svg',
                        semanticsLabel: 'Email logo',
                      ),
                      controller: emailController,
                      onChanged: (value) => {email = value, setState(() {})},
                    ),
                    const SizedBox(height: 25),
                    AuthInput(
                      hintText: "Password",
                      onChanged: (value) => {
                        password = value,
                        setState(() {}),
                      },
                      isObscure: !isPasswordVisible,
                      controller: passwordController,
                      prefixIcon: SvgPicture.asset(
                        "assets/icons/lock_icon.svg",
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          isPasswordVisible = !isPasswordVisible;
                          setState(() {});
                        },
                        child: SvgPicture.asset(
                          height: 24.w,
                          width: 24.w,
                          colorFilter: const ColorFilter.mode(
                              Colors.white, BlendMode.srcIn),
                          isPasswordVisible
                              ? 'assets/icons/eye-show.svg'
                              : 'assets/icons/eye_password_icon.svg',
                        ),
                      ),
                    ),
                    const SizedBox(height: 36),
                    "Or Login using social media"
                        .text
                        .fontFamily("ProximaNovaAlt")
                        .fontWeight(FontWeight.w400)
                        .size(18.sp)
                        .color(Colors.white)
                        .make(),
                    const SizedBox(height: 22),
                    const SocialAppButton(),
                    const SizedBox(height: 116),
                    CustomButton(
                      onPressedButton: onPressedButton,
                      text: "Register",
                      textStyle: TextStyle(
                        fontFamily: "ProximaNovaAlt",
                        fontSize: 18.sp,
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
                            Navigator.pushNamed(context, MyRoutes.loginRoute);
                          },
                          child: Text(
                            "Already have an account? Login",
                            style: TextStyle(
                              fontFamily: "ProximaNovaAlt",
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                      ),
                    ).pOnly(bottom: 15),
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
