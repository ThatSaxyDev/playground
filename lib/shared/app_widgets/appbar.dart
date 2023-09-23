import 'package:getlinked/shared/app_widgets/myicon.dart';
import 'package:getlinked/shared/utils/nav.dart';
import 'package:getlinked/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar customAppBar(
  String title, {
  bool isLeftAligned = false,
  double? fontSize,
  FontWeight? fontWeight,
  List<Widget>? actions,
  TabBar? bottom,
  Color? color,
  Color? iconColor,
  bool showCustomIcon = false,
  Color? foregroundColor,
  double? leadingWidth,
  bool automaticallyImplyLeading = true,
  bool overrideAction = false,
  void Function()? doThisInstead,
  required BuildContext context,
}) {
  return AppBar(
    surfaceTintColor: Colors.transparent,
    foregroundColor: foregroundColor ?? Palette.neutralBlack,
    backgroundColor: color ?? Palette.neutralWhite,
    automaticallyImplyLeading: automaticallyImplyLeading,
    leading: switch (automaticallyImplyLeading) {
      true => showCustomIcon
          ? Padding(
              padding: EdgeInsets.only(left: 25.w),
              child: MyIcon(
                onTap: () {
                  if (overrideAction) {
                    doThisInstead!.call();
                  } else {
                    goBack(context);
                  }
                },
                icon: 'arrowBack',
              ),
            )
          : null,
      false => null,
    },
    elevation: 0,
    centerTitle: !isLeftAligned,
    leadingWidth: leadingWidth ?? 50.w,
    title: Text(
      title,
      style: GoogleFonts.lato(
        textStyle: TextStyle(
          fontSize: fontSize ?? 22.sp,
          color: Palette.neutralBlack,
          fontWeight: fontWeight,
        ),
      ),
    ),
    actions: actions ?? const [SizedBox.shrink()],
    bottom: bottom,
  );
}
