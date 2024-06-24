import 'package:astrology_app/utils/constants.dart';
import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/toolbar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late List<bool> _isExpandedList;

  @override
  void initState() {
    super.initState();
    _isExpandedList = List.generate(Constants.notificationItems.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(88.h),
          child: const Toolbar(title: 'Notifications',),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...Constants.notificationItems.asMap().entries.map((entry) {
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
                            leading: condition(
                              item['title'] == 'Jobs',
                              Image.asset(
                                item['icon']!,
                                width: 38.15.h,
                                height: 38.15.h,
                              ),
                              SvgPicture.asset(
                                item['icon']!,
                              ),
                            ),
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
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ),
                                ...[
                                  condition(
                                    item['counter']!.isNotEmpty,
                                    Container(
                                      alignment: Alignment.center,
                                      width: 18.h,
                                      height: 20.h,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFE1353C),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Text(
                                        item['counter']!,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13.h,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 18.h,
                                      height: 20.h,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                            trailing: Icon(
                              size: 25.h,
                              _isExpandedList[index] ? CupertinoIcons.chevron_up : CupertinoIcons.chevron_down,
                            ),
                            childrenPadding: const EdgeInsets.symmetric(horizontal: 0),
                            collapsedIconColor: const Color(0xffA6A6A6),
                            iconColor: const Color(0xffA6A6A6),
                            tilePadding: EdgeInsets.symmetric(horizontal: 0, vertical: 8.h),
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 38, right: 20).w,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 4.8.h,
                                      height: 4.8.h,
                                      margin: EdgeInsets.only(top: 8.h),
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFFFF778D),
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                    5.w.spX,
                                    SizedBox(
                                      width: 240.w,
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
                                                    fontWeight: FontWeight.w600,
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
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          5.h.spY,
                          Container(
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1.h,
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
