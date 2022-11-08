import 'dart:html';

import 'package:christmas_lights_kata/led.dart';
import 'package:christmas_lights_kata/utils/point_bounds_extension.dart';

/// A squared grid of LEDs.
class Grid {
  /// Constructs a new [Grid] from [size].
  Grid(this.size)
      : assert(size > 0, 'Size must be positive'),
        leds = [
          for (var x = 0; x < size; x++)
            [for (var y = 0; y < size; y++) Led(x, y)],
        ];

  /// The size of this [Grid].
  final int size;

  /// The two-dimensional matrix of [Led]s.
  late final List<List<Led>> leds;

  /// Minimum grid boundary position.
  final min = const Point(0, 0);

  /// Maximum grid boundary position.
  late final max = Point(size - 1, size - 1);

  /// Toggles all [Led]s from [start] to [end] range.
  void toggle(Point<int> start, Point<int> end) {
    if (!start.inBounds(min, max)) {
      throw ArgumentError.value(start, 'start', 'Start must be in bounds.');
    }
    if (!end.inBounds(min, max)) {
      throw ArgumentError.value(end, 'end', 'End must be in bounds.');
    }
  }

  @override
  String toString() => leds.map((row) => row.join()).join('\n');
}
