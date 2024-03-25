import 'package:app05_calc/type/operator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final calculatorControllerProvider =
    StateNotifierProvider<CalculatorController, CalculateResult>(
        (ref) => CalculatorController());

class CalculateResult {
  final String displayValue; // 表示される値
  final double processingValue; // 計算処理待ちの値
  final Operator processingOperator; // 計算処理待ちの演算子
  final double resultValue; // 計算結果が入る.'='で確定する

  CalculateResult({
    this.displayValue = '',
    this.processingValue = 0,
    this.processingOperator = Operator.add,
    this.resultValue = 0,
  });

  CalculateResult copyWith({
    String? displayValue,
    double? processingValue,
    Operator? processingOperator,
    double? resultValue,
  }) {
    return CalculateResult(
      displayValue: displayValue ?? this.displayValue,
      processingValue: processingValue ?? this.processingValue,
      processingOperator: processingOperator ?? this.processingOperator,
      resultValue: resultValue ?? this.resultValue,
    );
  }
}

class CalculatorController extends StateNotifier<CalculateResult> {
  CalculatorController() : super(CalculateResult());

  void update(Operator op, String input) {
    final inputValue = _parseInput(input);
    final processingValue = state.processingValue;
    final processingOperator = state.processingOperator;
    final nextProcessingValue =
        _calculate(processingValue, inputValue, processingOperator);
    state = state.copyWith(
      displayValue: nextProcessingValue.toString(),
      processingValue: nextProcessingValue,
      processingOperator: op,
      resultValue: nextProcessingValue,
    );
  }

  void clear() {
    state = state.copyWith(
      displayValue: '',
      processingValue: 0,
      processingOperator: Operator.add,
      resultValue: 0,
    );
  }

  double _calculate(double val1, double val2, Operator op) {
    switch (op) {
      case Operator.add:
        return val1 + val2;
      case Operator.sub:
        return val1 - val2;
      case Operator.mul:
        return val1 * val2;
      case Operator.div:
        return val1 / val2;
      case Operator.equal:
        return val1;
    }
  }

  double _parseInput(String input) {
    try {
      final result = double.parse(input);
      return result;
    } catch (e) {
      return 0;
    }
  }
}
