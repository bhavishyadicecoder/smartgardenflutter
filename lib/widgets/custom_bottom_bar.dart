import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_garden/utlis/theme.dart';
import 'package:velocity_x/velocity_x.dart'; // Make sure you import flutter_svg package

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            icon: SvgPicture.asset(
              'assets/icons/home_logo.svg',
              colorFilter: ColorFilter.mode(
                  selectedIndex == 0 ? MyTheme.green_20 : MyTheme.grey_50,
                  BlendMode.srcIn),
              // Handle color change
              width: 32.w, // Handle size change
            ),
            label: selectedIndex == 0 ? 'Home' : '',
            index: 0,
          ),
          _buildNavItem(
            icon: SvgPicture.asset(
              'assets/icons/menu_icon.svg',
              colorFilter: ColorFilter.mode(
                  selectedIndex == 1 ? MyTheme.green_20 : MyTheme.grey_50,
                  BlendMode.srcIn),
              width: 32.w,
            ),
            label: selectedIndex == 1 ? 'Dashboard' : '',
            index: 1,
          ),
          _buildNavItem(
            icon: SvgPicture.asset(
              'assets/icons/profile_icon.svg',
              colorFilter: ColorFilter.mode(
                  selectedIndex == 2 ? MyTheme.green_20 : MyTheme.grey_50,
                  BlendMode.srcIn),
              width: 32.w,
            ),
            label: selectedIndex == 2 ? 'Profile' : '',
            index: 2,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required Widget icon,
    required String label,
    required int index,
  }) {
    final bool isSelected = selectedIndex == index;

    return InkWell(
      onTap: () => onItemTapped(index),
      child: SafeArea(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon, // SVG Icon passed from the parent widget with proper size and color
            const SizedBox(width: 5), // Space between icon and label
            Text(
              label,
              style: TextStyle(
                  color: isSelected
                      ? MyTheme.green_20
                      : MyTheme.grey_50, // Highlight selected label
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                  fontFamily: MyTheme.proximaNovaAltfontFamily),
            ),
          ],
        ).pOnly(top: 14),
      ),
    );
  }
}
