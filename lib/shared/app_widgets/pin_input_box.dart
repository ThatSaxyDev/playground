// import 'package:payscore/theme/palette.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pinput/pinput.dart';

// class PinInputBox extends StatelessWidget {
//   final void Function(String)? onCompleted;
//   final void Function(String)? onChanged;
//   final TextEditingController? controller;
//   const PinInputBox({
//     Key? key,
//     this.onCompleted,
//     this.controller,
//     this.onChanged,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Pinput(
//       onChanged: onChanged,
//       length: 6,
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       // obscuringCharacter: '*',
//       obscureText: false,
//       useNativeKeyboard: true,
//       autofocus: true,
//       defaultPinTheme: PinTheme(
//         width: 47.h,
//         height: 44.h,
//         textStyle: TextStyle(
//           fontSize: 16.sp,
//           color: Palette.neutralBlack,
//           fontWeight: FontWeight.w700,
//         ),
//         decoration: BoxDecoration(
//           border: Border.all(color: const Color(0xFFCBD2E0)),
//           color: Colors.transparent,
//           borderRadius: BorderRadius.circular(6.r),
//         ),
//       ),
//       focusedPinTheme: PinTheme(
//         width: 47.h,
//         height: 44.h,
//         textStyle: TextStyle(
//           fontSize: 16.sp,
//           color: Palette.neutralBlack,
//           fontWeight: FontWeight.w700,
//         ),
//         decoration: BoxDecoration(
//           border: Border.all(color: Palette.neutralBlack),
//           color: Colors.transparent,
//           borderRadius: BorderRadius.circular(6.r),
//         ),
//       ),
//       submittedPinTheme: PinTheme(
//         width: 47.h,
//         height: 44.h,
//         textStyle: TextStyle(
//           fontSize: 16.sp,
//           color: Palette.neutralBlack,
//           fontWeight: FontWeight.w700,
//         ),
//         decoration: BoxDecoration(
//           border: Border.all(color: Palette.neutralBlack),
//           color: Colors.transparent,
//           borderRadius: BorderRadius.circular(6.r),
//         ),
//       ),
//       controller: controller,
//       onCompleted: onCompleted,
//     );
//   }
// }
