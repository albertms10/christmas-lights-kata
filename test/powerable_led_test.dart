import 'package:christmas_lights_kata/powerable_led.dart';
import 'package:test/test.dart';

void main() {
  group('PowerableLed', () {
    group('(new)', () {
      test('is not powered by default', () {
        final led = PowerableLed();
        expect(led.isPowered, isFalse);
        print(led);
      });

      test('uses the powered value on construction', () {
        final led = PowerableLed(isPowered: true);
        expect(led.isPowered, isTrue);
        print(led);
      });
    });

    group('.turnOn()', () {
      test('turns on this LED', () {
        final led = PowerableLed()..turnOn();
        expect(led.isPowered, isTrue);
        print(led);
      });
    });

    group('.turnOff()', () {
      test('turns off this LED', () {
        final led = PowerableLed(isPowered: true)..turnOff();
        expect(led.isPowered, isFalse);
        print(led);
      });
    });

    group('.toggle()', () {
      test('toggles the powered state of this LED', () {
        final led = PowerableLed()..toggle();
        expect(led.isPowered, isTrue);
        print(led);
        led.toggle();
        expect(led.isPowered, isFalse);
        print(led);
      });
    });
  });
}
