import 'package:app04_timer/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_picker/picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyTimerPage(),
    );
  }
}

class MyTimerPage extends HookConsumerWidget {
  const MyTimerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTimer = ref.watch(timerProvider);
    final setTime = useState<DateTime>(DateTime.utc(0, 0, 0));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                Picker(
                  adapter: DateTimePickerAdapter(
                    type: PickerDateTimeType.kHMS,
                    customColumnType: [3, 4, 5],
                    value: DateTime.utc(1900, 1, 1, 0, 0, 0), // 無理やり初期値を設定
                  ),
                  title: const Text("時間を入力してください"),
                  onConfirm: (Picker picker, List value) {
                    ref.read(timerProvider.notifier).setTimer(
                        DateTime.utc(0, 0, 0, value[0], value[1], value[2]));
                    setTime.value =
                        DateTime.utc(0, 0, 0, value[0], value[1], value[2]);
                  },
                ).showModal(context);
              },
              child: SizedBox(
                width: 150,
                height: 150,
                child: CustomPaint(
                  painter: ProgressPainter(
                    progress: setTime.value.second == 0
                        ? 1
                        : currentTimer.second / setTime.value.second,
                  ),
                  child: Center(
                    child: Text(
                      DateFormat.Hms().format(currentTimer),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: const Text('スタート'),
                  onPressed: () => ref.read(timerProvider.notifier).start(),
                ),
                TextButton(
                  child: const Text('停止'),
                  onPressed: () => ref.read(timerProvider.notifier).pause(),
                ),
                TextButton(
                  child: const Text('リセット'),
                  onPressed: () => ref.read(timerProvider.notifier).reset(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressPainter extends CustomPainter {
  final double progress;

  ProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);

    paint.color = Colors.deepPurple;
    double progressAngle = 2 * math.pi * progress;
    canvas.drawArc(
      Rect.fromCenter(
          center: size.center(Offset.zero),
          width: size.width,
          height: size.height),
      -math.pi / 2,
      progressAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
