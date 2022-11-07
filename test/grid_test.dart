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
  });
}
