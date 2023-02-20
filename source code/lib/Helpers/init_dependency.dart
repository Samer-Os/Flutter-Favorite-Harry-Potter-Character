import 'package:get/get.dart';
import '../Controllers/character_controller.dart';

class InitDep extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CharacterController());
  }
}