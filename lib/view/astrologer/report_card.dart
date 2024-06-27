import 'package:astrology_app/utils/utils.dart';
import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportSection extends StatelessWidget {
  const ReportSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      margin: const EdgeInsets.symmetric(vertical: 15).h,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10).r,
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 6,
            offset: Offset(1, 1),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 5.h, bottom: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 34,
                        height: 34,
                        padding: EdgeInsets.all(4.h),
                        decoration: const ShapeDecoration(
                          color: Color(0x99CCBCE7),
                          shape: OvalBorder(),
                        ),
                        child: 'report_icon'.svg,
                      ),
                      8.5.w.spX,
                      Text(
                        'Report',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.h,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),

                  /// Range
                  Row(
                    children: [
                      Text(
                        '₹2923',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.h,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        ' - ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.h,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '₹5547',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.h,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            5.h.spY,
            Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 0.5.h,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: const Color(0xFF845EC2),
                  ),
                ),
              ),
            ),
            8.h.spY,
            const ReportList(),
            9.h.spY,

            // Button
            Center(
              child: Container(
                width: 72.w,
                height: 26.h,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  color: const Color(0xFF845EC2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                ),
                child: Text(
                  'View all',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.h,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
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

class ReportList extends StatelessWidget {
  const ReportList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ReportItem(
          title: '1 Year Education Report',
          price: '₹3566',
        ),
        ReportItem(
          title: 'Saturn Transit Report',
          price: '₹3566',
        ),
        ReportItem(
          title: '1 Year Professional (career) Report',
          price: '₹5547',
        ),
      ],
    );
  }
}

class ReportItem extends StatelessWidget {
  final String title;
  final String price;

  const ReportItem({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0),
      minTileHeight: 8.5.h,
      minVerticalPadding: 8.h,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 12.h,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Container(
        width: 85.w,
        height: 23.5.h,
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFDE1F27)),
            borderRadius: BorderRadius.circular(7),
          ),
        ),
        child: Text(
          '₹3566',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.h,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
