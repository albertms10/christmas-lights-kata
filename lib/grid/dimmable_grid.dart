import 'package:christmas_lights_kata/grid/grid.dart';
import 'package:christmas_lights_kata/led/dimmable_led.dart';

/// A grid of dimmable LEDs.
class DimmableGrid extends Grid<DimmableLed> {
  /// Creates a new [Grid] of [DimmableLed]s.
  DimmableGrid(int size) : super(size, DimmableLed.new);
}
