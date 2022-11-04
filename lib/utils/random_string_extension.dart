import 'dart:math';

import 'package:characters/characters.dart';

final _random = Random();

/// Random string extension.
extension RandomStringExtension on String {
  /// Returns a random character of this [String].
  String get randomChar =>
      characters.elementAt(_random.nextInt(characters.length));
}
