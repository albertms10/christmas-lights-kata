import 'dart:math';

import 'package:christmas_lights_kata/powerable_led.dart';

/// A squared grid of LEDs.
class Grid {
  /// Constructs a new [Grid] from [size].
  Grid(this.size)
      : assert(size > 0, 'Size must be positive'),
        leds = [
          for (var x = 0; x < size; x++)
            [for (var y = 0; y < size; y++) PowerableLed()],
        ];

  /// The size of this [Grid].
  final int size;

  /// The two-dimensional matrix of [PowerableLed]s.
  late final List<List<PowerableLed>> leds;

  /// Turns on all [PowerableLed]s from [start] to [end] positions.
  void turnOn(Point<int> start, Point<int> end) =>
      _actOnLedsFrom(start, end, (led) => led.turnOn());

  /// Turns off all [PowerableLed]s from [start] to [end] positions.
  void turnOff(Point<int> start, Point<int> end) =>
      _actOnLedsFrom(start, end, (led) => led.turnOff());

  /// Toggles all [PowerableLed]s from [start] to [end] positions.
  void toggle(Point<int> start, Point<int> end) =>
      _actOnLedsFrom(start, end, (led) => led.toggle());

  void _actOnLedsFrom(
    Point<int> start,
    Point<int> end,
    void Function(PowerableLed led) action,
  ) {
    for (var x = start.x; x <= end.x; x++) {
      for (var y = start.y; y <= end.y; y++) {
        action(leds[y][x]);
      }
    }
  }

  /// Returns the number of powered [PowerableLed]s in the [Grid].
  int get poweredLedsCount => leds.fold<int>(
        0,
        (count, row) => count + row.where((led) => led.isPowered).length,
      );

  @override
  String toString() => leds.map((row) => row.join()).join('\n');
}
