import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroFilledButton extends StatelessWidget {
  const IntroFilledButton({super.key, required this.text, required this.page, this.marginBottom});

  final String text;
  final Widget page;
  final double? marginBottom;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => page,
        ),
      ),
      child: Container(
        width: 362.w,
        height: 44.h,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 30.w).copyWith(
          top: 15.h,
          bottom: marginBottom ?? 28.h,
        ),
        decoration: ShapeDecoration(
          color: const Color(0xFFFFB900),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12).r,
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 6,
              offset: Offset(1, 2),
            )
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.h,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
