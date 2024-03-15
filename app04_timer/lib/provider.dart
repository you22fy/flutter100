import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final timerProvider = StateNotifierProvider<TimerNotifier, DateTime>((ref) {
  return TimerNotifier();
});

class TimerNotifier extends StateNotifier<DateTime> {
  TimerNotifier() : super(DateTime.utc(0, 0, 0));
  var timer = Timer(Duration.zero, () {});
  void start() {
    timer.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state = state.add(
        const Duration(seconds: 1),
      );
    });
  }

  void pause() {
    timer.cancel();
  }

  void reset() {
    timer.cancel();
    state = DateTime.utc(0, 0, 0);
  }
}
