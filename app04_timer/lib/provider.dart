import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
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
      state = state.subtract(
        const Duration(seconds: 1),
      );

      if (state == DateTime.utc(0, 0, 0)) {
        timer.cancel();
        _alert();
        state = DateTime.utc(0, 0, 0);
      }
    });
  }

  void pause() {
    timer.cancel();
  }

  void reset() {
    timer.cancel();
    state = DateTime.utc(0, 0, 0);
  }

  void setTimer(DateTime time) {
    state = time;
  }

  void _alert() {
    final player = AudioPlayer();
    player.play(AssetSource('assets/sounds/se.mp3'));
  }
}
