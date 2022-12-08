import 'dart:math';

import 'package:christmas_lights_kata/grid/grid.dart';
import 'package:christmas_lights_kata/led/powerable_led.dart';
import 'package:test/test.dart';

void main() {
  group('Grid', () {
    group('(new)', () {
      test('creates a squared grid of 10x10', () {
        const gridSize = 10;
        final grid = Grid(gridSize, PowerableLed.new);
        expect(grid.size, gridSize);
        expect(grid.leds.length, gridSize);
        expect(grid.leds.first.length, gridSize);
        print(grid);
      });
    });

    group('.turnOn()', () {
      test('turns on all LEDs', () {
        final grid = Grid(10, PowerableLed.new)
          ..turnOn(const Point(0, 0), const Point(9, 9));
        expect(grid.areAllPowered, isTrue);
        print(grid);
      });

      test('turns on only selected LEDs', () {
        const start = Point(1, 2);
        const end = Point(5, 6);
        final grid = Grid(10, PowerableLed.new)..turnOn(start, end);
        expect(grid.isPoweredFrom(start, end), isTrue);
        print(grid);
      });

      test('turns on only selected LEDs', () {
        const start = Point(7, 2);
        const end = Point(8, 3);
        final grid = Grid(10, PowerableLed.new)..turnOn(start, end);
        expect(grid.isPoweredFrom(start, end), isTrue);
        print(grid);
      });

      test('turns on only selected LEDs', () {
        const point = Point(1, 1);
        final grid = Grid(3, PowerableLed.new)..turnOn(point, point);
        expect(grid.isPoweredFrom(point), isTrue);
        print(grid);
      });
    });

    group('.turnOff()', () {
      test('turns off all LEDs', () {
        final grid = Grid(10, PowerableLed.new)
          ..turnOn(const Point(0, 0), const Point(9, 9));
        print(grid);
        grid.turnOff(const Point(0, 0), const Point(9, 9));
        expect(grid.areNonePowered, isTrue);
        print(grid);
      });
    });

    group('.toggle()', () {
      test('toggles all LEDs', () {
        final grid = Grid(10, PowerableLed.new)
          ..toggle(const Point(0, 0), const Point(9, 9));
        expect(grid.areAllPowered, isTrue);
        print(grid);
        grid.toggle(const Point(0, 0), const Point(9, 9));
        expect(grid.areNonePowered, isTrue);
        print(grid);
      });
    });

    group('.poweredLedsCount', () {
      test('returns the number of powered LEDs in the grid', () {
        final grid = Grid(1000, PowerableLed.new)
          ..turnOn(const Point(887, 9), const Point(959, 629))
          ..turnOn(const Point(454, 398), const Point(844, 448))
          ..turnOff(const Point(539, 243), const Point(559, 965))
          ..turnOff(const Point(370, 819), const Point(676, 868))
          ..turnOff(const Point(145, 40), const Point(370, 997))
          ..turnOff(const Point(301, 3), const Point(808, 453))
          ..turnOn(const Point(351, 678), const Point(951, 908))
          ..toggle(const Point(720, 196), const Point(897, 994))
          ..toggle(const Point(831, 394), const Point(904, 860));
        expect(grid.poweredLedsCount, 230022);
        print(grid.poweredLedsCount);
      });
    });
  });
}

extension GridPoweredExtension on Grid<PowerableLed> {
  /// Whether all LEDs in this [Grid] are powered.
  bool get areAllPowered =>
      leds.every((row) => row.every((led) => led.isPowered));

  /// Whether all LEDs in this [Grid] are not powered.
  bool get areNonePowered =>
      leds.every((row) => row.every((led) => !led.isPowered));

  bool isPoweredFrom(Point<int> start, [Point<int>? end]) {
    if (end == null) return leds[start.y][start.x].isPowered;

    for (var x = 0; x < size; x++) {
      for (var y = 0; y < size; y++) {
        final led = leds[y][x];
        if (Point(x, y).inBounds(start, end)) {
          if (!led.isPowered) return false;
        } else {
          if (led.isPowered) return false;
        }
      }
    }

    return true;
  }
}

extension PointInBoundsExtension on Point {
  /// Whether this [Point] is in bounds of the rectangle formed by [start]
  /// to [end].
  bool inBounds(Point<int> start, Point<int> end) =>
      x >= start.x && x <= end.x && y >= start.y && y <= end.y;
}
