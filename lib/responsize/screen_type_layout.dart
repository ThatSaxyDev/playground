// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ScreenTypeLayoutWrapper extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;
  const ScreenTypeLayoutWrapper({
    Key? key,
    required this.mobile,
    this.tablet,
    this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ScreenTypeLayout.builder(
        breakpoints: const ScreenBreakpoints(desktop: 400, tablet: 400, watch: 100),
        mobile: (BuildContext context) => mobile,
        tablet: (BuildContext context) => tablet ?? mobile,
        desktop: (BuildContext context) => desktop ?? mobile,
      );
}
