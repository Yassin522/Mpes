import 'package:get/state_manager.dart';

class SearchController extends GetxController {
  var _selectedList = List<String>.empty(growable: true).obs;
  getSelectedList() => _selectedList;
  setSelectedList(List<String> list) => _selectedList.value = list;
}
