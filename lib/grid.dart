import 'dart:math';

import 'package:christmas_lights_kata/led.dart';

/// A squared grid of LEDs.
class Grid {
  /// Constructs a new [Grid] from [size].
  Grid(this.size)
      : assert(size > 0, 'Size must be positive'),
        leds = [
          for (var x = 0; x < size; x++) [for (var y = 0; y < size; y++) Led()],
        ];

  /// The size of this [Grid].
  final int size;

  /// The two-dimensional matrix of [Led]s.
  late final List<List<Led>> leds;

  /// Turns on all [Led]s from [start] to [end] positions, inclusive.
  void turnOn(Point<int> start, Point<int> end) {
    for (var x = start.x; x <= end.x; x++) {
      for (var y = start.y; y <= end.y; y++) {
        leds[x][y].turnOn();
      }
    }
  }

  /// Turns off all [Led]s from [start] to [end] positions, inclusive.
  void turnOff(Point<int> start, Point<int> end) {
    for (var x = start.x; x <= end.x; x++) {
      for (var y = start.y; y <= end.y; y++) {
        leds[x][y].turnOff();
      }
    }
  }

  /// Toggles all [Led]s from [start] to [end] positions, inclusive.
  void toggle(Point<int> start, Point<int> end) {
    for (var x = start.x; x <= end.x; x++) {
      for (var y = start.y; y <= end.y; y++) {
        leds[x][y].toggle();
      }
    }
  }

  /// Returns the number of powered [Led]s in the [Grid].
  int get poweredLeds => leds.fold<int>(
        0,
        (count, row) => count + row.where((led) => led.isPowered).length,
      );

  @override
  String toString() => leds.map((row) => row.join()).join('\n');
}
