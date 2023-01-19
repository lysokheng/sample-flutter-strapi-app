import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controllers.dart';
import 'widgets/carousel_slider/carousel_slider_view.dart';

import 'widgets/carousel_slider/carousel_loading.dart';
import 'widgets/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SectionTitle(title: "Banner"),
                Obx(() {
                  if (homeController.bannerList.isNotEmpty) {
                    return CarouselSliderView(
                        bannerList: homeController.bannerList);
                  } else {
                    return const CarouselLoading();
                  }
                }),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
