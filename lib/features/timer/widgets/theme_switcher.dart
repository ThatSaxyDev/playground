// ignore_for_file: deprecated_member_use

import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:getlinked/theme/palette.dart';

class ThemeSwitcher extends ConsumerWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData currentTheme = ref.watch(themeNotifierProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Light',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 10),
        InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () => ref.read(themeNotifierProvider.notifier).toggleTheme(),
          child: Container(
            height: 20,
            width: 40,
            decoration: BoxDecoration(
                color: currentTheme.textTheme.bodyMedium!.color,
                border: Border.all(
                  color: currentTheme.textTheme.bodyMedium!.color!,
                )),
            child: Stack(
              children: [
                AnimatedAlign(
                  curve: Curves.easeInOut,
                  alignment: ref.watch(themeNotifierProvider.notifier).mode ==
                          ThemeMode.dark
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  duration: 250.ms,
                  child: Container(
                    height: 20,
                    width: 20,
                    color: currentTheme.backgroundColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          'Dark',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
