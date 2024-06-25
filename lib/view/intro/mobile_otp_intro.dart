import 'dart:async';

import 'package:astrology_app/view/intro/mobile_intro.dart';
import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/intro_clip_circle.dart';
import '../widgets/intro_filled_button.dart';
import 'done.dart';

class MobileOtpIntro extends StatefulWidget {
  const MobileOtpIntro({super.key});

  @override
  State<MobileOtpIntro> createState() => _MobileOtpIntroState();
}

class _MobileOtpIntroState extends State<MobileOtpIntro> {
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
                          padding: EdgeInsets.only(left: 30.w, top: 20.h, bottom: 10.h),
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
                                'An 4 digit code has been sent to your number',
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            4,
                            (index) => Container(
                              width: 36.w,
                              height: 44.h,
                              margin: EdgeInsets.symmetric(horizontal: 9.w),
                              alignment: Alignment.center,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12).r,
                                ),
                              ),
                              //
                            ),
                          ),
                        ),

                        /// Button
                        IntroFilledButton(
                          text: 'Verify OTP',
                          marginBottom: 16.h,
                          page: const Done(
                            message: 'Mobile verification has successfully done',
                          ),
                        ),

                        /// Resend Text
                        GestureDetector(
                          onTap: () {
                            if (enableResend) {
                              _resendOTP();
                              enableResend = false;
                            }
                          },
                          child: Center(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'If you din\'t receive a code! ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.h,
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Resend',
                                    style: TextStyle(
                                      color: const Color(0xFFFFB900),
                                      fontSize: 14.h,
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        /// Continue Button
                        GestureDetector(
                          onTap: () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const MobileIntro(),
                            ),
                          ),
                          child: Container(
                            width: 362.w,
                            height: 44.h,
                            margin: EdgeInsets.symmetric(horizontal: 30.w).copyWith(top: 40.h, bottom: 45.h),
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
                                SvgPicture.asset('assets/svg/mobile_device_icon.svg'),
                                40.w.spX,
                                Text(
                                  'Change Mobile Number',
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
