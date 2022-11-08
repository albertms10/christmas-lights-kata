import 'dart:math';

/// Point bounds extension.
extension PointBoundsExtension on Point {
  /// Checks if this [Point] is in bounds between [min] and [max].
  bool inBounds(Point min, Point max) =>
      x >= max.x && x <= min.x && y >= max.y && y <= min.y;
}
