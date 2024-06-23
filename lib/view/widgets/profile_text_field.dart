import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTextField extends StatelessWidget {
  const ProfileTextField({
    super.key,
    required this.placeholder,
    this.hint,
    this.suffixIcon,
    this.isLarge = false,
  });

  final String placeholder;
  final String? hint;
  final Widget? suffixIcon;
  final bool? isLarge;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          placeholder,
          style: TextStyle(
            color: const Color(0xFFA6A6A6),
            fontSize: 14.h,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 5.h),
        condition(
          !isLarge!,
          Container(
            height: 48.h,
            alignment: Alignment.center,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 1,
                  color: Color(0xFFD0D0D0),
                ),
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: TextStyle(
                        fontSize: 13.h,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFFA6A6A6),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                      suffixIcon: suffixIcon,
                      suffixIconColor: Colors.grey,
                    ),
                    readOnly: suffixIcon != null,
                    style: TextStyle(
                      fontSize: 16.h,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFA6A6A6),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 1.sw,
            height: 115.h,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1.w,
                  color: const Color(0xFFA6A6A6),
                ),
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 16.w), // Adjust padding as needed
              child: TextField(
                maxLines: null, // Allows for unlimited lines
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: const Color(0xFFA6A6A6),
                    fontSize: 12.h,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none, // No border for TextField
                  hintText: hint, // Placeholder text
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
