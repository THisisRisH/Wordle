import 'package:flutter/foundation.dart';

class GridNotifiers {
  List<ValueNotifier<bool>> gridNotifiers = [];
  List<ValueNotifier<bool>> keyboardNotifiers = [];
  int gridLength = 5;
  GridNotifiers(this.gridLength) {
    initNotifiers();
  }
  void initNotifiers() {
    for (int i = 0; i < gridLength; i++) {
      gridNotifiers.add(ValueNotifier<bool>(false));
    }
    for (int i = 0; i < 27; i++) {
      keyboardNotifiers.add(ValueNotifier<bool>(false));
    }
  }

  void updateNotifier(int index) {
    gridNotifiers[index].value = !gridNotifiers[index].value;
  }

  void updteKeyboardNotifier(int index) {
    keyboardNotifiers[index].value = !keyboardNotifiers[index].value;
  }

  void dispose() {
    for (int i = 0; i < gridLength; i++) {
      gridNotifiers[i].dispose();
    }
    for (int i = 0; i < 27; i++) {
      keyboardNotifiers[i].dispose();
    }
  }
}
