import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/favicon_model.dart';

class FavIconController extends GetxController {
  FavIconModel icon = FavIconModel(isFav: false);

  void tap() {
    icon.isFav = !icon.isFav;
    update();
  }
}
