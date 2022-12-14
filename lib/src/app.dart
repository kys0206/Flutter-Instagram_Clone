import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_project/src/components/image_data.dart';
import 'package:sample_project/src/controller/bottom_nav_controller.dart';
import 'package:sample_project/src/pages/active_history.dart';
import 'package:sample_project/src/pages/home.dart';
import 'package:sample_project/src/pages/mypage.dart';
import 'package:sample_project/src/pages/search.dart';

class App extends GetView<BottomNavController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Obx(
          () => Scaffold(
            body: IndexedStack(
              index: controller.pageIndex.value,
              children: [
                const Home(),
                Navigator(
                  key: controller.searchPageNavigationKey,
                  onGenerateRoute: (routeSetting) {
                    return MaterialPageRoute(
                      builder: (context) => const Search(),
                    );
                  },
                ),
                Container(),
                const ActiveHistory(),
                const MyPage(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false, // 라벨 삭제
              showUnselectedLabels: false, // 라벨 삭제
              currentIndex: controller.pageIndex.value,
              elevation: 0, // bottom 선 사라짐
              onTap: controller.changeBottomNav,
              items: [
                BottomNavigationBarItem(
                  icon: ImageData(IconsPath.homeOff),
                  activeIcon: ImageData(IconsPath.homeOn),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: ImageData(IconsPath.searchOff),
                  activeIcon: ImageData(IconsPath.searchOn),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: ImageData(IconsPath.uploadIcon),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: ImageData(IconsPath.activeOff),
                  activeIcon: ImageData(IconsPath.activeOn),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    width: 25,
                    height: 25,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                  ),
                  label: 'home',
                )
              ],
            ),
          ),
        ),
        onWillPop: controller.willPopAction);
  }
}
