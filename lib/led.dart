import 'package:christmas_lights_kata/utils/random_string_extension.dart';

const _poweredLights = '🔴🟡🟢🔵';
const _offLight = '⚫️';

/// An LED.
class Led {
  /// Constructs a new [Led].
  Led({this.isPowered = false}) : displayLight = _poweredLights.randomChar;

  /// Whether this [Led] is turned on or off.
  bool isPowered;

  /// String for displaying the powered light.
  late final String displayLight;

  /// Turns on this [Led].
  bool turnOn() => isPowered = true;

  /// Turns off this [Led].
  bool turnOff() => isPowered = false;

  /// Toggles the powered state of this [Led] and returns the new state.
  bool toggle() => isPowered = !isPowered;

  @override
  String toString() => isPowered ? displayLight : _offLight;
}
