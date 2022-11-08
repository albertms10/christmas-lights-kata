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

    group('.turnOn()', () {
      test('turns on this LED', () {
        // Arrange
        final led = Led()
          // Act
          ..turnOn();
        // Assert
        expect(led.isPowered, isTrue);
      });
    });

    group('.turnOff()', () {
      test('turns off this LED', () {
        // Arrange
        final led = Led(isPowered: true)
          // Act
          ..turnOff();
        // Assert
        expect(led.isPowered, isFalse);
      });
    });

    group('.toggle()', () {
      test('toggles the powered state of this LED', () {
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
