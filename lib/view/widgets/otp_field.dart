import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OTPField extends StatelessWidget {
  const OTPField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
        (index) => Container(
          width: 36.w,
          height: 44.h,
          margin: EdgeInsets.symmetric(horizontal: 9.w),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              border: InputBorder.none,
              counterText: '', // hide the character counter
            ),
            keyboardType: TextInputType.number,
            maxLength: 1,
            onChanged: (value) {
              // Handle OTP value change
              if (value.length == 1) {
                // Move focus to the next OTP field, if available
                FocusScope.of(context).nextFocus();
              }
            },
          ),
        ),
      ),
    );
  }
}
