import 'package:get/get.dart';
import 'package:mobihub_2/controller/sell_controller.dart';
import 'package:mobihub_2/services/consts.dart';


class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Sellcontroller>(() => Sellcontroller(), fenix: true);

  }
}