import 'dart:async';

import 'package:astrology_app/view/intro/email_intro.dart';
import 'package:astrology_app/view/widgets/otp_field.dart';
import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/intro_clip_circle.dart';
import '../widgets/intro_filled_button.dart';
import 'done.dart';

class EmailOtpIntro extends StatefulWidget {
  const EmailOtpIntro({super.key});

  @override
  State<EmailOtpIntro> createState() => _EmailOtpIntroState();
}

class _EmailOtpIntroState extends State<EmailOtpIntro> {
  late Timer _timer;
  int _secondsRemaining = 59;
  bool enableResend = false;

  @override
  void initState() {
    super.initState();
    // Start the countdown timer
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  void _startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          timer.cancel(); // Stop the timer when countdown is complete
          enableResend = true;
        }
      });
    });
  }

  void _resendOTP() {
    // Logic to resend OTP here
    setState(() {
      _secondsRemaining = 59; // Reset timer to initial time
      _startTimer(); // Restart the timer
    });
  }

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
                          'assets/svg/enter_otp.svg',
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
                          padding: EdgeInsets.fromLTRB(30.w, 20.h, 30.w, 10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'OTP Verification',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.h,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              5.h.spY,
                              Text(
                                'A 4-digit code has been sent to your Email Id',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.h,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Timer
                        Center(
                          child: Text(
                            '00:${_secondsRemaining.toString().padLeft(2, '0')}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.h,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),

                        13.h.spY,

                        /// OTP Field
                        const OTPField(),

                        /// Button
                        IntroFilledButton(
                          text: 'Verify OTP',
                          marginBottom: 20.h,
                          page: const Done(
                            message: 'Email verification has successfully done',
                          ),
                        ),

                        /// Resend Text
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'If you didn\'t receive a code! ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.h,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              8.w.spX,
                              GestureDetector(
                                onTap: () {
                                  if (enableResend) {
                                    _resendOTP();
                                    enableResend = false;
                                  }
                                },
                                child: Container(
                                  width: 70.w,
                                  height: 27.h,
                                  alignment: Alignment.center,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFFFE8E8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    'Resend',
                                    style: TextStyle(
                                      color: const Color(0xE5DE1F27),
                                      fontSize: 12.h,
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                            margin: EdgeInsets.symmetric(horizontal: 30.w).copyWith(
                              top: 28.h,
                              bottom: 45.h,
                            ),
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
                                  'Change Email Id',
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
