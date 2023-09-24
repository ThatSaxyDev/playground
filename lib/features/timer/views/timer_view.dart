// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getlinked/features/controllers/timer_service.dart';
import 'package:getlinked/features/timer/widgets/theme_switcher.dart';
import 'package:getlinked/shared/app_constants.dart';
import 'package:getlinked/shared/app_extensions.dart';
import 'package:getlinked/shared/app_fonts.dart';
import 'package:getlinked/shared/app_widgets/button.dart';
import 'package:getlinked/shared/app_widgets/click_button.dart';
import 'package:getlinked/shared/app_widgets/custom_flex.dart';
import 'package:getlinked/theme/palette.dart';

class TimerView extends ConsumerStatefulWidget {
  const TimerView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TimerViewState();
}

class _TimerViewState extends ConsumerState<TimerView> {
  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = ref.watch(themeNotifierProvider);
    int timeFromState = ref.watch(timerServiceProvider);
    return Scaffold(
      backgroundColor: currentTheme.backgroundColor,
      body: SizedBox(
        height: height(context),
        width: width(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AnimatedContainer(
                duration: 500.ms,
                height: height(context) * 0.59,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(width: 100),
                        const ThemeSwitcher(),
                        BButton(
                          onTap: () {},
                          height: 45,
                          width: 100,
                          text: 'Expand',
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    Expanded(
                      child: '00:00:${timeFromState.toString().padLeft(2, '0')}'
                          .txt(
                              size: 150, fontFamily: AppFonts.uni, maxLines: 1),
                    ),
                    Center(
                      child: CustomizableRow(
                        flexValues: const [2, 1, 2],
                        children: [
                          'HOURS '
                              .txta(
                                size: 15,
                                fontFamily: AppFonts.clash,
                                maxLines: 1,
                              )
                              .alignCenterRight(),
                          'MINUTES'
                              .txta(
                                size: 15,
                                fontFamily: AppFonts.clash,
                                maxLines: 1,
                              )
                              .alignCenter(),
                          'SECONDS'
                              .txta(
                                size: 15,
                                fontFamily: AppFonts.clash,
                                maxLines: 1,
                              )
                              .alignCenterLeft(),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BButton(
                            onTap: () {
                              ref
                                  .read(timerServiceProvider.notifier)
                                  .countTime(context: context, limit: 10);
                            },
                            height: 45,
                            width: 100,
                            text: timeFromState == 0 ? 'Start' : 'Pause',
                          ),
                          const SizedBox(width: 30),
                          BButton(
                            onTap: () {},
                            height: 45,
                            width: 100,
                            text: 'Reset',
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height(context) * 0.01,
                child: Stack(
                  children: [
                    Container(
                      width: width(context),
                      color: currentTheme.textTheme.bodyMedium!.color,
                    ).alignCenterLeft(),
                  ],
                ),
              ),
              AnimatedContainer(
                duration: 500.ms,
                height: height(context) * 0.4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
