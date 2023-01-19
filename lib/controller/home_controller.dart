import 'package:get/get.dart';
import 'package:tdc_frontend_mobile/service/remote_service/remote_category_service.dart';

import '../model/ad_banner.dart';
import '../model/category.dart';
import '../service/local_service/local_ad_banner_service.dart';
import '../service/local_service/local_category_service.dart';
import '../service/remote_service/remote_banner_service.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;
  RxList<Category> popularCategoryList =
      List<Category>.empty(growable: true).obs;
  RxBool isBannerLoading = false.obs;
  RxBool isPopularCategoryLoading = false.obs;
  RxBool isPopularProductLoading = false.obs;
  final LocalAdBannerService _localAdBannerService = LocalAdBannerService();
  final LocalCategoryService _localCategoryService = LocalCategoryService();

  @override
  void onInit() async {
    await _localAdBannerService.init();
    await _localCategoryService.init();
    getAdBanners();
    super.onInit();
  }

  void getAdBanners() async {
    try {
      isBannerLoading(true);
      //assigning local ad banners before call api
      if (_localAdBannerService.getAdBanners().isNotEmpty) {
        bannerList.assignAll(_localAdBannerService.getAdBanners());
      }
      //call api
      var result = await RemoteBannerService().get();
      if (result != null) {
        //assign api result
        bannerList.assignAll(adBannerListFromJson(result.body));
        //save api result to local db
        _localAdBannerService.assignAllAdBanners(
            adBanners: adBannerListFromJson(result.body));
      }
    } finally {
      isBannerLoading(false);
    }
  }
}
