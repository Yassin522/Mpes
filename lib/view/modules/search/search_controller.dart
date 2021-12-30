import 'package:get/get.dart';
import 'package:mpes/view/modules/search/search_service.dart';

class SearchController extends GetxController {
  var productName = '';
  var productType = '';
  var productExpired = '';
  bool searchStatus1 = true;
  bool searchStatus2 = true;
  bool searchStatus3 = true;
  List searchResult = [].obs;

  SearchService searchService = SearchService();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  loadSearchByName(String name) async {
    searchStatus1=false;
    searchResult = await searchService.LoadNameFromApi(name);
    searchStatus1=true;
  }

   loadSearchByType(String name) async {
    searchStatus2=false;
    searchResult = await searchService.LoadTypeFromApi(name);
    searchStatus2=true;
  }

   loadSearchByExpired(String name) async {
    searchStatus3=false;
    searchResult = await searchService.LoadExpiredFromApi(name);
    searchStatus3=true;
  }

}
