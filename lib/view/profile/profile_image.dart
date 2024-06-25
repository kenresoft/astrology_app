import 'package:astrology_app/utils/utils.dart';
import 'package:astrology_app/view/astrologer/astrologer_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 133.h,
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const AstrologerDetails();
            },
          ),
        ),
        child: Container(
          width: 88.h,
          height: 88.h,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: 'img_profile'.png.image,
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1.5.h,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ),
    );
  }
}
