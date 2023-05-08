import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class FavouriteController extends ChangeNotifier {
  RxList favProduct = [].obs;

  void addProduct({required data}) {
    favProduct.add(data);
    notifyListeners();
  }

  void removeProduct({required data}) {
    favProduct.remove(data);
    notifyListeners();
  }
}
