// generaterバージョン
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_provider2.g.dart';

@riverpod
class Counter2 extends _$Counter2 {
  @override
  int build() => 0;

  void increment() => state++;

  void reset() => state = 0;
}
