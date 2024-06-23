import 'dart:developer' as dev;
import 'dart:math';

extension ExtensionName on num {
  double get deg {
    return this * pi / 180;
  }
}

extension LogExt<T> on T {
  T get log {
    dev.log(toString());
    return this;
  }
}
