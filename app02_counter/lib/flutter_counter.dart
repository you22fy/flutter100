import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider<int>((ref) => 0);

class FlutterCounter extends ConsumerWidget {
  const FlutterCounter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 200,
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            16,
          ),
          border: Border.all(
            width: 1,
            color: Colors.grey.shade400,
          ),
          color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 32,
            ),
            child: Text(
              'Flutter Counter',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          Text(
            ref.watch(counterProvider).toString(),
            style: TextStyle(
              fontSize: 56,
              color: Colors.pink.shade700,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _OperationButton(
                iconData: Icons.add,
                onPressed: () {
                  ref.read(counterProvider.notifier).state += 1;
                },
              ),
              const SizedBox(
                width: 30,
              ),
              _OperationButton(
                iconData: Icons.remove,
                onPressed: () {
                  ref.read(counterProvider.notifier).state -= 1;
                },
                backgroundColor: Colors.white,
                borderColor: Colors.pink,
                opeCodeColor: Colors.pink,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _OperationButton extends ConsumerWidget {
  const _OperationButton({
    required this.iconData,
    required this.onPressed,
    this.backgroundColor = Colors.pink,
    this.opeCodeColor = Colors.white,
    this.borderColor = Colors.pink,
  });
  final IconData? iconData;
  final void Function()? onPressed;
  final Color backgroundColor;
  final Color opeCodeColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: backgroundColor,
          side: BorderSide(
            color: borderColor,
          )),
      onPressed: onPressed,
      child: Icon(
        iconData,
        color: opeCodeColor,
        size: 42,
      ),
    );
  }
}
