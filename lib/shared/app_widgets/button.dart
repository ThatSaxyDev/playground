// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:getlinked/shared/app_extensions.dart';
import 'package:getlinked/theme/palette.dart';

class BButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? radius;
  final void Function()? onTap;
  final Color? color;
  final Widget? item;
  final String? text;
  final bool isText;
  final Color? textColor;
  final bool showBorder;
  final Gradient? gradient;
  const BButton({
    Key? key,
    this.height,
    this.width,
    this.fontSize,
    this.fontWeight,
    this.radius,
    required this.onTap,
    this.color,
    this.item,
    this.text,
    this.isText = true,
    this.textColor,
    this.showBorder = false,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 61.h,
      width: width ?? double.infinity,
      decoration: ShapeDecoration(
        gradient: gradient ??
            const LinearGradient(
              begin: Alignment(-1.00, -0.00),
              end: Alignment(1, 0),
              colors: [
                Color(0xFF903AFF),
                Color(0xFFD434FE),
                Color(0xFFFF25B8),
                Color(0xFFFE34B9)
              ],
            ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
      ),
      child: Center(
        child: isText == true
            ? Text(text ?? '',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: fontSize ?? 14.sp,
                    fontWeight: fontWeight ?? FontWeight.w400,
                    color: textColor ?? Palette.neutralWhite,
                  ),
                ))
            : item,
      ),
    ).tap(onTap: onTap);
  }
}

class ArrowButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? radius;
  final void Function()? onTap;
  final Color? color;
  final Widget? item;
  final String? text;
  final bool isText;
  final Color? textColor;
  const ArrowButton({
    Key? key,
    this.height,
    this.width,
    this.fontSize,
    this.radius,
    required this.onTap,
    this.color,
    this.item,
    this.text,
    this.isText = true,
    this.textColor,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 56.h,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? 12.r),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 21.w),
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: color ?? Palette.textPurple,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text ?? '',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: fontSize ?? 18.sp,
                    fontWeight: fontWeight ?? FontWeight.w500,
                    color: textColor ?? Palette.neutralWhite,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_rounded,
                color: Palette.neutralWhite,
                size: 24.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TransparentButton extends ConsumerWidget {
  final double? height;
  final double? width;
  final double? radius;
  final double? fontSize;
  final FontWeight? fontWeight;
  final void Function()? onTap;
  final Color? color;
  final Widget? item;
  final String? text;
  final bool isText;
  final Color? backgroundColor;
  final Color? textColor;
  const TransparentButton({
    Key? key,
    this.height,
    this.width,
    this.radius,
    required this.onTap,
    this.color,
    this.item,
    this.text,
    this.isText = true,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: height ?? 61.h,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.5,
              color: color ?? Palette.neutralWhite,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? 4.r),
            ),
          ),
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: backgroundColor ?? Colors.transparent,
          padding: EdgeInsets.zero,
        ),
        child: Center(
          child: isText == true
              ? Text(
                  text ?? '',
                  style: TextStyle(
                    fontSize: fontSize ?? 16.sp,
                    fontWeight: fontWeight ?? FontWeight.w500,
                    color: textColor ?? Palette.neutralWhite,
                  ),
                )
              : item,
        ),
      ),
    );
  }
}

// class AnimatedButton extends StatelessWidget {
//   final double? height;
//   final double width;
//   final double radius;
//   final void Function()? onTap;
//   final Widget content;
//   final Color? colour;
//   final BoxBorder? border;
//   const AnimatedButton({
//     Key? key,
//     this.height,
//     required this.width,
//     required this.radius,
//     this.onTap,
//     required this.content,
//     this.colour,
//     this.border,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 700),
//         curve: Curves.fastOutSlowIn,
//         height: height ?? 61.h,
//         width: width,
//         decoration: BoxDecoration(
//             color: colour ?? Palette.blueColor,
//             borderRadius: BorderRadius.circular(radius),
//             border: border),
//         child: Center(child: content),
//       ),
//     );
//   }
// }

class AnimatedButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? loadingWidth;
  final double? radius;
  final void Function()? onTap;
  final Widget content;
  final Color? color;
  final BoxBorder? border;
  final bool isLoading;
  const AnimatedButton({
    Key? key,
    this.height,
    this.loadingWidth,
    this.width,
    this.radius,
    this.onTap,
    required this.content,
    this.color,
    this.border,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 700),
        curve: Curves.fastOutSlowIn,
        height: height ?? 61.h,
        width: isLoading
            ? switch (loadingWidth == null) {
                true => 61.w,
                false => loadingWidth,
              }
            : switch (width == null) {
                true => 370.w,
                false => width,
              },
        decoration: BoxDecoration(
            color: color ?? Palette.textPurple,
            borderRadius: BorderRadius.circular(
              isLoading
                  ? switch (loadingWidth == null) {
                      true => 61.w,
                      false => loadingWidth!,
                    }
                  : switch (width == null) {
                      true => 5.r,
                      false => radius!,
                    },
            ),
            border: border),
        child: Center(
            child: isLoading
                ? const CircularProgressIndicator(
                    color: Palette.neutralWhite,
                  )
                : content),
      ),
    );
  }
}

class TTransparentButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? padding;
  final void Function()? onTap;
  final Color color;
  final Widget child;
  const TTransparentButton({
    Key? key,
    this.height,
    this.width,
    this.padding,
    required this.onTap,
    required this.color,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33.3.h,
      width: 40.w,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: color,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(5.r),
              ),
            ),
            elevation: 0,
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            padding: EdgeInsets.symmetric(
              vertical: padding ?? 0,
            )),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
