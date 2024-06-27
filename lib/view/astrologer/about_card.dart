import 'package:astrology_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFFFF1CC),
      margin: EdgeInsets.symmetric(vertical: 12.h),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8).r,
        side: const BorderSide(color: Color(0xFFFFD565), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5).copyWith(
          top: 10.h,
          bottom: 9.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'About me',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.h,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
              ),
            ),
            //const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
              ).copyWith(
                top: 10.h,
                bottom: 10.h,
              ),
              child: Text(
                Constants.lorem,
                style: TextStyle(
                  fontSize: 12.h,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ),
            Text(
              'See more',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.h,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
