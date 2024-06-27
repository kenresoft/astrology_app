import 'package:astrology_app/utils/utils.dart';
import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.h,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12).r,
            child: Row(
              children: [
                Container(
                  width: 110.w,
                  height: 140.h,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: 'astrologer_k'.png.image,
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 10,
                        offset: Offset(0, 0.5),
                        //spreadRadius: 0,
                      )
                    ],
                  ),
                ),
                SizedBox(width: 18.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Astro Astrologer K',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.h,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    5.h.spY,
                    Text(
                      'Numerology, Planetory Transit',
                      style: TextStyle(
                        color: const Color(0xFF7F7F7F),
                        fontSize: 12.h,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    5.h.spY,
                    Text(
                      'English, Hindi',
                      style: TextStyle(
                        color: const Color(0xFF7F7F7F),
                        fontSize: 12.h,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    5.h.spY,
                    Text(
                      '8 yrs',
                      style: TextStyle(
                        color: const Color(0xFF7F7F7F),
                        fontSize: 12.h,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    5.h.spY,
                    Row(
                      children: [
                        Text(
                          '₹30/min',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.h,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        30.w.spX,
                        Container(
                          width: 65.w,
                          height: 26.h,
                          alignment: Alignment.center,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFC4F8C2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25).r,
                            ),
                          ),
                          child: Text(
                            'Online',
                            style: TextStyle(
                              color: const Color(0xFF157B11),
                              fontSize: 14.h,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          8.5.h.spY,

          // Horizontal line
          Container(
            width: 1.sw,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 0.5.h,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: const Color(0xFFD0D0D0),
                ),
              ),
            ),
          ),

          // Footer
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /// Chat
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    'message'.svg,
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '60k',
                            style: TextStyle(
                              color: Color(0xFFC6C6C6),
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: ' mins',
                            style: TextStyle(
                              color: Color(0xFFC6C6C6),
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                /// Line
                Container(
                  height: 50,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFD0D0D0),
                      ),
                    ),
                  ),
                ),

                /// Call
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    'fluent_call'.svg,
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '60k',
                            style: TextStyle(
                              color: Color(0xFFC6C6C6),
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: ' mins',
                            style: TextStyle(
                              color: Color(0xFFC6C6C6),
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 151,
                  height: 45,
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFEF390),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1, color: Color(0xFFFFB700)),
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      'video'.svg,
                      const Text(
                        'Watch Intro',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
