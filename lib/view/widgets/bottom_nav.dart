import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  final Color color;
  final Color borderColor;
  final Color textColor;
  final String text;
  final Widget icon;

  const BottomNavItem({
    super.key,
    required this.color,
    required this.borderColor,
    required this.textColor,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 124,
      height: 45,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 6,
            offset: Offset(1, 1),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: CircleBorder(
                side: BorderSide(width: 1, color: borderColor),
              ),
            ),
            child: Center(child: icon),
          ),
          const SizedBox(width: 10),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}
