import 'package:flutter/widgets.dart';

class RefrigeratorViewModel with ChangeNotifier {
  BuildContext context;
  RefrigeratorViewModel({required this.context});

  int selected = 0;

  void onTapRefrigerator() {
    selected = 0;
    notifyListeners();
  }

  void onTapFreezer() {
    selected = 1;
    notifyListeners();
  }

  void onTapCabinet() {
    selected = 2;
    notifyListeners();
  }
}
