import 'package:astrology_app/utils/utils.dart';
import 'package:astrology_app/view/astrologer/astrologer_details.dart';
import 'package:astrology_app/view/astrologer/astrologers_list.dart';
import 'package:astrology_app/view/home/app_bar_home.dart';
import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF4F4F4),
        body: SingleChildScrollView(
          // Entire content
          child: Column(
            children: [
              // AppBar and Before Trending (i.e Section 1)
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  /// AppBar
                  const AppBarHome(),

                  /// Section 1
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16).w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header
                        8.h.spY,
                        Text(
                          'Daily Horoscope',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.h,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        Text(
                          'The stars are on your favor, you cant be horrible.They\nwont let you down!',
                          style: TextStyle(
                            color: const Color(0xFF5C5C5C),
                            fontSize: 14.h,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        10.h.spY,
                        const DailyHoroscopeSection(),
                        23.h.spY,
                        const AstroServicesSection(),
                        23.h.spY,
                        const RecommendedAstrologersSection(),
                      ],
                    ),
                  ),
                ],
              ),

              // After Section 1
              const TrendingConsultationsSection(),
              const BusinessConsultationSection(),
              const PlanetaryTransitSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class DailyHoroscopeSection extends StatelessWidget {
  const DailyHoroscopeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HoroscopeCard(sign: 'Leo', image: 'leo'.svg),
        HoroscopeCard(sign: 'Virgo', image: 'virgo'.svg),
        HoroscopeCard(sign: 'Cancer', image: 'cancer'.svg),
      ],
    );
  }
}

class HoroscopeCard extends StatelessWidget {
  final String sign;
  final Widget image;

  const HoroscopeCard({super.key, required this.sign, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 98.w,
          height: 117.h,
          padding: const EdgeInsets.symmetric(vertical: 12).h,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10).r,
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 8,
                offset: Offset(2, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 64.h,
                child: image,
              ),
              8.h.spY,
              Text(sign),
            ],
          ),
        ),
      ],
    );
  }
}

