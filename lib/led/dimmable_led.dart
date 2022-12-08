import 'package:christmas_lights_kata/led/led.dart';
import 'package:christmas_lights_kata/utils/map_int_v_extension.dart';

const _offLight = '⚫️';
const _brightnessLights = {
  0: _offLight,
  1: '🔅',
  10: '🔆',
};

/// A dimmable LED.
class DimmableLed extends Led<int> {
  /// Constructs a new [DimmableLed].
  DimmableLed() : _brightness = 0;

  int _brightness;

  /// Whether this [DimmableLed] is turned on or off.
  int get brightness => _brightness;

  /// Increases the brightness of this [DimmableLed] by 1.
  @override
  int turnOn() => _brightness++;

  /// Reduces the brightness of this [DimmableLed] by 1.
  @override
  int turnOff() {
    if (_brightness > 0) _brightness--;

    return _brightness;
  }

  /// Increases the brightness of this [DimmableLed] by 2.
  @override
  int toggle() => _brightness = _brightness + 2;

  @override
  String toString() =>
      _brightnessLights.valueFromThreshold(_brightness) ?? _offLight;
}
