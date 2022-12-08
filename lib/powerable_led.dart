import 'package:christmas_lights_kata/utils/random_string_extension.dart';

const _poweredLights = '🔴🟡🟢🔵';
const _offLight = '⚫️';

/// A powerable LED.
class PowerableLed {
  /// Constructs a new [PowerableLed].
  PowerableLed({bool isPowered = false})
      : _isPowered = isPowered,
        displayLight = _poweredLights.randomChar;

  bool _isPowered;

  /// Whether this [PowerableLed] is turned on or off.
  bool get isPowered => _isPowered;

  /// String for displaying the powered light.
  late final String displayLight;

  /// Turns on this [PowerableLed].
  bool turnOn() => _isPowered = true;

  /// Turns off this [PowerableLed].
  bool turnOff() => _isPowered = false;

  /// Toggles the powered state of this [PowerableLed] and returns the new
  /// state.
  bool toggle() => _isPowered = !_isPowered;

  @override
  String toString() => _isPowered ? displayLight : _offLight;
}
