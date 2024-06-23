import 'package:astrology_app/view/notification/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeToolbar extends StatelessWidget {
  const HomeToolbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      height: 290.h,
      child: Container(
        width: 1.sw,
        color: const Color(0xffE1353C),
        child: Stack(
          children: [
            SvgPicture.asset('assets/svg/quadrant.svg'),
            Positioned(
              top: 172,
              right: 0,
              child: SvgPicture.asset('assets/svg/yellow_semicircle.svg'),
            ),
            Positioned(
              top: 70.h,
              left: 17.w,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset('assets/svg/back.svg'),
              ),
            ),
            Positioned(
              top: 50.h,
              left: 67.w,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'My',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23.h,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: ' \n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.h,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: 'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23.h,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 50.h,
              right: 17.w,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const NotificationScreen();
                      },
                    ),
                  );
                },
                child: SvgPicture.asset('assets/svg/bell.svg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
