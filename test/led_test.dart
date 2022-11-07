import 'package:christmas_lights_kata/led.dart';
import 'package:test/test.dart';

void main() {
  group('Led', () {
    test('is not powered by default', () {
      // Arrange, Act
      final led = Led(0, 0);
      // Assert
      expect(led.isPowered, isFalse);
    });

    test('has the correct Point coordinates', () {
      // Arrange, Act
      final led = Led(1, 2);
      // Assert
      expect(led.point.x, 1);
      expect(led.point.y, 2);
    });

    group('.toggle()', () {
      test('toggles the powered state', () {
        // Arrange
        final led = Led(0, 0)
          // Act
          ..toggle();
        // Assert
        expect(led.isPowered, isTrue);
        // Act
        led.toggle();
        // Assert
        expect(led.isPowered, isFalse);
      });
    });
  });
}
