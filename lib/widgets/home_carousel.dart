import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_garden/utlis/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeCarousel extends StatefulWidget {
  final List<String> imagesList;
  const HomeCarousel({
    super.key,
    required this.imagesList,
  });

  @override
  _HomeCarouselState createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  late PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.92);
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 190.w, // Set the fixed height for the carousel
          child: PageView.builder(
            itemCount: widget.imagesList.length,
            controller: _pageController,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.w),
                  child: Stack(
                    children: [
                      Image.asset(
                        widget.imagesList[index],
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: 190.w, // Set same height for each image
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10.w),
        DotsIndicator(
          dotsCount: widget.imagesList.length,
          position: currentPage,
        ),
      ],
    );
  }
}

class DotsIndicator extends StatelessWidget {
  final int dotsCount;
  final int position;

  const DotsIndicator(
      {super.key, required this.dotsCount, required this.position});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(dotsCount, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          width: 16.0.w,
          height: 6.0.w,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: index == position
                  ? MyTheme.green_20
                  : MyTheme.green_20.withOpacity(0.2),
              borderRadius: BorderRadius.all(Radius.circular(4.w))),
        );
      }),
    ).pOnly(top: 45.w);
  }
}
