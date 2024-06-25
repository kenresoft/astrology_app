import 'package:astrology_app/utils/constants.dart';
import 'package:astrology_app/view/support/feedback_support.dart';
import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Settings extends StatefulWidget {
  const Settings({
    super.key,
  });

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late List<bool> _isExpandedList;

  @override
  void initState() {
    super.initState();
    _isExpandedList = List.generate(Constants.expandableItems.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20).r,
            topRight: const Radius.circular(20).r,
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 90.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...Constants.expandableItems
                .asMap()
                .entries
                .map((entry) {
              int index = entry.key;
              Map<String, String> item = entry.value;
              return Column(
                children: [
                  ExpansionTile(
                    shape: const ContinuousRectangleBorder(),
                    backgroundColor: Colors.white,
                    minTileHeight: 0,
                    onExpansionChanged: (value) {
                      setState(() => _isExpandedList[index] = value);
                    },
                    visualDensity: const VisualDensity(horizontal: -4),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 6).w,
                          child: Text(
                            item['title'] ?? '',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.h,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    trailing: GestureDetector(
                      onTap: () => _handleClick(index),
                      child: Icon(
                        size: 25.h,
                        _isExpandedList[index] ? CupertinoIcons.chevron_up : CupertinoIcons.chevron_down,
                      ),
                    ),
                    childrenPadding: const EdgeInsets.symmetric(horizontal: 0),
                    collapsedIconColor: const Color(0xffA6A6A6),
                    iconColor: const Color(0xffA6A6A6),
                    enabled: false,
                    tilePadding: EdgeInsets.symmetric(horizontal: 0, vertical: 2.h),
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.symmetric(horizontal: 20).w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Reminder:',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.5.h,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12.5.h,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: item['details'],
                                    style: TextStyle(
                                      color: const Color(0xFF4F4F4F),
                                      fontSize: 12.5.h,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                      height: 1.5.h,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              item['time']!,
                              style: TextStyle(
                                color: const Color(0xFF9C9C9C),
                                fontSize: 10.5.h,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                height: 1.5.h,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  1.h.spY,
                  Container(
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.6.h,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: const Color(0x7FD0D0D0),
                        ),
                      ),
                    ),
                  ),
                  5.h.spY,
                ],
              );
            }),

            // Button
            Center(
              child: Container(
                width: 117.w,
                height: 35.h,
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 20.h, bottom: 15.h),
                decoration: ShapeDecoration(
                  color: const Color(0xFFF8F8F8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 8,
                      offset: Offset(2, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Logout',
                      style: TextStyle(
                        color: const Color(0xFFE1353C),
                        fontSize: 15.h,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    5.w.spX,
                    SvgPicture.asset('assets/svg/power.svg')
                  ],
                ),
              ),
            ),

            // Text
            Center(
              child: Text(
                'Follow us on',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.h,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            // Social Follow
            Container(
              margin: EdgeInsets.only(top: 10.h, bottom: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/img/facebook.png',
                    width: 35.h,
                    height: 35.h,
                  ),
                  15.w.spX,
                  Image.asset(
                    'assets/img/instagram.png',
                    width: 39.5.h,
                    height: 39.5.h,
                  ),
                  15.w.spX,
                  Image.asset(
                    'assets/img/twitter.png',
                    width: 35.h,
                    height: 35.h,
                  ),
                  15.w.spX,
                  Image.asset(
                    'assets/img/pinterest.png',
                    width: 35.h,
                    height: 35.h,
                  ),
                ],
              ),
            ),

            // App Version
            Center(
              child: Text(
                'App version 7.0',
                style: TextStyle(
                  color: const Color(0xFFA6A6A6),
                  fontSize: 10.h,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),

            //
          ],
        ),
      ),
    );
  }

  _handleClick(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          if (index == 1) {
            return const FeedbackSupport();
          } else {
            return widget;
          }
        },
      ),
    );
  }
}
