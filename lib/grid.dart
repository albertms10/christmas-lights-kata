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

  /// The two-dimensional matriz of [Led]s.
  late final List<List<Led>> leds;

  /// Toggles all [Led]s from [start] to [end] range.
  void toggle(List<int> start, List<int> end) {
    assert(
      start.length == 2 && end.length == 2,
      'Start and end must be coordinates tuples.',
    );
    assert(
      start.every(_inRange(size)) && end.every(_inRange(size)),
      'Start and end must be in the grid range.',
    );
  }

  @override
  String toString() => leds.map((row) => row.join()).join('\n');
}

bool Function(int) _inRange(int max) => (index) => index >= 0 && index <= max;
