import 'package:astrology_app/utils/utils.dart';
import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class Toolbar extends StatelessWidget {
  const Toolbar({
    super.key,
    this.title,
    this.action,
  });

  final String? title;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 88.h,
      decoration: const BoxDecoration(
        color: Color(0xFFE1353C),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            child: SvgPicture.asset(
              'assets/svg/quadrant.svg',
              height: 88.h,
            ),
          ),
          Positioned(
            bottom: 31.h,
            right: 0,
            child: SvgPicture.asset(
              'assets/svg/yellow_semicircle.svg',
              height: 87.h,
            ),
          ),
          Positioned(
            top: 50.h,
            left: 17.w,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: 'back'.svg,
            ),
          ),
          Positioned(
            top: 50.h,
            left: 67.w,
            child: Text(
              title ?? '',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.h,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            right: 20.w,
            bottom: 14.h,
            child: condition(
              action == null,
              const SizedBox(),
              Container(
                width: 34.h,
                height: 34.h,
                padding: const EdgeInsets.all(6).r,
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: OvalBorder(),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 6,
                      offset: Offset(1, 1),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: action,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
