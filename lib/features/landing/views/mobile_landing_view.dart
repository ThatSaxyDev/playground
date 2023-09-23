import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getlinked/features/landing/widgets/countdown.dart';
import 'package:getlinked/features/landing/widgets/star_blinker.dart';
import 'package:getlinked/features/landing/widgets/text_column.dart';
import 'package:getlinked/shared/app_extensions.dart';
import 'package:getlinked/shared/app_fonts.dart';
import 'package:getlinked/shared/app_widgets/button.dart';
import 'package:getlinked/shared/app_widgets/myicon.dart';
import 'package:getlinked/theme/palette.dart';

class MobileLandingView extends StatefulWidget {
  const MobileLandingView({
    super.key,
  });

  @override
  State<MobileLandingView> createState() => _MobileLandingViewState();
}

class _MobileLandingViewState extends State<MobileLandingView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics:
          const AlwaysScrollableScrollPhysics(parent: ClampingScrollPhysics()),
      slivers: [
        SliverAppBar(
          backgroundColor: Palette.bgPurpleColor,
          centerTitle: false,
          title: Padding(
              padding: EdgeInsets.only(left: 25.w),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'get',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontFamily: AppFonts.clash,
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'linked',
                      style: TextStyle(
                        color: const Color(0xFFD434FE),
                        fontSize: 15.sp,
                        fontFamily: AppFonts.clash,
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              )),
          floating: true,
          actions: [
            MyIcon(
              icon: 'menu',
              height: 14.h,
            ),
            48.sbW,
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(color: Palette.neutralWhite.withOpacity(0.2)),
            )),
          ),
          expandedHeight: 71.h,
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(
                height: 410.h,
                width: double.infinity,
                child: Stack(
                  children: [
                    Container(
                      height: 400.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('flare1'.png),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ).alignTopLeft(),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 110.w, right: 70.w, top: 90.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StarBlinker(
                            height: 12.h,
                            color: Palette.neutralWhite,
                          ),
                          StarBlinker(
                            height: 8.h,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 400.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Palette.bgPurpleColor.withOpacity(0.5),
                      ),
                    ).alignTopLeft(),
                    Column(
                      children: [
                        31.sbH,
                        'Igniting a Revolution in HR Innovation'
                            .txt(
                              size: 16.sp,
                              fontW: F.w7,
                              fontStyle: FontStyle.italic,
                              color: Palette.neutralWhite,
                            )
                            .alignCenter(),
                        3.sbH,
                        Padding(
                          padding: EdgeInsets.only(right: 42.w),
                          child: MyIcon(
                            icon: 'swipe',
                            height: 11.h,
                          ).alignCenterRight(),
                        ),
                        30.sbH,
                        'title'.png.myImage(height: 91.h),
                        12.sbH,
                        'Participate in getlinked tech Hackathon\n2023 stand a chance to win a Big prize'
                            .txt(
                              size: 16.sp,
                              color: Palette.neutralWhite,
                            )
                            .alignCenter(),
                        30.sbH,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            StarBlinker(
                              opacity: 0,
                              height: 8.h,
                            ),
                            21.sbW,
                            BButton(
                              onTap: () {},
                              height: 46.84.h,
                              width: 152.w,
                              text: 'Register',
                            ),
                            21.sbW,
                            StarBlinker(
                              height: 8.h,
                            ),
                          ],
                        ),
                        const Spacer(),
                        const CountDownn(),
                      ],
                    ),
                  ],
                ),
              ),
              20.sbH,

              //! image
              Stack(
                children: [
                  'man'.png.myImage(),
                  'shine'.png.myImage(height: 324.h).alignTopCenter(),
                ],
              ),
              29.sbH,

              Container(
                height: 1475.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(
                  bottom:
                      BorderSide(color: Palette.neutralWhite.withOpacity(0.2)),
                )),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 590.h),
                      child: Container(
                        height: 435.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('flare2'.png),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 300.h,
                      right: 50.w,
                      child: StarBlinker(
                        height: 14.h,
                        color: Palette.neutralWhite,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1000.h),
                      child: Container(
                        height: 435.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              const Color.fromRGBO(63, 22, 128, 1),
                              Palette.bgPurpleColor.withOpacity(0.5),
                              Palette.bgPurpleColor.withOpacity(0.5),
                              // Colors.yellow,
                            ],
                            stops: const [0.0, 2, 0.6],
                            center: Alignment.centerRight,
                            radius: 0.5,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: 310.w,
                          height: 340.h,
                          child: Stack(
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  'big'.png.myImage(height: 293.h),
                                  StarBlinker(
                                    height: 30.h,
                                    icon: 'arrow',
                                  )
                                ],
                              ),
                              Positioned(
                                top: 87.h,
                                child: StarBlinker(
                                  height: 13.h,
                                  color: Palette.starlightpurple,
                                ),
                              ),
                            ],
                          ),
                        ),
                        22.sbH,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            StarBlinker(
                              opacity: 0,
                              height: 10.h,
                              color: Palette.textPurple,
                            ),
                            18.sbW,
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Introduction to getlinked\n',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontFamily: AppFonts.clash,
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'tech Hackathon 1.0',
                                    style: TextStyle(
                                      color: const Color(0xFFD434FE),
                                      fontSize: 20.sp,
                                      fontFamily: AppFonts.clash,
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                            18.sbW,
                            StarBlinker(
                              height: 10.h,
                              color: Palette.textPurple,
                            ),
                          ],
                        ),
                        9.sbH,
                        'Our tech hackathon is a melting pot of\nvisionaries, and its purpose is as clear as\nday: to shape the future. Whether you\'re\n a coding genius, a design maverick, or a\n concept wizard, you\'ll have the chance to\ntransform your ideas into reality. Solving\nreal-world problems, pushing the boundaries\nof technology, and creating solutions that can\nchange the world, that\'s what we\'re all about!'
                            .txt(
                          textAlign: TextAlign.center,
                          size: 13.sp,
                          color: Palette.neutralWhite,
                          height: 1.7,
                        ),
                        60.sbH,
                        Divider(
                          color: Palette.neutralWhite.withOpacity(0.2),
                        ),
                        SizedBox(
                          width: 295.w,
                          child: Stack(
                            children: [
                              'woman'.png.myImage(height: 382.h),
                              Positioned(
                                top: 180.h,
                                child: StarBlinker(
                                  height: 12.h,
                                  color: Palette.neutralWhite,
                                ),
                              ),
                            ],
                          ),
                        ),
                        10.sbH,
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Rules and\n',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontFamily: AppFonts.clash,
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: 'Guidelines',
                                style: TextStyle(
                                  color: const Color(0xFFD434FE),
                                  fontSize: 20.sp,
                                  fontFamily: AppFonts.clash,
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        9.sbH,
                        'Our tech hackathon is a melting pot of\nvisionaries, and its purpose is as clear as\nday: to shape the future. Whether you\'re\n a coding genius, a design maverick, or a\n concept wizard, you\'ll have the chance to\ntransform your ideas into reality. Solving\nreal-world problems, pushing the boundaries\nof technology, and creating solutions that can\nchange the world, that\'s what we\'re all about!'
                            .txt(
                          textAlign: TextAlign.center,
                          size: 13.sp,
                          color: Palette.neutralWhite,
                          height: 2,
                        ),
                        15.sbH,
                        Padding(
                          padding: EdgeInsets.only(left: 108.w),
                          child: StarBlinker(
                            height: 12.h,
                            color: Palette.neutralWhite,
                          ),
                        ).alignCenterLeft(),
                        const Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 1200.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(
                  bottom:
                      BorderSide(color: Palette.neutralWhite.withOpacity(0.2)),
                )),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 173.w, top: 17.h, bottom: 42.h),
                          child: StarBlinker(
                            height: 17.h,
                            color: Palette.textPurple,
                          ),
                        ).alignCenterLeft(),
                        Stack(
                          children: [
                            'judge'.png.myImage(height: 275.h),
                            Positioned(
                              bottom: 114.h,
                              right: 137.w,
                              child: StarBlinker(
                                height: 14.h,
                                color: Palette.pur,
                              ),
                            ),
                          ],
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Judging Criteria\n',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontFamily: AppFonts.clash,
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: 'Key attributes',
                                style: TextStyle(
                                  color: const Color(0xFFD434FE),
                                  fontSize: 20.sp,
                                  fontFamily: AppFonts.clash,
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        20.sbH,
                        const TextColumn(),
                        25.sbH,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StarBlinker(
                              opacity: 0,
                              height: 12.h,
                            ),
                            BButton(
                              onTap: () {},
                              height: 31.3.h,
                              width: 96.3.w,
                              text: 'Read More',
                              fontSize: 12.sp,
                              gradient: const LinearGradient(
                                begin: Alignment(-1.00, -0.00),
                                end: Alignment(1, 0),
                                colors: [
                                  Color(0xFF903AFF),
                                  Color(0xFFD434FE),
                                  Color(0xFFFF25B8),
                                  Color(0xFFFE34B9)
                                ],
                              ),
                            ),
                            StarBlinker(
                              color: Palette.neutralWhite,
                              height: 12.h,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
