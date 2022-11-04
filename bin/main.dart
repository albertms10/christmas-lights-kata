import 'package:christmas_lights_kata/grid.dart';
import 'package:collection/collection.dart' show IterableExtension;

void main(List<String> arguments) {
  final size = int.tryParse(arguments.firstOrNull ?? '') ?? 50;
  final grid = Grid(size);

  print(grid);
}
