import 'package:christmas_lights_kata/led.dart';
import 'package:test/test.dart';

void main() {
  group('Led', () {
    test('is not powered by default', () {
      // Arrange, Act
      final led = Led();
      // Assert
      expect(led.isPowered, isFalse);
    });

    test('uses the powered value on construction', () {
      // Arrange, Act
      final led = Led(isPowered: true);
      // Assert
      expect(led.isPowered, isTrue);
    });

    group('.toggle()', () {
      test('toggles the powered state', () {
        // Arrange
        final led = Led()
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
