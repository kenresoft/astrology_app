import 'package:astrology_app/utils/utils.dart';
import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ReviewItem(
          name: 'Anonymous',
          review: 'Amazing astrologer mostly all doubts are clear.',
          stars: 5,
        ),
        // Divider
        Container(
          width: double.infinity,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 0.5.h,
                strokeAlign: BorderSide.strokeAlignCenter,
                color: const Color(0xFFE8E8E8),
              ),
            ),
          ),
        ),
        const ReviewItem(
          name: 'Farnaz',
          review: 'Astrologer gently answered to my questions and shared remedial '
              'advise which would create good vibes for marital prosperity with my husband.',
          stars: 5,
        ),
        // Divider
        Container(
          width: double.infinity,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 0.5.h,
                strokeAlign: BorderSide.strokeAlignCenter,
                color: const Color(0xFFE8E8E8),
              ),
            ),
          ),
        ),
        const ReviewItem(
          name: 'Ravi',
          review: 'He has revealed the problems and gave solutions to come out of it',
          stars: 4,
        ),
      ],
    );
  }
}

class ReviewItem extends StatelessWidget {
  final String name;
  final String review;
  final int stars;

  const ReviewItem({
    super.key,
    required this.name,
    required this.review,
    required this.stars,
  });

  @override
  Widget build(BuildContext context) {
    bool anonymity = name == 'Anonymous';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //12.h.spY,
        Padding(
          padding: EdgeInsets.fromLTRB(15.w, 12.h, 15.w, 18.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: ShapeDecoration(
                  image: condition(
                    !anonymity,
                    DecorationImage(
                      fit: BoxFit.cover,
                      image: 'user_avatar'.png.image,
                    ),
                    null,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 6,
                      offset: Offset(1, 1),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: condition(
                  anonymity,
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: 'anonymous'.svg,
                  ),
                  null,
                ),
              ),
              12.w.spX,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.h,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  5.h.spY,
                  '${stars}_stars'.svg,
                  12.h.spY,
                  SizedBox(
                    width: .65.sw,
                    child: Text(
                      review,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.h,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                  //18.h.spY,
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RatingOverview extends StatelessWidget {
  const RatingOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 495.h,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10).r,
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 6,
            offset: Offset(1, 1),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(15.w, 10.h, 15.w, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rating overview',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13.5.h,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 7.h),
                      child: Column(
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '5/',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 32.h,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: '5',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.h,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          12.h.spY,
                          '5_star_rating'.svg,
                          10.h.spY,
                          Text(
                            '348 Ratings',
                            style: TextStyle(
                              color: const Color(0xFFB3B3B3),
                              fontSize: 12.h,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Rate bar
                    Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: const RateBar(percents: [100, 23, 12, 0, 0]),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),

          // List
          const Expanded(child: ReviewList()),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.h).copyWith(bottom: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'See all reviews',
                  style: TextStyle(
                    color: const Color(0xFF157B11),
                    fontSize: 14.h,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                5.w.spX,
                Icon(
                  Icons.arrow_forward_rounded,
                  size: 24.h,
                  color: const Color(0xFF157B11),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RateBar extends StatelessWidget {
  const RateBar({
    super.key,
    required this.percents,
  });

  final List<double> percents;

  @override
  Widget build(BuildContext context) {
    final width = 124.w;
    final height = 8.8.h;
    return Column(
      children: [
        ...List.generate(
          5,
          (index) {
            var position = 5 - index;
            return Row(
              children: [
                Text(
                  '$position',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.h,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                10.w.spX,
                SizedBox(
                  width: width,
                  height: height,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: width,
                          height: height,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFD9D9D9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5).r,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: percents[index] / 100 * width,
                          height: height,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF7BD02),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5).r,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
