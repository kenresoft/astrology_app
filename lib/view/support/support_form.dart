import 'package:astrology_app/view/notification/notification_screen.dart';
import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/profile_text_field.dart';

class ContactSupportForm extends StatefulWidget {
  const ContactSupportForm({super.key});

  @override
  State<ContactSupportForm> createState() => _ContactSupportFormState();
}

class _ContactSupportFormState extends State<ContactSupportForm> {
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
          placeholder: 'Subject',
          hint: 'Message subject',
        ),

        10.h.spY,

        ProfileTextField(
          placeholder: 'Issue Type',
          suffixIcon: Container(
            margin: EdgeInsets.only(left: 5.w, right: 15.w),
            alignment: Alignment.center,
            child: DropdownButtonFormField<String>(
              isExpanded: true,
              style: TextStyle(
                fontSize: 13.h,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                color: const Color(0xFFA6A6A6),
              ),
              icon: Image.asset('assets/img/dropdown_grey.png'),
              //padding: const EdgeInsets.only(left: 16).w,
              decoration: const InputDecoration(border: InputBorder.none),
              hint: const Text('Select option'),
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() => dropdownValue = newValue!);
              },
              borderRadius: BorderRadius.circular(20),
              items: ['Option 1', 'Option 2', 'Option 3'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Container(
                    width: 100,
                    padding: EdgeInsets.only(left: 10.w),
                    child: Text(value),
                  ),
                );
              }).toList(),
            ),
          ),
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
