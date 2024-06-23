import 'package:astrology_app/utils/extensions.dart';
import 'package:astrology_app/utils/utils.dart';
import 'package:astrology_app/view/profile/profile_form.dart';
import 'package:astrology_app/view/profile/profile_image.dart';
import 'package:astrology_app/view/profile/settings.dart';
import 'package:astrology_app/view/widgets/home_toolbar.dart';
import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isFirstFormSelected = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: isFirstFormSelected ? 998.h : 830.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      /// First Layer -> Profile AppBar
                      const HomeToolbar(),

                      /// Second Layer -> Profile Form
                      Positioned(
                        top: 270.h,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          transitionBuilder: (Widget child, Animation<double> animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: SizeTransition(
                                sizeFactor: animation,
                                child: child,
                              ),
                            );
                          },
                          child: condition(
                            isFirstFormSelected,
                            const ProfileForm(),
                            const Settings(),
                          ),
                        ),
                      ),

                      /// Third Layer -> Profile Header
                      Positioned(
                        top: 183.h,
                        width: 1.sw,
                        child: Stack(
                          children: [
                            Container(
                              height: 150.h,
                              margin: const EdgeInsets.symmetric(horizontal: 20).w,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10).r,
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 15,
                                    offset: Offset(1, 2),
                                    spreadRadius: 2,
                                  )
                                ],
                              ),
                              child: Container(
                                padding: EdgeInsets.only(top: 40.h, bottom: 3.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    // First Header
                                    Text(
                                      'Profile',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.h,
                                        fontFamily: 'OpenSans',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                      ),
                                    ),

                                    // Second Header
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset('assets/svg/mobile_icon.svg'),
                                        8.w.spX,
                                        Text(
                                          '9876543210',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.h,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ],
                                    ),

                                    // Third Header Row
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 45.w),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isFirstFormSelected = true;
                                              });
                                            },
                                            child: Text(
                                              'Personal Info',
                                              style: TextStyle(
                                                color: isFirstFormSelected ? Colors.black : const Color(0xFF828282),
                                                fontSize: 14.h,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isFirstFormSelected = false;
                                              });
                                            },
                                            child: Text(
                                              'Settings',
                                              style: TextStyle(
                                                color: isFirstFormSelected ? const Color(0xFF828282) : Colors.black,
                                                fontSize: 14.h,
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Header Bottom Shape
                            Positioned(
                              bottom: 0,
                              left: 20.w,
                              child: 'profile_header_shape'.svg,
                            ),
                          ],
                        ),
                      ),

                      /// Fourth Layer -> Profile Image
                      const ProfileImage(),

                      // End
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
