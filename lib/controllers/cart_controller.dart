import 'package:food_delivery_app/models/cart_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  List<Map<String, dynamic>> cartItems = [];

  RxList adProduct = [].obs;

  get totalQuantity {
    int totalQty = 0;

    adProduct.forEach((element) {
      totalQty += element.qty as int;
    });
    return totalQty;
  }

  get totalPrice {
    int totalPrice = 0;

    adProduct.forEach((element) {
      totalPrice += (element.qty as int) * (element.price as int);
    });
    return totalPrice;
  }

  void addToCart({required CartModel data}) {
    adProduct.add(data);
    update();
  }

  void removeFromCart({required CartModel data}) {
    adProduct.remove(data);
    update();
  }
}
