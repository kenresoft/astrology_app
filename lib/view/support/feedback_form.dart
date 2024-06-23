import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../notification/notification_screen.dart';
import '../widgets/profile_text_field.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  String dropdownValue = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Contact Support Form Starts Here
        const ProfileTextField(
          placeholder: 'Email',
          hint: 'Enter your Email Id',
        ),

        10.h.spY,

        const ProfileTextField(
          placeholder: 'Contact Number',
          hint: 'Enter your contact number',
        ),

        10.h.spY,

        const ProfileTextField(
          placeholder: 'I suggest you',
          hint: 'Enter your idea',
        ),

        15.h.spY,

        // Suggestion*/
        const ProfileTextField(
          placeholder: 'Suggestion Box',
          hint: 'How can we help you today?',
          isLarge: true,
        ),

        /// Contact Support Form Ends Here

        //Button
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const NotificationScreen(),
              ),
            );
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 25.h),
            child: Container(
              width: 170.w,
              height: 44.h,
              decoration: ShapeDecoration(
                color: const Color(0xFFF9B72B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              child: Center(
                child: Text(
                  'Send Message',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.h,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}