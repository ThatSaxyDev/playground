// import 'package:connect/theme/palette.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// extension StyledTextExtension16 on String {
//   StyledText16 get txt16 => StyledText16(this);
// }

// class StyledText16 {
//   final String _text;

//   StyledText16(this._text);

//   Text f3({
//     double? size,
//     Color? color,
//     String? fontFamily,
//     FontStyle? fontStyle,
//     TextOverflow? overflow,
//     TextDecoration? decoration,
//     TextAlign? textAlign,
//     int? maxLines,
//     double? height,
//   }) {
//     return _getText(
//       fontWeight: FontWeight.w300,
//       size: size,
//       color: color,
//       fontFamily: fontFamily,
//       fontStyle: fontStyle,
//       overflow: overflow,
//       textAlign: textAlign,
//       maxLines: maxLines,
//       height: height,
//       decoration: decoration,
//     );
//   }

//   Text f4({
//    double? size,
//     Color? color,
//     String? fontFamily,
//     FontStyle? fontStyle,
//     TextOverflow? overflow,
//     TextDecoration? decoration,
//     TextAlign? textAlign,
//     int? maxLines,
//     double? height,
//   }) {
//     return _getText(
//       fontWeight: FontWeight.w400,
//       size: size,
//       color: color,
//       fontFamily: fontFamily,
//       fontStyle: fontStyle,
//       overflow: overflow,
//       textAlign: textAlign,
//       maxLines: maxLines,
//       height: height,
//       decoration: decoration,
//     );
//   }

//   Text f5({
//     double? size,
//     Color? color,
//     String? fontFamily,
//     FontStyle? fontStyle,
//     TextOverflow? overflow,
//     TextDecoration? decoration,
//     TextAlign? textAlign,
//     int? maxLines,
//     double? height,
//   }) {
//     return _getText(
//       fontWeight: FontWeight.w500,
//       size: size,
//       color: color,
//       fontFamily: fontFamily,
//       fontStyle: fontStyle,
//       overflow: overflow,
//       textAlign: textAlign,
//       maxLines: maxLines,
//       height: height,
//       decoration: decoration,
//     );
//   }

//   Text f6({
//     double? size,
//     Color? color,
//     String? fontFamily,
//     FontStyle? fontStyle,
//     TextOverflow? overflow,
//     TextDecoration? decoration,
//     TextAlign? textAlign,
//     int? maxLines,
//     double? height,
//   }) {
//     return _getText(
//       fontWeight: FontWeight.w600,
//       size: size,
//       color: color,
//       fontFamily: fontFamily,
//       fontStyle: fontStyle,
//       overflow: overflow,
//       textAlign: textAlign,
//       maxLines: maxLines,
//       height: height,
//       decoration: decoration,
//     );
//   }

//   Text f7({
//    double? size,
//     Color? color,
//     String? fontFamily,
//     FontStyle? fontStyle,
//     TextOverflow? overflow,
//     TextDecoration? decoration,
//     TextAlign? textAlign,
//     int? maxLines,
//     double? height,
//   }) {
//     return _getText(
//       fontWeight: FontWeight.w700,
//       size: size,
//       color: color,
//       fontFamily: fontFamily,
//       fontStyle: fontStyle,
//       overflow: overflow,
//       textAlign: textAlign,
//       maxLines: maxLines,
//       height: height,
//       decoration: decoration,
//     );
//   }

//   Text f8({
//     double? size,
//     Color? color,
//     String? fontFamily,
//     FontStyle? fontStyle,
//     TextOverflow? overflow,
//     TextDecoration? decoration,
//     TextAlign? textAlign,
//     int? maxLines,
//     double? height,
//   }) {
//     return _getText(
//       fontWeight: FontWeight.w800,
//       size: size,
//       color: color,
//       fontFamily: fontFamily,
//       fontStyle: fontStyle,
//       overflow: overflow,
//       textAlign: textAlign,
//       maxLines: maxLines,
//       height: height,
//       decoration: decoration,
//     );
//   }

//   Text _getText({
//     FontWeight? fontWeight,
//     double? size,
//     Color? color,
//     String? fontFamily,
//     FontStyle? fontStyle,
//     TextOverflow? overflow,
//     TextDecoration? decoration,
//     TextAlign? textAlign,
//     int? maxLines,
//     double? height,
//   }) {
//     return Text(
//       _text,
//       overflow: overflow,
//       textAlign: textAlign,
//       maxLines: maxLines,
//       style: TextStyle(
//         height: height,
//         fontSize: size ?? 16.sp,
//         color: color ?? Palette.blackColor,
//         fontWeight: fontWeight,
//         fontFamily: fontFamily,
//         fontStyle: fontStyle,
//         decoration: decoration,
//       ),
//     );
//   }
// }