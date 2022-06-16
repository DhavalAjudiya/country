import 'package:cuntry/api_calling/modal.dart';
import 'package:cuntry/api_calling/servises.dart';
import 'package:get/get.dart';

class ApiController extends GetxController {
  RxList<UserDetails> user = <UserDetails>[].obs;

  Future getData() async {
    print("uuuu---11--");
    user.value = await ApiService.userData();
    print("uuuu---22--${user.value[0].title}");
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
