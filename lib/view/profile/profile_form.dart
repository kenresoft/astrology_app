import 'package:astrology_app/view/support/feedback_support.dart';
import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/gender_selector.dart';
import '../widgets/profile_text_field.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({
    super.key,
  });

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
            const ProfileTextField(placeholder: 'Name'),
            10.h.spY,
            const ProfileTextField(placeholder: 'Phone Number'),
            10.h.spY,
            const ProfileTextField(placeholder: 'Email ID'),
            10.h.spY,
            const ProfileTextField(placeholder: 'Date of Birth'),
            8.h.spY,
            RadioSelector(
              label: 'Gender:',
              option1: 'Male',
              option2: 'Female',
              onChanged: (String? value) {},
            ),
            const ProfileTextField(placeholder: 'Location', hint: 'City, State, Country'),
            10.h.spY,
            const ProfileTextField(placeholder: 'Zipcode'),
            38.h.spY,
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FeedbackSupport(),
                ),
              ),
              child: Center(
                child: Container(
                  width: 130.w,
                  height: 40.h,
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF9B72B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.h,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
