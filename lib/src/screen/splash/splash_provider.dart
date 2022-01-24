import 'dart:async';
import 'dart:developer';

import 'package:app1/src/application.dart';

class SplashProvider extends ChangeNotifier {
  final _items = List.generate(1000, (index) => Item());

  late final viewedItems = List.from(_items).cast<Item>();

  Timer? timer;

  int numberOfRequests = 1;
  void onSearch(String value) {
    timer?.cancel();
    timer = Timer(const Duration(seconds: 1), () {
      viewedItems.clear();
      viewedItems.addAll(
        _items.where(
          (element) => (element.name + element.description)
              .toLowerCase()
              .contains(value),
        ),
      );
      notifyListeners();
      log((numberOfRequests++).toString());
      timer = null;
    });
  }
}

class Item {
  final name = getUserName();
  final description = getDescription();
  final avatar = networkImage;
}
