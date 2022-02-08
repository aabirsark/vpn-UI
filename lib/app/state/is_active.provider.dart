import 'package:flutter/material.dart';

class IsActive with ChangeNotifier {
  // ? var
  bool _isActive = false;

  // ? getter
  bool get isActive => _isActive;

  // ? setter
  void changeActiveState() {
    _isActive = !isActive;
    notifyListeners();
  }
}
