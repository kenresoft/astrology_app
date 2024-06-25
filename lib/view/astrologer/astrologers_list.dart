import 'package:astrology_app/utils/utils.dart';
import 'package:astrology_app/view/widgets/toolbar.dart';
import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AstrologersListPage extends StatelessWidget {
  const AstrologersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(88.h),
          child: Toolbar(
            title: 'Astrologers list',
            action: 'filter'.svg,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FilterChipsSection(),
              Container(
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.5,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFD0D0D0),
                    ),
                  ),
                ),
              ),

              // 1
              AstrologerCard(
                name: 'Lorem ipsum',
                imageUrl: 'astro_1'.png,
                services: 'Vasthu consultation, Vedic Astrology',
                languages: 'English, Hindi',
                experience: '8 Years',
                price: '₹30/min',
                status: 'Online',
                rating: 5,
              ),

              // Divider
              const Line(),

              // 2
              AstrologerCard(
                name: 'Lorem',
                imageUrl: 'astro_2'.png,
                services: 'Vedic Astrology, Life Astrology',
                languages: 'Kannada, English',
                experience: '10 Years',
                price: '₹115/min',
                status: 'Online',
                rating: 5,
              ),

              // Divider
              const Line(),

              // 3
              AstrologerCard(
                name: 'Lorem ipsum dolor sit',
                imageUrl: 'astro_3'.png,
                services: 'Life Astrology, Planetary Aspects',
                languages: 'English, Hindi',
                experience: '13 Years',
                price: '₹75/min',
                status: 'Online',
                rating: 5,
              ),

              // Divider
              const Line(),

              // 4
              AstrologerCard(
                name: 'Lorem ipsum dolor',
                imageUrl: 'astro_4'.png,
                // Replace with your image
                services: 'Vedic Astrology, Numerology',
                languages: 'English, Hindi',
                experience: '20 Years',
                price: '₹75/min',
                status: 'Offline',
                rating: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Line extends StatelessWidget {
  const Line({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 428.01,
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.5,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Color(0xFFCCCCCC),
          ),
        ),
      ),
    );
  }
}

class FilterChipsSection extends StatelessWidget {
  const FilterChipsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(11).r,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const FilterChipWidget(label: 'Career'),
            11.w.spX,
            const FilterChipWidget(label: 'English'),
            11.w.spX,
            const FilterChipWidget(label: 'Online'),
            11.w.spX,
            const FilterChipWidget(label: 'Highest to Lowest'),
          ],
        ),
      ),
    );
  }
}

class FilterChipWidget extends StatelessWidget {
  final String label;

  const FilterChipWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        height: 25.h,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14).r,
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 6,
              offset: Offset(1, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 13.5.h,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class AstrologerCard extends StatelessWidget {
  final String name;
  final Image imageUrl;
  final String services;
  final String languages;
  final String experience;
  final String price;
  final String status;
  final int rating;

  const AstrologerCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.services,
    required this.languages,
    required this.experience,
    required this.price,
    required this.status,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 218.h,
      color: const Color(0xFFF8F8F8),
      margin: EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.h),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image & Details
            SizedBox(
              //height: 125.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Image
                  SizedBox(
                    height: 148.h,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 125.h,
                          width: 100.w,
                          child: Card(
                            margin: EdgeInsets.zero,
                            color: Colors.transparent,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7).r,
                            ),
                            child: DecoratedBox(
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: imageUrl.image,
                                  fit: BoxFit.cover,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7).r,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: 45.w,
                            height: 21.h,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20).r,
                              ),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x26000000),
                                  blurRadius: 8,
                                  offset: Offset(1, 1),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 16.h,
                                  height: 13.h,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20).r,
                                    ),
                                  ),
                                  child: 'star_icon'.svg,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  '5',
                                  style: TextStyle(
                                    color: const Color(0xFF282828),
                                    fontSize: 12.h,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  10.w.spX,

                  /// Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Row 1 -> Name
                        Container(
                          padding: EdgeInsets.only(top: 11.h, left: 5.w),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  name,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.h,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              'verified'.svg
                            ],
                          ),
                        ),

                        9.h.spY,

                        // Row 2 -> Services
                        Row(
                          children: [
                            SizedBox(
                              width: 20.h,
                              height: 20.h,
                              child: 'reading'.svg,
                            ),
                            10.w.spX,
                            SizedBox(
                              width: 138.5.w,
                              height: 34.h,
                              child: Stack(
                                children: [
                                  Text(
                                    services,
                                    style: TextStyle(
                                      color: const Color(0xFF606060),
                                      fontSize: 12.h,
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Positioned(
                                    bottom: -2.h,
                                    right: 0,
                                    child: Text(
                                      '+7 more',
                                      style: TextStyle(
                                        color: const Color(0xFF00A9C0),
                                        fontSize: 11.h,
                                        fontFamily: 'OpenSans',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        7.h.spY,

                        // Row 3 -> Languages
                        Row(
                          children: [
                            SizedBox(
                              width: 20.h,
                              height: 16.80.h,
                              child: 'language'.svg,
                            ),
                            10.w.spX,
                            Expanded(
                              child: SizedBox(
                                width: 147.h,
                                height: 17.h,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      languages,
                                      style: TextStyle(
                                        color: const Color(0xFF606060),
                                        fontSize: 12.h,
                                        fontFamily: 'OpenSans',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    3.w.spX,
                                    Text(
                                      '+2 more',
                                      style: TextStyle(
                                        color: const Color(0xFF00A9C0),
                                        fontSize: 11.h,
                                        fontFamily: 'OpenSans',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        7.h.spY,

                        // Row 4 ->
                        Row(
                          children: [
                            SizedBox(
                              width: 20.h,
                              height: 20.h,
                              child: 'experience'.svg,
                            ),
                            10.w.spX,
                            Expanded(
                              child: SizedBox(
                                width: 147,
                                height: 17.h,
                                child: Text(
                                  experience,
                                  style: TextStyle(
                                    color: const Color(0xFF606060),
                                    fontSize: 12.h,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        7.h.spY,

                        // Row 4 ->
                        Row(
                          children: [
                            SizedBox(
                              width: 20.h,
                              height: 16.80.h,
                              child: 'price'.svg,
                            ),
                            10.w.spX,
                            Text(
                              price,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.h,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            25.w.spX,
                            Text(
                              status,
                              style: TextStyle(
                                color: condition(
                                  status == 'Online',
                                  const Color(0xFF509D4D),
                                  const Color(0xFF606060),
                                ),
                                fontSize: 14.h,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            15.h.spY,

            /// 3 Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 95.w,
                  height: 38.h,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 8,
                        offset: Offset(1, 1),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      'chat_2'.svg,
                      5.w.spX,
                      Text(
                        'Chat',
                        style: TextStyle(
                          color: const Color(0xFF509D4D),
                          fontSize: 14.h,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 85.w,
                  height: 38.h,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 8,
                        offset: Offset(1, 1),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      'call_2'.svg,
                      5.w.spX,
                      Text(
                        'Call',
                        style: TextStyle(
                          color: const Color(0xFF509D4D),
                          fontSize: 14.h,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 113.w,
                  height: 38.h,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30).r,
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 8,
                        offset: Offset(1, 1),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      'video_2'.svg,
                      5.w.spX,
                      Text(
                        'Video Call',
                        style: TextStyle(
                          color: const Color(0xFF509D4D),
                          fontSize: 14.h,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
