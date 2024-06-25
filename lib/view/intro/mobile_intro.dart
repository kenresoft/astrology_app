import 'package:astrology_app/view/intro/email_intro.dart';
import 'package:astrology_app/view/intro/mobile_otp_intro.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../repository/pref.dart';
import '../widgets/intro_clip_circle.dart';
import '../widgets/intro_filled_button.dart';

class MobileIntro extends StatefulWidget {
  const MobileIntro({super.key});

  @override
  State<MobileIntro> createState() => _MobileIntroState();
}

class _MobileIntroState extends State<MobileIntro> {
  final TextEditingController _countryController = TextEditingController(text: country);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: 1.sh - MediaQuery.paddingOf(context).top,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.end,
              children: [
                /// Section 1
                Stack(
                  children: [
                    CustomPaint(
                      size: Size(1.sw, 5.h), // Define the size of the custom painter
                      painter: IntroClipCircle(),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Container(
                        margin: EdgeInsets.only(top: 78.h, bottom: 65.h, left: 20.w, right: 20.w),
                        child: SvgPicture.asset(
                          'assets/svg/mobile_login.svg',
                          height: 235.h,
                          width: 235.h,
                        ),
                      ),
                    ),
                  ],
                ),

                /// Section 2
                Expanded(
                  child: Container(
                    width: 1.sw,
                    decoration: ShapeDecoration(
                      color: const Color(0xE5DE1F27),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(30).r,
                          topRight: const Radius.circular(30).r,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 30.w, top: 20.h, bottom: 19.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hi Welcome!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.h,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              5.h.spY,
                              Text(
                                'Submit your Mobile number',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.h,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Container(
                                margin: EdgeInsets.only(left: 30.w, right: 5.w),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 0.7.w,
                                      color: const Color(0xFFD5D5D5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'Log in or Sign up',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.h,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Flexible(
                              child: Container(
                                margin: EdgeInsets.only(left: 5.w, right: 30.w),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 0.7.w,
                                      color: const Color(0xFFD5D5D5),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        18.h.spY,

                        /// Mobile Number Field
                        Container(
                          width: 1.sw,
                          height: 44.h,
                          margin: EdgeInsets.symmetric(horizontal: 30.w),
                          alignment: Alignment.center,
                          decoration: ShapeDecoration(
                            color: Colors.white,
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
                          child: Row(
                            children: [
                              SizedBox(
                                width: 135.w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 100.w,
                                      child: CountryCodePicker(
                                        initialSelection: 'US',
                                        padding: const EdgeInsets.only(left: 0),
                                        flagWidth: 37.h,
                                        alignLeft: true,
                                        textOverflow: TextOverflow.visible,
                                        dialogTextStyle: TextStyle(
                                          color: const Color(0xFF7F7F7F),
                                          fontSize: 15.h,
                                          fontFamily: 'OpenSans',
                                          fontWeight: FontWeight.w500,
                                        ),
                                        boxDecoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3).r,
                                        ),
                                        textStyle: TextStyle(
                                          color: const Color(0xFF111827),
                                          fontSize: 15.h,
                                          fontFamily: 'OpenSans',
                                          height: 0.8.h,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Image.asset('assets/img/dropdown.png'),
                                      ],
                                    ),
                                    Container(
                                      width: 2,
                                      color: const Color(0xffBABABA),
                                      margin: const EdgeInsets.symmetric(vertical: 8).h.copyWith(left: 5.w, right: 15.w),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: _countryController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter Mobile number',
                                    hintStyle: TextStyle(
                                      color: const Color(0xFF7F7F7F),
                                      fontSize: 15.h,
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: const Color(0xFF7F7F7F),
                                    fontSize: 15.h,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// Button

                        const IntroFilledButton(
                          text: 'SEND OTP',
                          page: MobileOtpIntro(),
                        ),

                        /// OR

                        Row(
                          children: [
                            Flexible(
                              child: Container(
                                margin: EdgeInsets.only(left: 30.w, right: 12.w),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 0.7.w,
                                      color: const Color(0xFFD5D5D5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'Or',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.h,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Flexible(
                              child: Container(
                                margin: EdgeInsets.only(left: 12.w, right: 30.w),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 0.7.w,
                                      color: const Color(0xFFD5D5D5),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),

                        /// Continue Button
                        GestureDetector(
                          onTap: () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const EmailIntro(),
                            ),
                          ),
                          child: Container(
                            width: 362.w,
                            height: 44.h,
                            margin: EdgeInsets.symmetric(horizontal: 30.w).copyWith(top: 20.h, bottom: 45.h),
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  width: 1.50,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(12).r,
                              ),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/svg/dashicons_email.svg'),
                                40.w.spX,
                                Text(
                                  'Continue with Email Id',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.h,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        /// Bottom Text
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 28).w,
                          child: Text.rich(
                            maxLines: 1,
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'By signing up, you agree to our  ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.h,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Terms of Use ',
                                  style: TextStyle(
                                    color: const Color(0xFFFFB900),
                                    fontSize: 10.h,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: ' and ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.h,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Privacy Policy',
                                  style: TextStyle(
                                    color: const Color(0xFFFFB900),
                                    fontSize: 10.h,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )

                        //
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
