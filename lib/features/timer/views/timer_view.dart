// ignore_for_file: deprecated_member_use

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getlinked/features/controllers/timer_service.dart';
import 'package:getlinked/features/timer/widgets/theme_switcher.dart';
import 'package:getlinked/shared/app_constants.dart';
import 'package:getlinked/shared/app_extensions.dart';
import 'package:getlinked/shared/app_fonts.dart';
import 'package:getlinked/shared/app_widgets/button.dart';
import 'package:getlinked/theme/palette.dart';

class TimerView extends ConsumerStatefulWidget {
  const TimerView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TimerViewState();
}

class _TimerViewState extends ConsumerState<TimerView> {
  ValueNotifier<bool> isPaused = false.notifier;
  List<int> listOfIntegers = List<int>.generate(60, (int index) => index);
  List<int> listOfIntegersHours = List<int>.generate(24, (int index) => index);
  ValueNotifier<int> selectedSecondsValue = ValueNotifier(0);
  ValueNotifier<int> selectedMinsValue = ValueNotifier(10);
  ValueNotifier<int> selectedHrsValue = ValueNotifier(0);

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
                height: height(context) * 0.69,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ThemeSwitcher(),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Expanded(
                      child: Center(
                        child: AutoSizeText.rich(
                          TextSpan(
                            text: (timeFromState ~/ 3600)
                                .toString()
                                .padLeft(2, '0'),
                            style: const TextStyle(
                              fontSize: 210,
                              fontFamily: AppFonts.uni,
                            ),
                            children: [
                              const TextSpan(
                                text: 'HOURS  ',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: AppFonts.clash,
                                ),
                              ),
                              TextSpan(
                                text: ((timeFromState % 3600) ~/ 60)
                                    .toString()
                                    .padLeft(2, '0'),
                                style: const TextStyle(
                                  fontSize: 210,
                                  fontFamily: AppFonts.uni,
                                ),
                              ),
                              const TextSpan(
                                text: 'MINS  ',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: AppFonts.clash,
                                ),
                              ),
                              TextSpan(
                                text: (timeFromState % 60)
                                    .toString()
                                    .padLeft(2, '0'),
                                style: const TextStyle(
                                  fontSize: 210,
                                  fontFamily: AppFonts.uni,
                                ),
                              ),
                              const TextSpan(
                                text: 'SECS  ',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: AppFonts.clash,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedButton(
                            isLoading: timeFromState != 0,
                            onTap: () {
                              ref.read(timerServiceProvider.notifier).countTime(
                                    context: context,
                                    limit: ((selectedHrsValue.value * 3600) +
                                        (selectedMinsValue.value * 60) +
                                        selectedSecondsValue.value),
                                    sideEffect: () {
                                      showDialog<void>(
                                        context: context,
                                        barrierDismissible: true,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text(
                                              'Time Up!',
                                              style: TextStyle(
                                                  fontFamily: AppFonts.clash,
                                                  fontSize: 30),
                                            ),
                                            content:
                                                const SingleChildScrollView(
                                              child: ListBody(
                                                children: <Widget>[
                                                  Text(
                                                    'The break is over, let\'s get back to work',
                                                    style: TextStyle(
                                                      fontFamily: AppFonts.mont,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                child: const Text(
                                                  'Ok',
                                                  style: TextStyle(
                                                    fontFamily: AppFonts.mont,
                                                    fontSize: 15,
                                                    color: Colors.redAccent
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  );
                            },
                            height: 45,
                            width: 100,
                            radius: 7,
                            loadingWidth: 0,
                            content: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Center(
                                child: Text(
                                  'Start',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: currentTheme.backgroundColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          isPaused.sync(
                            builder: (context, value, child) => AnimatedButton(
                              margin: const EdgeInsets.only(right: 10),
                              isLoading: timeFromState == 0,
                              onTap: () {
                                isPaused.value = !isPaused.value;
                                if (!isPaused.value) {
                                  ref
                                      .read(timerServiceProvider.notifier)
                                      .countTime(context: context, limit: 100);
                                } else {
                                  ref
                                      .read(timerServiceProvider.notifier)
                                      .pauseTimer();
                                }
                              },
                              height: 45,
                              width: 100,
                              radius: 7,
                              loadingWidth: 0,
                              content: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Center(
                                  child: Text(
                                    isPaused.value ? 'Resume' : 'Pause',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: currentTheme.backgroundColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          BButton(
                            onTap: () {
                              ref
                                  .read(timerServiceProvider.notifier)
                                  .resetTime();
                            },
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
                    ),
                    AnimatedContainer(
                      duration: 500.ms,
                      color: currentTheme.backgroundColor,
                      width: (timeFromState /
                              ((selectedHrsValue.value * 3600) +
                                  (selectedMinsValue.value * 60) +
                                  selectedSecondsValue.value)) *
                          width(context),
                    ),
                  ],
                ),
              ),
              AnimatedContainer(
                duration: 500.ms,
                height: height(context) * 0.3,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    SizedBox(
                      width: width(context) * 0.6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              'HOURS'.txt(
                                  size: 18,
                                  fontFamily: AppFonts.clash,
                                  fontW: F.w5),
                              const SizedBox(width: 10),
                              selectedHrsValue.sync(
                                builder: (context, value, child) => Dropd(
                                  listOfIntegers: listOfIntegersHours,
                                  currentTheme: currentTheme,
                                  selectedSecondsValue: selectedHrsValue,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              'MINS'.txt(
                                  size: 18,
                                  fontFamily: AppFonts.clash,
                                  fontW: F.w5),
                              const SizedBox(width: 10),
                              selectedMinsValue.sync(
                                builder: (context, value, child) => Dropd(
                                  listOfIntegers: listOfIntegers,
                                  currentTheme: currentTheme,
                                  selectedSecondsValue: selectedMinsValue,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              'SECS'.txt(
                                  size: 18,
                                  fontFamily: AppFonts.clash,
                                  fontW: F.w5),
                              const SizedBox(width: 10),
                              selectedSecondsValue.sync(
                                builder: (context, value, child) => Dropd(
                                  listOfIntegers: listOfIntegers,
                                  currentTheme: currentTheme,
                                  selectedSecondsValue: selectedSecondsValue,
                                ),
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
          ),
        ),
      ),
    );
  }
}

class Dropd extends StatelessWidget {
  final List<int> listOfIntegers;
  final ThemeData currentTheme;
  final ValueNotifier<int> selectedSecondsValue;
  const Dropd({
    super.key,
    required this.listOfIntegers,
    required this.currentTheme,
    required this.selectedSecondsValue,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<int>(
        isExpanded: true,
        hint: const Row(
          children: [
            Icon(
              Icons.list,
              size: 16,
              color: Colors.yellow,
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                'Select Item',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: listOfIntegers
            .map((int item) => DropdownMenuItem<int>(
                  value: item,
                  child: Text(
                    item.toString().padLeft(2, '0'),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: currentTheme.backgroundColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        value: selectedSecondsValue.value,
        onChanged: (value) {
          selectedSecondsValue.value = value!;
        },
        buttonStyleData: ButtonStyleData(
          height: 35,
          width: 65,
          padding: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: currentTheme.textTheme.bodyMedium!.color,
          ),
        ),
        iconStyleData: IconStyleData(
          icon: const Icon(
            Icons.keyboard_arrow_down_outlined,
          ),
          iconEnabledColor: currentTheme.backgroundColor,
          iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 250,
          width: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: currentTheme.textTheme.bodyMedium!.color,
          ),
          offset: const Offset(0, 0),
          scrollbarTheme: ScrollbarThemeData(
            thumbColor: MaterialStateProperty.all(currentTheme.backgroundColor),
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all(6),
            thumbVisibility: MaterialStateProperty.all(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}
