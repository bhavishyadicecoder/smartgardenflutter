import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_garden/utlis/theme.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowMultiCard extends StatelessWidget {
  final List<Map<String, dynamic>> rowContainerList;
  const RowMultiCard({
    Key? key,
    required this.rowContainerList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: rowContainerList.map((item) {
        return Container(
          width: 210.w,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item['label'],
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: MyTheme.proximaNovaAltfontFamily,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    item['firstIcon'], // Loading the SVG icon
                    height: 24.w,
                    width: 24.w,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    item['gramName'],
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: MyTheme.proximaNovaAltfontFamily,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    item['secondIcon'], // Loading the SVG icon
                    height: 24.w,
                    width: 24.w,
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Text(
                    item['refillName'],
                    style: TextStyle(
                      fontSize: 16.w,
                      fontFamily: MyTheme.proximaNovaAltfontFamily,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ).pOnly(
            left: 4.w,
            top: 13.w,
            bottom: 13.w,
            // right: 8.w,
          ),
        );
      }).toList(),
    );
  }
}
