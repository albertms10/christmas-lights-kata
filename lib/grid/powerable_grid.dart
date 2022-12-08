import 'package:christmas_lights_kata/grid/grid.dart';
import 'package:christmas_lights_kata/led/powerable_led.dart';

/// A grid of powerable LEDs.
class PowerableGrid extends Grid<PowerableLed> {
  /// Creates a new [Grid] of [PowerableLed]s.
  PowerableGrid(int size) : super(size, PowerableLed.new);
}
