/// Map int to V extension.
extension MapIntVExtension<V> on Map<int, V> {
  /// Returns the corresponding value [V], if any, when the [threshold] is
  /// lower than or equal to one of this [Map] keys.
  V? valueFromThreshold(int threshold) {
    final value = this[threshold];
    if (value != null) return value;

    for (final entry in entries) {
      if (threshold <= entry.key) return entry.value;
    }

    return null;
  }
}
