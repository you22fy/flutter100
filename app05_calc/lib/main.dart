import 'package:app05_calc/provider.dart';
import 'package:app05_calc/type/operator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'components/button.dart';
import 'components/display.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalcApp(),
    );
  }
}

class CalcApp extends HookConsumerWidget {
  const CalcApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final operator = useState<Operator?>(null);
    final input = useState<String>('');

    final displayValue = input.value == ''
        ? ref.watch(calculatorControllerProvider).displayValue
        : input.value;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ColoredBox(
          color: Colors.grey[200]!,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Display(displayValue),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button.square(
                    label: '7',
                    onPressed: () {
                      input.value += '7';
                    },
                  ),
                  const SizedBox(width: 16),
                  Button.square(
                    label: '8',
                    onPressed: () {
                      input.value += '8';
                    },
                  ),
                  const SizedBox(width: 16),
                  Button.square(
                    label: '9',
                    onPressed: () {
                      input.value += '9';
                    },
                  ),
                  const SizedBox(width: 16),
                  Button.square(
                    label: '+',
                    onPressed: () {
                      operator.value = Operator.add;
                      ref
                          .read(calculatorControllerProvider.notifier)
                          .update(operator.value!, input.value);
                      input.value = '';
                    },
                    isSelected: operator.value == Operator.add,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button.square(
                    label: '4',
                    onPressed: () {
                      input.value += '4';
                    },
                  ),
                  const SizedBox(width: 16),
                  Button.square(
                    label: '5',
                    onPressed: () {
                      input.value += '5';
                    },
                  ),
                  const SizedBox(width: 16),
                  Button.square(
                    label: '6',
                    onPressed: () {
                      input.value += '6';
                    },
                  ),
                  const SizedBox(width: 16),
                  Button.square(
                    label: '-',
                    onPressed: () {
                      operator.value = Operator.sub;
                      ref
                          .read(calculatorControllerProvider.notifier)
                          .update(operator.value!, input.value);
                      input.value = '';
                    },
                    isSelected: operator.value == Operator.sub,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button.square(
                    label: '1',
                    onPressed: () {
                      input.value += '1';
                    },
                  ),
                  const SizedBox(width: 16),
                  Button.square(
                    label: '2',
                    onPressed: () {
                      input.value += '2';
                    },
                  ),
                  const SizedBox(width: 16),
                  Button.square(
                    label: '3',
                    onPressed: () {
                      input.value += '3';
                    },
                  ),
                  const SizedBox(width: 16),
                  Button.square(
                    label: '*',
                    onPressed: () {
                      operator.value = Operator.mul;
                      ref
                          .read(calculatorControllerProvider.notifier)
                          .update(operator.value!, input.value);
                      input.value = '';
                    },
                    isSelected: operator.value == Operator.mul,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button.square(
                    label: '0',
                    onPressed: () {
                      input.value += '0';
                    },
                  ),
                  const SizedBox(width: 16),
                  Button.square(
                    label: '/',
                    onPressed: () {
                      operator.value = Operator.div;
                      ref
                          .read(calculatorControllerProvider.notifier)
                          .update(operator.value!, input.value);
                      input.value = '';
                    },
                    isSelected: operator.value == Operator.div,
                  ),
                  const SizedBox(width: 16),
                  Button.square(
                    label: '.',
                    onPressed: () {
                      input.value += '.';
                    },
                  ),
                  const SizedBox(width: 16),
                  Button.square(
                    label: '=',
                    onPressed: () {
                      operator.value = Operator.equal;
                      ref
                          .read(calculatorControllerProvider.notifier)
                          .update(operator.value!, input.value);
                      input.value = '';
                    },
                    isSelected: operator.value == Operator.equal,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Button.rectangle(
                label: 'Clear',
                onPressed: () {
                  input.value = '';
                  operator.value = null;
                  ref.read(calculatorControllerProvider.notifier).clear();
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
