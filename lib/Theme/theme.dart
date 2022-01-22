import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../Databases/Boxes/Boxes.dart';




class SelectTheme with ChangeNotifier {
  SelectTheme._private();

  static final SelectTheme instance = SelectTheme._private();

  static bool _isDark = true;
  SelectTheme() {

    if (Boxes.instance.themeBox.containsKey(Boxes.CurrentThemeKey)) {
      _isDark =Boxes.instance.themeBox.get(Boxes.CurrentThemeKey);
    } else {
      Boxes.instance.themeBox.put(Boxes.CurrentThemeKey, _isDark);
    }
  }

  themeMode() {
    return _isDark ? ThemeMode.light : ThemeMode.dark;
  }

  void switchTheme() {
    _isDark = !_isDark;
    Boxes.instance.themeBox.put(Boxes.CurrentThemeKey, _isDark);
    notifyListeners();
  }
}
