import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

class SocialAppButton extends StatelessWidget {
  final VoidCallback? onPressedFacebook;
  final VoidCallback? onPressedGoogle;

  const SocialAppButton({
    super.key,
    this.onPressedFacebook,
    this.onPressedGoogle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OutlinedButton.icon(
          onPressed: onPressedFacebook,
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            side: const BorderSide(
              color: Colors.white,
              width: 2,
            ),
            padding: EdgeInsets.symmetric(vertical: 14.w, horizontal: 24.w),
          ),
          icon: SvgPicture.asset(
              height: 24,
              width: 24,
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              'assets/icons/facebook_icon.svg'), // Prefix icon
          label: "Facebook"
              .text
              .fontFamily('ProximaNovaAlt')
              .fontWeight(FontWeight.w700)
              .color(Colors.white)
              .size(18.sp)
              .make(), // Button label
        ),
        OutlinedButton.icon(
          onPressed: onPressedFacebook,
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            side: const BorderSide(
              color: Colors.white,
              width: 2,
            ),
            padding: EdgeInsets.symmetric(vertical: 14.w, horizontal: 24.w),
          ),
          icon: SvgPicture.asset(
              height: 24.h,
              width: 24.w,
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              'assets/icons/google_icon.svg'), // Prefix icon
          label: "Google"
              .text
              .fontFamily('ProximaNovaAlt')
              .fontWeight(FontWeight.w700)
              .color(Colors.white)
              .size(18.sp)
              .make(), // Button label
        )
      ],
    );
  }
}