class AstroServicesSection extends StatelessWidget {
  const AstroServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Astro Services',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.h,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          height: 128.h,
          margin: EdgeInsets.only(top: 18.h),
          decoration: ShapeDecoration(
            color: const Color(0x19FF6B00),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10).r,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 23.w,
              vertical: 18.h,
            ).copyWith(
              bottom: 10.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AstroServiceCard(icon: 'missed_call'.svg, label: 'Call'),
                AstroServiceCard(icon: 'entypo_chat'.svg, label: 'Chat'),
                AstroServiceCard(icon: 'fluent_video_call'.svg, label: 'Video'),
                AstroServiceCard(icon: 'carbon_report'.svg, label: 'Detail Report'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AstroServiceCard extends StatelessWidget {
  final Widget icon;
  final String label;

  const AstroServiceCard({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 56.5.w,
          height: 60.h,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10).r,
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 6,
                offset: Offset(1, 2),
                spreadRadius: 0,
              )
            ],
          ),
          child: Container(
            padding: const EdgeInsets.all(10).r,
            child: icon,
          ),
        ),
        SizedBox(height: 6.h),
        Container(
          width: 56.5.w,
          height: 33.h,
          alignment: Alignment.center,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12.h,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class RecommendedAstrologersSection extends StatelessWidget {
  const RecommendedAstrologersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recomended Astrologers',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.h,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const AstrologersListPage();
                  },
                ),
              ),
              child: Text(
                'See all ',
                style: TextStyle(
                  color: const Color(0xFF00A9C0),
                  fontSize: 14.h,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RecommendedAstrologerCard(
                name: 'Astro Vivek K',
                price: '₹30/min',
                imageUrl: 'astro_1'.png,
              ),
              8.w.spX,
              RecommendedAstrologerCard(
                name: 'Acharya Anu',
                price: '₹30/min',
                imageUrl: 'astro_2'.png,
              ),
              8.w.spX,
              RecommendedAstrologerCard(
                name: 'Dharmik',
                price: '₹50/min',
                imageUrl: 'astro_3'.png,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RecommendedAstrologerCard extends StatelessWidget {
  final String name;
  final String price;
  final Image imageUrl;

  const RecommendedAstrologerCard({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Container(
        width: 119.w,
        height: 177.h,
        padding: const EdgeInsets.all(8.0).r,
        child: Column(
          children: [
            SizedBox(
              height: 85.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 35.h,
                    backgroundImage: imageUrl.image,
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 45.w,
                      height: 21.h,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20).r,
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x26000000),
                            blurRadius: 8,
                            offset: Offset(1, 1),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 16.h,
                            height: 13.h,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20).r,
                              ),
                            ),
                            child: 'star_icon'.svg,
                          ),
                          4.w.spX,
                          Text(
                            '5',
                            style: TextStyle(
                              color: const Color(0xFF282828),
                              fontSize: 12.h,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            6.h.spY,
            Text(
              name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.h,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              price,
              style: TextStyle(
                color: const Color(0xFF727272),
                fontSize: 12.h,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
            Container(
              height: 27.5.h,
              margin: EdgeInsets.only(top: 5.h),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0050C8),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const AstrologerDetails();
                      },
                    ),
                  );
                },
                child: Text(
                  'connect',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.h,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TrendingConsultationsSection extends StatelessWidget {
  const TrendingConsultationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 187.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      margin: EdgeInsets.symmetric(vertical: 25.h),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(1.00, 0.00),
          end: Alignment(-1, 0),
          colors: [
            Color(0xFF2F0001),
            Color(0xFFE1353C),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          7.h.spY,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const ConsultationDescription(),
                ConsultationCard(
                  image: 'astro_1'.png,
                  category: 'Health',
                ),
                12.w.spX,
                ConsultationCard(
                  image: 'astro_2'.png,
                  category: 'Education',
                ),
                12.w.spX,
                ConsultationCard(
                  image: 'astro_1'.png,
                  category: 'Wealth',
                ),
                12.w.spX,
                ConsultationCard(
                  image: 'astro_2'.png,
                  category: 'Career',
                ),
                12.w.spX,
                ConsultationCard(
                  image: 'astro_2'.png,
                  category: 'Love & Relationship',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ConsultationDescription extends StatelessWidget {
  const ConsultationDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 159.5.w,
      height: 157.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Text(
                'Trending Consultations',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.h,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              20.h.spY,
              Text(
                'Astrology is a language, If\n'
                'you want to understand this\nlanguage ,speak to us !',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.h,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Text(
            'Swipe ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.h,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class ConsultationCard extends StatelessWidget {
  final Image image;
  final String category;

  const ConsultationCard({super.key, required this.image, required this.category});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 110.h,
            height: 110.h,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: image.image,
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10).r,
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 8,
                  offset: Offset(2, 4),
                  spreadRadius: 0,
                )
              ],
            ),
          ),
          11.h.spY,
          SizedBox(
            height: 42.h,
            child: Text(
              category,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.h,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BusinessConsultationSection extends StatelessWidget {
  const BusinessConsultationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BusinessConsultationDetails(),
        Container(
          height: 187.h,
          padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 6.h),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x26000000),
                blurRadius: 10,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                BusinessConsultationCard(name: 'Acharya', price: '₹ 40/min', image: 'acharya'.png),
                BusinessConsultationCard(name: 'Dharmik', price: '₹ 50/min', image: 'dharmik'.png),
                BusinessConsultationCard(name: 'Sujoy sen', price: '₹ 90/min', image: 'sujoy'.png),
                BusinessConsultationCard(name: 'Sujoy sen', price: '₹ 90/min', image: 'astro_4'.png),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class BusinessConsultationDetails extends StatelessWidget {
  const BusinessConsultationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      padding: EdgeInsets.only(left: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Are you worried about your ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.h,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: 'business ?',
                      style: TextStyle(
                        color: const Color(0xFFE1353C),
                        fontSize: 14.h,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              14.5.h.spY,
              Text(
                'Our astrolgers are there to Guide/ help you',
                style: TextStyle(
                  color: const Color(0xFF505050),
                  fontSize: 12.h,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Container(
            width: 85.h,
            height: 85.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: 'finance'.png.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BusinessConsultationCard extends StatelessWidget {
  final String name;
  final String price;
  final Image image;

  const BusinessConsultationCard({
    super.key,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0).r,
      child: Column(
        children: [
          Container(
            width: 93.5.w,
            height: 112.h,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: image.image,
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 6,
                  offset: Offset(1, 2),
                  spreadRadius: 0,
                )
              ],
            ),
          ),
          6.h.spY,
          Text(
            name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.h,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            price,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12.h,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class PlanetaryTransitSection extends StatelessWidget {
  const PlanetaryTransitSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Planetary Transit', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          10.h.spY,
          PlanetaryCard(
            child: TransitCard(
              title: 'Venus Transit',
              description: 'Ask what does Venus transit signifies for you, love life, '
                  'relationship, pleasure, luxuries.',
              image: 'venus'.png,
              color: const Color(0xFFF9EADA),
            ),
          ),
          PlanetaryCard(
            child: TransitCard(
              title: 'Jupiter Transit',
              description: 'Know the impact of Guru transit, expect great changes, '
                  'profits and fulfillment of desire.',
              image: 'jupiter'.png,
              color: const Color(0xFFDAF2F0),
            ),
          ),
          PlanetaryCard(
            child: TransitCard(
              title: 'Saturn Transit',
              description: 'Talk about Saturn transit, retrograde, reveal affects, '
                  'new opportunities, income and losses.',
              image: 'sun'.png,
              color: const Color(0xFFF6DCDD),
            ),
          ),
          PlanetaryCard(
            child: TransitCard(
              title: 'Mercury Transit',
              description: 'Discover transit, retrograde of planet Mercury '
                  'how it strengthen trade, commerce and speech.',
              image: 'mercury'.png,
              color: const Color(0xFFF1E6F6),
            ),
          ),
          PlanetaryCard(
            child: TransitCard(
              title: 'Rahu Ketu Transit',
              description: 'Discuss Rahu Ketu transit, '
                  'how it will influence you and get remedy to increase benefits.',
              image: 'sun'.png,
              color: const Color(0xFFE8FAED),
            ),
          ),
        ],
      ),
    );
  }
}

class PlanetaryCard extends StatelessWidget {
  const PlanetaryCard({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 155.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            top: 21.5.h,
            right: 0,
            child: Container(
              //width: 330.w,
              height: 133.5.h,
              decoration: ShapeDecoration(
                color: (child as TransitCard).color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10).r,
                ),
              ),
            ),
          ),
          Positioned(
            left: 6.5.w,
            top: 0,
            child: Container(
              width: 40.5.w,
              height: 43.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: (child as TransitCard).image.image,
                  fit: BoxFit.contain,
                ),
                shape: BoxShape.circle,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 6,
                    offset: Offset(2, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 22.w,
            top: 43.h,
            child: SizedBox(
              width: 14.w,
              height: 43.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 3.3.w,
                    height: 46.h,
                    color: const Color(0xFFBEBEBE),
                  ),
                  Positioned(
                    left: 0.5.w,
                    top: 29.h,
                    child: Container(
                      width: 12.2.w,
                      height: 13.h,
                      decoration: const ShapeDecoration(
                        color: Color(0xFFCE853E),
                        shape: OvalBorder(),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 28.h,
                    child: Container(
                      width: 13.8.w,
                      height: 14.5.h,
                      decoration: const ShapeDecoration(
                        shape: OvalBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignOutside,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(left: 55.w, top: 36.h, child: child),
        ],
      ),
    );
  }
}

class TransitCard extends StatelessWidget {
  final String title;
  final String description;
  final Image image;
  final Color color;

  const TransitCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.5.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.h,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                ),
              ),
              8.h.spY,
              SizedBox(
                width: 265.5.w,
                child: Text(
                  description,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13.h,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          Text(
            'View >>',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.h,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
