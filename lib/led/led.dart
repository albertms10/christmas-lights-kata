/// An LED.
abstract class Led<T> {
  /// Turns on this [Led].
  T turnOn();

  /// Turns off this [Led].
  T turnOff();

  /// Toggles this [Led].
  T toggle();
}
