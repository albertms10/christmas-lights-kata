import 'package:christmas_lights_kata/utils/random_string_extension.dart';

const _poweredLights = '🔴🟡🟢🔵';
const _offLight = '⚫️';

/// An LED.
class Led {
  /// Constructs a new [Led].
  Led({bool isPowered = false})
      : _isPowered = isPowered,
        displayLight = _poweredLights.randomChar;

  bool _isPowered;

  /// Whether this [Led] is turned on or off.
  bool get isPowered => _isPowered;

  /// String for displaying the powered light.
  late final String displayLight;

  /// Turns on this [Led].
  bool turnOn() => _isPowered = true;

  /// Turns off this [Led].
  bool turnOff() => _isPowered = false;

  /// Toggles the powered state of this [Led] and returns the new state.
  bool toggle() => _isPowered = !_isPowered;

  @override
  String toString() => _isPowered ? displayLight : _offLight;
}
