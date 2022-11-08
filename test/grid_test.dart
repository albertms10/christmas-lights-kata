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

    group('.turnOn()', () {
      test('turns on the selected LEDs', () {
        // Arrange
        final grid = Grid(10)
          // Act
          ..turnOn(const Point(0, 0), const Point(9, 9));
        // Assert
        expect(
          grid.leds.every((row) => row.every((led) => led.isPowered)),
          isTrue,
        );
      });
    });

    group('.turnOff()', () {
      test('turns off the selected LEDs', () {
        // Arrange
        final grid = Grid(10)
          // Act
          ..turnOn(const Point(0, 0), const Point(9, 9))
          ..turnOff(const Point(0, 0), const Point(9, 9));
        // Assert
        expect(
          grid.leds.every((row) => row.every((led) => !led.isPowered)),
          isTrue,
        );
      });
    });

    group('.toggle()', () {
      test('toggles the powered state of the selected LEDs', () {
        // Arrange
        final grid = Grid(10)
          // Act
          ..toggle(const Point(0, 0), const Point(9, 9));
        // Assert
        expect(
          grid.leds.every((row) => row.every((led) => led.isPowered)),
          isTrue,
        );
      });
    });

    group('.poweredLeds', () {
      test('returns the number of powered LEDs in the grid', () {
        const size = 10;
        // Arrange, Act
        final grid = Grid(size);
        // Assert
        expect(grid.poweredLeds, 0);
        // Act
        grid.toggle(const Point(0, 0), const Point(9, 9));
        // Assert
        expect(grid.poweredLeds, size * size);
      });
    });
  });
}
