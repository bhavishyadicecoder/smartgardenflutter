import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_garden/utlis/theme.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowCard extends StatelessWidget {
  final List<Map<String, dynamic>> rowContainerList;
  const RowCard({
    Key? key,
    required this.rowContainerList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: rowContainerList.map((item) {
        return Container(
          width: 100.w,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                item['icon'], // Loading the SVG icon
                height: 24.w,
                width: 24.w,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                item['name'],
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: MyTheme.proximaNovaAltfontFamily,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                item['val'],
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: MyTheme.proximaNovaAltfontFamily,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ).pOnly(left: 10.w, top: 13.w, bottom: 13.w, right: 8.w),
        );
      }).toList(),
    );
  }
}
