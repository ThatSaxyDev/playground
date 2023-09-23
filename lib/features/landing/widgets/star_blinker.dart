// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:getlinked/shared/app_extensions.dart';

class StarBlinker extends StatefulWidget {
  final double? height;
  final double? opacity;
  final Color? color;
  final String? icon;
  const StarBlinker({
    Key? key,
    this.height,
    this.opacity,
    this.color,
    this.icon,
  }) : super(key: key);

  @override
  State<StarBlinker> createState() => _StarBlinkerState();
}

class _StarBlinkerState extends State<StarBlinker> {
  ValueNotifier<double> starOpacity = 1.0.notifier;
  Random random = Random();

  @override
  void initState() {
    super.initState();
    startBlinking();
  }

  void startBlinking() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      starOpacity.value = random.nextDouble() > 0.5 ? 1.0 : 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return starOpacity.sync(
      builder: (context, value, child) => AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: widget.opacity ?? starOpacity.value,
        child: Image.asset(
          (widget.icon ?? 'star').png,
          height: widget.height,
          color: widget.color,
        ),
      ),
    );
  }
}
