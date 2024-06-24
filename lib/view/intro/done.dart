import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../home/home.dart';

class Done extends StatelessWidget {
  const Done({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
      ); // Replace with your route name
    });
    return SafeArea(
      child: Scaffold(
        body: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Color(0xFFFBFBFB)),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.only(
                    top: 112.h,
                    bottom: 95.h,
                    left: 20.w,
                    right: 20.w,
                  ),
                  child: SvgPicture.asset(
                    'assets/svg/done.svg',
                    width: 275.h,
                    height: 275.h,
                  ),
                ),
              ),
              SizedBox(
                height: 100.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/check.svg',
                      width: 53.h,
                      height: 53.h,
                    ),
                    Text(
                      message,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.h,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
