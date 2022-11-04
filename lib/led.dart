import 'package:christmas_lights_kata/utils/random_string_extension.dart';

const _poweredLights = '🔴🟡🟢🔵';
const _offLight = '⚫️';

/// A grid-positioned LED.
class Led {
  /// Constructs a new [Led] from [x] and [y] coordinates.
  Led(this.x, this.y, {this.isPowered = false})
      : displayLight = _poweredLights.randomChar;

  /// X coordinate position in the grid.
  final int x;

  /// Y coordinate position in the grid.
  final int y;

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
