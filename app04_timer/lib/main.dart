import 'package:app04_timer/provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

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
  const MyTimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTimer = ref.watch(timerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              DateFormat.Hms().format(currentTimer),
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
            )
          ],
        ),
      ),
    );
  }
}
