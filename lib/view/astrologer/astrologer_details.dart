import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/bottom_nav.dart';
import '../widgets/toolbar.dart';
import 'about_card.dart';
import 'consultants_card.dart';
import 'info_card.dart';
import 'rating_card.dart';
import 'report_card.dart';

class AstrologerDetails extends StatefulWidget {
  const AstrologerDetails({super.key});

  @override
  State<AstrologerDetails> createState() => _AstrologerDetailsState();
}

class _AstrologerDetailsState extends State<AstrologerDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F8F8),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(88.h),
          child: const Toolbar(
            title: 'Profile',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 1
                    InfoCard(),
                    // 2
                    AboutSection(),
                    // 3
                    RatingOverview(),
                    // 4
                    ReportSection(),
                    // 5
                    SimilarConsultants(),

                    // End
                  ],
                ),
              ),
            ],
          ),
        ),

        /// Nav
        bottomNavigationBar: Container(
          height: 80.h,
          padding: EdgeInsets.only(top: 14.h),
          decoration: ShapeDecoration(
            color: const Color(0xFFF8F8F8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12).r,
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 15,
                offset: Offset(-1, -1),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BottomNavItem(
                color: Colors.white,
                borderColor: const Color(0xFF1AA260),
                textColor: const Color(0xFF1AA260),
                text: 'Call',
                icon: SvgPicture.asset('assets/svg/call.svg', height: 14),
              ),
              BottomNavItem(
                color: Colors.white,
                borderColor: const Color(0xFFCEA70D),
                textColor: const Color(0xFFCEA70D),
                text: 'Chat',
                icon: SvgPicture.asset('assets/svg/chat.svg', height: 14),
              ),
              BottomNavItem(
                color: Colors.white,
                borderColor: const Color(0xFF1AA260),
                textColor: const Color(0xFF1AA260),
                text: 'Video call',
                icon: SvgPicture.asset('assets/svg/video.svg', height: 12),
              ),
            ],
          ),
        ),

        ///
      ),
    );
  }
}
