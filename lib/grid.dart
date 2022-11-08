import 'dart:math';

import 'package:christmas_lights_kata/led.dart';

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

  /// Toggles all [Led]s from [start] to [end] positions.
  void toggle(Point<int> start, Point<int> end) {}

  @override
  String toString() => leds.map((row) => row.join()).join('\n');
}
