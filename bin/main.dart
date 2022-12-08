import 'dart:math';

import 'package:christmas_lights_kata/grid/grid.dart';
import 'package:christmas_lights_kata/led/powerable_led.dart';

void main(List<String> arguments) {
  final grid = Grid(1000, PowerableLed.new)
    ..turnOn(const Point(887, 9), const Point(959, 629))
    ..turnOn(const Point(454, 398), const Point(844, 448))
    ..turnOff(const Point(539, 243), const Point(559, 965))
    ..turnOff(const Point(370, 819), const Point(676, 868))
    ..turnOff(const Point(145, 40), const Point(370, 997))
    ..turnOff(const Point(301, 3), const Point(808, 453))
    ..turnOn(const Point(351, 678), const Point(951, 908))
    ..toggle(const Point(720, 196), const Point(897, 994))
    ..toggle(const Point(831, 394), const Point(904, 860));

  print(grid.poweredLedsCount);
}
