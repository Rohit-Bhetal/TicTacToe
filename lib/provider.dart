import 'package:flutter/widgets.dart';

class MyProvider extends ChangeNotifier {
  bool _iconBol = false;
  bool get iconBol => _iconBol;

  set iconBol(bool value) {
    _iconBol = value;
    notifyListeners();
  }
}
