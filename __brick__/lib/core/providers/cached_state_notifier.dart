import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// State notifier that caches the state in a [Hive] box
/// Example usage:
/// ```dart
/// final counterStateNotifierProvider = StateNotifierProvider<CounterStateNotifier, int>((ref) {
///   final box = Hive.box<int>('counter');
///
///   return CounterStateNotifier(
///     box: box,
///     cacheKey: 'counter',
///     initialState: box.get('counter') ?? 0,
///   );
/// });
///
/// class CounterStateNotifier extends CachedStateNotifier<int> {
///  CounterStateNotifier({
///     required super.box,
///     required super.cacheKey,
///     required super.initialState,
///   }) {
///    load();
///   }
///
///   void increment() {
///     state++;
///     save();
///    }
///
///   void decrement() {
///     state--;
///     save();
///   }
/// }
/// ```
abstract class CachedStateNotifier<T> extends StateNotifier<T> {
  CachedStateNotifier({
    required this.box,
    required this.cacheKey,
    required this.initialState,
  }) : super(initialState) {
    load();
  }

  /// [Hive] Box for storing the state
  ///
  /// Don't forget to register the adapter for the state
  ///
  /// Don't forget to open box before passing it to the constructor
  @protected
  final Box<T> box;

  /// Key for storing the state in the box
  @protected
  final String cacheKey;

  /// Initial state for the state notifier
  @protected
  final T initialState;

  /// Save the state to the box
  @protected
  Future<void> save() async {
    await box.put(cacheKey, state);
  }

  /// Load the state from the box
  @protected
  Future<void> load() async {
    final cachedState = box.get(cacheKey);

    if (cachedState != null) {
      state = cachedState;
    }
  }

  void clear() {
    state = initialState;
    box.clear();
  }
}
