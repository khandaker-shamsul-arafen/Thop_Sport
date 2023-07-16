import 'package:firsttest/views/screens/player.dart';
import 'package:firsttest/views/screens/point.dart';
import 'package:firsttest/views/screens/score.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../consts/app_assets.dart';
import '../../consts/app_colors.dart';
import '../../consts/app_sizes.dart';
import 'home_page.dart';

class ParentScreen extends StatefulWidget {
  const ParentScreen({
    Key? key,
    this.page = 1,
  }) : super(key: key);
  final int page;

  @override
  ParentScreenState createState() => ParentScreenState();
}

class ParentScreenState extends State<ParentScreen> {
  //AuthController authController = Get.find();
  int _selectedIndex = 1;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _selectedIndex = widget.page;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.background))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text("jkasd"),
          centerTitle: true,
          leading: InkWell(
            onTap: () async {
              _scaffoldKey.currentState?.openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageIcon(
                const AssetImage(
                  AppAssets.drawer,
                ),
                color: Colors.white,
                size: AppSizes.size26,
              ),
            ),
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          actions: [
            InkWell(
              onTap: () async {
                _scaffoldKey.currentState?.openDrawer();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImageIcon(
                  const AssetImage(
                    AppAssets.like,
                  ),
                  color: Colors.white,
                  size: AppSizes.size26,
                ),
              ),
            )
          ],
          automaticallyImplyLeading: false,
        ),
        // drawer: const AppDrawer(),
        body: IndexedStack(
          index: _selectedIndex,
          children: const [
            HomeScreen(),
            ScoreScreen(),
            PlayerScreen(),
            PointScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white.withOpacity(0.3),
          selectedItemColor: AppColors.navbarSelectedColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(
              fontSize: AppSizes.size13,
              color: Colors.redAccent,
              fontWeight: FontWeight.w600),
          unselectedLabelStyle: TextStyle(
            fontSize: AppSizes.size12,
            color: Colors.white.withOpacity(.8),
          ),
          unselectedItemColor: Colors.white.withOpacity(.7),
          type: BottomNavigationBarType.fixed,
          items: [
            bottomNavBarItem(AppAssets.home, 'HOME'),
            bottomNavBarItem(AppAssets.score, 'SCORE'),
            bottomNavBarItem(AppAssets.player, 'PLAYERS'),
            bottomNavBarItem(AppAssets.point, 'POINT'),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  BottomNavigationBarItem bottomNavBarItem(String image, String label) {
    return BottomNavigationBarItem(
      activeIcon: Builder(builder: (context) {
        return Image.asset(
          image,
          color: AppColors.navbarSelectedColor,
          height: 24,
          width: 24,
        );
      }),
      icon: Builder(builder: (context) {
        return Image.asset(
          image,
          height: 21,
          width: 21,
          color: Colors.white,
        );
      }),
      label: label,
    );
  }
}
