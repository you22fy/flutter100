
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Button extends HookConsumerWidget {
  const Button._({
    required this.label,
    required this.onPressed,
    required this.isSquare,
    this.isSelected = false,
  });

  factory Button.square({
    required String label,
    required void Function()? onPressed,
    bool isSelected = false,
  }) {
    return Button._(
      label: label,
      onPressed: onPressed,
      isSquare: true,
      isSelected: isSelected,
    );
  }

  factory Button.rectangle({
    required String label,
    required void Function()? onPressed,
    bool isSelected = false,
  }) {
    return Button._(
      label: label,
      onPressed: onPressed,
      isSquare: false,
      isSelected: isSelected,
    );
  }

  final String label;
  final void Function()? onPressed;
  final bool isSquare;
  final bool isSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: MediaQuery.of(context).size.width / 8,
        width: isSquare
            ? MediaQuery.of(context).size.width / 8
            : MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(
            color: isSelected ? Colors.black : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
            ),
          ),
        ),
      ),
    );
  }
}
