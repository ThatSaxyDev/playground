import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getlinked/shared/app_extensions.dart';
import 'package:getlinked/shared/app_fonts.dart';
import 'package:getlinked/theme/palette.dart';
import 'package:google_fonts/google_fonts.dart';

class CountDownn extends StatefulWidget {
  const CountDownn({super.key});

  @override
  State<CountDownn> createState() => _CountDownnState();
}

class _CountDownnState extends State<CountDownn> {
  ValueNotifier<bool> switchTime = false.notifier;
  @override
  Widget build(BuildContext context) {
    return switchTime.sync(
      builder: (context, value, child) => switchTime.value
          ? RichText(
              text: TextSpan(
                text: ' 00',
                style: TextStyle(
                  fontSize: 48.sp,
                  fontFamily: AppFonts.uni,
                  color: Palette.neutralWhite,
                ),
                children: [
                  TextSpan(
                    text: 'H   ',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: AppFonts.mont,
                      color: Palette.neutralWhite,
                    ),
                  ),
                  TextSpan(
                    text: '00',
                    style: TextStyle(
                      fontSize: 48.sp,
                      fontFamily: AppFonts.uni,
                      color: Palette.neutralWhite,
                    ),
                  ),
                  TextSpan(
                    text: 'M   ',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: AppFonts.mont,
                      color: Palette.neutralWhite,
                    ),
                  ),
                  TextSpan(
                    text: '00',
                    style: TextStyle(
                      fontSize: 48.sp,
                      fontFamily: AppFonts.uni,
                      color: Palette.neutralWhite,
                    ),
                  ),
                  TextSpan(
                    text: 'M   ',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: AppFonts.mont,
                      color: Palette.neutralWhite,
                    ),
                  ),
                ],
              ),
            )
          : CountdownTimer(
              onEnd: () {
                switchTime.value = true;
              },
              endTime: DateTime.now().millisecondsSinceEpoch + (4000 * 1000),
              widgetBuilder: (context, time) {
                return RichText(
                  text: TextSpan(
                    text: ' ${(time!.hours ?? 00).toString().padLeft(2, '0')}',
                    style: TextStyle(
                      fontSize: 48.sp,
                      fontFamily: AppFonts.uni,
                      color: Palette.neutralWhite,
                    ),
                    children: [
                      TextSpan(
                        text: 'H   ',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: AppFonts.mont,
                          color: Palette.neutralWhite,
                        ),
                      ),
                      TextSpan(
                        text: (time.min ?? 00).toString().padLeft(2, '0'),
                        style: GoogleFonts.unicaOne(
                          textStyle: TextStyle(
                            fontSize: 48.sp,
                            color: Palette.neutralWhite,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: 'M   ',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize: 14.sp,
                            color: Palette.neutralWhite,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: (time.sec ?? 00).toString().padLeft(2, '0'),
                        style: GoogleFonts.unicaOne(
                          textStyle: TextStyle(
                            fontSize: 48.sp,
                            color: Palette.neutralWhite,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: 'M   ',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize: 14.sp,
                            color: Palette.neutralWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
