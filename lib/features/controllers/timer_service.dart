//! THIS FILE CONTAINS THE SERVICE FOR HANDLING USER SESSIONS, BASED ON USER ACTIVITY
//! NO ACTIVITY FOR 15 MINUTES AUTOMATICALLY FIRES THE LOGOUT FUNCTION.

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getlinked/shared/app_extensions.dart';

StateNotifierProvider<TimerService, int> timerServiceProvider =
    StateNotifierProvider((ref) {
  return TimerService(ref: ref);
});

class TimerService extends StateNotifier<int> {
  final Ref _ref;
  TimerService({required Ref ref})
      : _ref = ref,
        super(0);

  Timer? _timer;

  void countTime({
    required BuildContext context,
    required int limit,
  }) {
    state = limit;
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        _timer = timer;
        state--;
        "time in seconds: $state".logg();
        if (state == 0) {
          'time limit reached'.logg();
          timer.cancel();
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

  //! set counter to zero
  void resetTimerState() {
    state = 0;
  }
}
