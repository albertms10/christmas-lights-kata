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
