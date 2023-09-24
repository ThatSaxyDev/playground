//! THIS FILE CONTAINS THE SERVICE FOR HANDLING USER SESSIONS, BASED ON USER ACTIVITY
//! NO ACTIVITY FOR 15 MINUTES AUTOMATICALLY FIRES THE LOGOUT FUNCTION.

import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getlinked/shared/app_extensions.dart';

StateNotifierProvider<TimerService, int> timerServiceProvider =
    StateNotifierProvider((ref) {
  return TimerService();
});

class TimerService extends StateNotifier<int> {
  TimerService() : super(0);

  Timer? _timer;
  AudioPlayer player = AudioPlayer();

  void countTime({
    required BuildContext context,
    required int limit,
    void Function()? sideEffect,
  }) {
    if (state == 0) state = limit;
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        _timer = timer;
        state--;
        "time in seconds: $state".logg();
        if (state == 0) {
          'time limit reached'.logg();
          timer.cancel();
          sideEffect!.call();
          player.play(AssetSource('sounds/alarm.wav'));
          state = 0;
        }
      },
    );
  }

  //! set counter to zero and cancel the timer
  void resetTime() {
    _timer!.cancel();
    state = 0;
  }

  //! pause counter
  void pauseTimer() {
    _timer!.cancel();
  }

  //! set counter to zero
  void resetTimerState() {
    state = 0;
  }
}

//!
class AnimatedIconn extends ConsumerStatefulWidget {
  final AnimatedIconData animatedIcon;
  final double? size;
  final Color? color;
  const AnimatedIconn({
    super.key,
    required this.animatedIcon,
    this.size,
    this.color,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AnimatedIconnState();
}

class _AnimatedIconnState extends ConsumerState<AnimatedIconn>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )
      ..forward()
      ..repeat(reverse: true);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedIcon(
          color: widget.color,
          icon: widget.animatedIcon,
          progress: animation,
          size: widget.size,
          semanticLabel: 'Show menu',
        ),
      ),
    );
  }
}
