import 'package:food_delivery_app/models/quantity_model.dart';
import 'package:get/get.dart';

class QuantityController extends GetxController {
  QuantityModel quantityModel = QuantityModel(qty: 1.obs);

  void increment() {
    quantityModel.qty++;
    update();
  }

  void decrement() {
    (quantityModel.qty > 1) ? quantityModel.qty-- : null;
    update();
  }

  void empty() {
    quantityModel.qty = 1.obs;
    update();
  }
}
