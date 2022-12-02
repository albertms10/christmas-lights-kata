import 'package:christmas_lights_kata/led.dart';
import 'package:test/test.dart';

void main() {
  group('Led', () {
    group('(new)', () {
      test('is not powered by default', () {
        final led = Led();
        expect(led.isPowered, isFalse);
        print(led);
      });

      test('uses the powered value on construction', () {
        final led = Led(isPowered: true);
        expect(led.isPowered, isTrue);
        print(led);
      });
    });

    group('.turnOn()', () {
      test('turns on this LED', () {
        final led = Led()..turnOn();
        expect(led.isPowered, isTrue);
        print(led);
      });
    });

    group('.turnOff()', () {
      test('turns off this LED', () {
        final led = Led(isPowered: true)..turnOff();
        expect(led.isPowered, isFalse);
        print(led);
      });
    });

    group('.toggle()', () {
      test('toggles the powered state of this LED', () {
        final led = Led()..toggle();
        expect(led.isPowered, isTrue);
        print(led);
        led.toggle();
        expect(led.isPowered, isFalse);
        print(led);
      });
    });
  });
}
