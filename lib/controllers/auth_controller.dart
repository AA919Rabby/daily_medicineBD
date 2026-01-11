import 'package:daily_medicinebd/models/medicine_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var filteredList = <MedicineModel>[].obs;

  void runFilter(String keyword, List<MedicineModel> originalList) {
    if (keyword.isEmpty) {
      filteredList.value = originalList;
    } else {
      filteredList.value = originalList
      //where is dart list method to filters items on conditions and it return iterable ,so we add .toList
          .where((item) =>
      item.medicineName.toLowerCase().contains(keyword.toLowerCase()) ||
          item.diseaseName.toLowerCase().contains(keyword.toLowerCase()) ||
          item.category.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }
  }
}