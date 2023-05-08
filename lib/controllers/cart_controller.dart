import 'package:get/get.dart';

class CartController extends GetxController {
  List<Map<String, dynamic>> cartItems = [];

  RxList adProduct = [].obs;

  void addToCart({required data}) {
    cartItems.add(data);
    update();
  }

  void removeFromCart({required data}) {
    cartItems.remove(data);
    update();
  }
}
