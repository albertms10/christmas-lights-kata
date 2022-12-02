import 'dart:math';

import 'package:christmas_lights_kata/grid.dart';
import 'package:test/test.dart';

void main() {
  group('Grid', () {
    test('creates a squared grid of 10x10', () {
      // Arrange, Act
      const gridSize = 10;
      final grid = Grid(gridSize);
      // Assert
      expect(grid.size, gridSize);

      expect(grid.leds.length, gridSize);
      expect(grid.leds.first.length, gridSize);
    });

    group('.turnOn', () {
      test('turns on all LEDs', () {
        final grid = Grid(10)..turnOn(const Point(0, 0), const Point(9, 9));
        expect(grid.areAllPowered, isTrue);
        print(grid);
      });

      test('turns on only selected LEDs', () {
        const start = Point(1, 2);
        const end = Point(5, 6);
        final grid = Grid(10)..turnOn(start, end);
        expect(grid.arePoweredFrom(start, end), isTrue);
        print(grid);
      });

      test('turns on only selected LEDs', () {
        const start = Point(7, 2);
        const end = Point(8, 3);
        final grid = Grid(10)..turnOn(start, end);
        expect(grid.arePoweredFrom(start, end), isTrue);
        print(grid);
      });

      test('turns on only selected LEDs', () {
        const point = Point(1, 1);
        final grid = Grid(3)..turnOn(point, point);
        expect(grid.arePoweredFrom(point), isTrue);
        print(grid);
      });
    });

    group('.turnOff', () {
      test('turns off all LEDs', () {
        final grid = Grid(10)
          ..turnOn(const Point(0, 0), const Point(9, 9))
          ..turnOff(const Point(0, 0), const Point(9, 9));
        expect(grid.areNonePowered, isTrue);
      });
    });

    group('.toggle', () {
      test('toggles all LEDs', () {
        final grid = Grid(10)..toggle(const Point(0, 0), const Point(9, 9));
        expect(grid.areAllPowered, isTrue);
        grid.toggle(const Point(0, 0), const Point(9, 9));
        expect(grid.areNonePowered, isTrue);
      });
    });

    group('Santa’s instructions', () {
      test('are followed correctly', () {
        final grid = Grid(1000)
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
      });
    });
  });
}

extension GridPoweredExtension on Grid {
  /// Whether all LEDs in this [Grid] are powered.
  bool get areAllPowered =>
      leds.every((row) => row.every((led) => led.isPowered));

  /// Whether all LEDs in this [Grid] are not powered.
  bool get areNonePowered =>
      leds.every((row) => row.every((led) => !led.isPowered));

  bool arePoweredFrom(Point<int> start, [Point<int>? end]) {
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
