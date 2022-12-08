/// Map int to V extension.
extension MapIntVExtension<V> on Map<int, V> {
  /// Returns the proper [V] when the [threshold] is lower than or equal
  /// one of this Map [int] keys.
  V valueFromThreshold(
    int threshold, {
    required V defaultValue,
  }) {
    final value = this[threshold];
    if (value != null) return value;

    for (final entry in entries) {
      if (threshold <= entry.key) return entry.value;
    }

    return defaultValue;
  }
}
