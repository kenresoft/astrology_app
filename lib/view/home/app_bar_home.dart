import 'package:astrology_app/utils/utils.dart';
import 'package:astrology_app/view/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        'home_semi_circle'.svg,
        Positioned(
          top: 43,
          left: 16.w,
          child: SizedBox(
            width: 1.sw,
            height: 89.h,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 23.h,
                  child: Text(
                    'Welcome to\nAstro',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.h,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Text(
                    'Hello User',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.h,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Positioned(
                  left: 285.w, // 335
                  top: 15.5.h,
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const Profile();
                        },
                      ),
                    ),
                    child: 'bell'.svg,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
