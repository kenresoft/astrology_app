import 'package:astrology_app/view/widgets/gender_selector.dart';
import 'package:astrology_app/view/widgets/toolbar.dart';
import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'feedback_form.dart';
import 'support_form.dart';

class FeedbackSupport extends StatefulWidget {
  const FeedbackSupport({super.key});

  @override
  State<FeedbackSupport> createState() => _FeedbackSupportState();
}

class _FeedbackSupportState extends State<FeedbackSupport> {
  String selectedForm = 'Contact Support'; // Initially show Contact Support form

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(88.h),
          child: const Toolbar(),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30).w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///Type
                    Padding(
                      padding: EdgeInsets.only(top: 35.h),
                      child: Text(
                        'Type',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.h,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    /// Selector
                    Padding(
                      padding: EdgeInsets.only(top: 12.h),
                      child: RadioSelector(
                        option1: 'Contact Support',
                        option2: 'Feedback',
                        initialValue: 'Contact Support',
                        radioStyle: TextStyle(
                          fontSize: 16.h,
                        ),
                        onChanged: (value) {
                          setState(() {
                            selectedForm = value!;
                          });
                        },
                      ),
                    ),

                    20.h.spY,

                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: SizeTransition(
                            sizeFactor: animation,
                            child: child,
                          ),
                        );
                      },
                      child: condition(
                        selectedForm == 'Contact Support',
                        const ContactSupportForm(),
                        const FeedbackForm(),
                      ),
                    ),
                  ],
                ),
              ),
              //
            ],
          ),
        ),
      ),
    );
  }
}
