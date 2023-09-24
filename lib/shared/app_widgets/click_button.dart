// ignore_for_file: public_member_api_docs, sort_constructors_first, deprecated_member_use
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:getlinked/theme/palette.dart';

class ClickButton extends ConsumerStatefulWidget {
  final void Function()? onTap;
  final double? width;
  final double? height;
  final String text;
  final bool? isActive;
  const ClickButton({
    Key? key,
    this.onTap,
    this.width,
    this.height,
    required this.text,
    this.isActive = true,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ClickButtonState();
}

class _ClickButtonState extends ConsumerState<ClickButton> {
  final ValueNotifier<bool> clicked = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = ref.watch(themeNotifierProvider);
    return ValueListenableBuilder(
      valueListenable: clicked,
      child: const SizedBox.shrink(),
      builder: (context, value, child) {
        return InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            if (widget.isActive == true) {
              clicked.value = true;
              Timer(const Duration(milliseconds: 100), () {
                clicked.value = false;
                widget.onTap?.call();
              });
            }
          },
          child: Container(
            height: widget.height,
            width: widget.width ?? double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: currentTheme.textTheme.bodyMedium!.color!,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: clicked.value == true
                      ? Alignment.bottomCenter
                      : Alignment.topCenter,
                  child: Container(
                    height: widget.height! - 2,
                    width: widget.width ?? double.infinity,
                    decoration: BoxDecoration(
                      color: currentTheme.textTheme.bodyMedium!.color,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: currentTheme.backgroundColor,
                          offset: clicked.value == true
                              ? const Offset(0, 0)
                              : Offset(0, 5.h),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        widget.text,
                        style: TextStyle(
                          color: currentTheme.textTheme.bodyMedium!.color,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
