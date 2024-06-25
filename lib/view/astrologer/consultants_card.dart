import 'package:astrology_app/view/astrologer/astrologers_list.dart';
import 'package:astrology_app/utils/utils.dart';
import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConsultantCard extends StatelessWidget {
  final String name;
  final String price;
  final Image imageUrl;

  const ConsultantCard({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 95.w,
          height: 115.h,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: imageUrl.image,
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        5.h.spY,
        Text(
          name,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.h,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
        ),
        6.h.spY,
        Text(
          price,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.h,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class SimilarConsultants extends StatelessWidget {
  const SimilarConsultants({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210.h,
      decoration: ShapeDecoration(
        color: const Color(0xFFFFF2F0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7).r,
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
      child: Padding(
        padding: EdgeInsets.all(6.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 26.h,
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Check Similar Consultants',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.h,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const AstrologersListPage();
                        },
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 25.h,
                        height: 25.h,
                        padding: const EdgeInsets.all(5).r,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFF6BBBB),
                          shape: OvalBorder(),
                        ),
                        child: 'i'.svg,
                      ),
                    ),
                  )
                ],
              ),
            ),
            4.h.spY,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ConsultantCard(
                    name: 'Acharya',
                    price: '₹40/min',
                    imageUrl: 'acharya'.png, // Replace with your image
                  ),
                  ConsultantCard(
                    name: 'Dharmik',
                    price: '₹50/min',
                    imageUrl: 'dharmik'.png, // Replace with your image
                  ),
                  ConsultantCard(
                    name: 'Sujoy sen',
                    price: '₹90/min',
                    imageUrl: 'sujoy'.png, // Replace with your image
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
