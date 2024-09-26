
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:discountnearme/models/coupons.dart';
import 'package:flutter/material.dart';
import 'package:discountnearme/constants.dart';
import 'package:discountnearme/models/plants.dart';
import 'package:discountnearme/ui/scan_page.dart';
import 'package:discountnearme/ui/screens/cart_page.dart';
import 'package:discountnearme/ui/screens/favorite_page.dart';
import 'package:discountnearme/ui/screens/home_page.dart';
import 'package:discountnearme/ui/screens/profile_page.dart';
import 'package:page_transition/page_transition.dart';

import '../models/stores.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Store> favorites = [];
  List<Coupons> coupons = [];

  int _bottomNavIndex = 0;

  //List of the pages
  List<Widget> _widgetOptions(){
    return [
      const HomePage(),
      FavoritePage(favoritedStores: favorites,),
      CartPage(couponsList: coupons,),
      const ProfilePage(),
    ];
  }

  //List of the pages icons
  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.discount,
    Icons.person,
  ];

  //List of the pages titles
  List<String> titleList = [
    'Home',
    'Favorite',
    'Coupons',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(titleList[_bottomNavIndex], style: TextStyle(
              color: Constants.blackColor,
              fontWeight: FontWeight.w500,
              fontSize: 24,
            ),),
            Icon(Icons.notifications, color: Constants.blackColor, size: 30.0,)
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: _widgetOptions(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, PageTransition(child: const ScanPage(), type: PageTransitionType.bottomToTop));
        },
        child: Image.asset('assets/images/shopping-bag.png', height: 30.0,),
        backgroundColor: Constants.primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        inactiveColor: Colors.black.withOpacity(.5),
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index){
          setState(() {
            _bottomNavIndex = index;
            final List<Store> favoritedPlants = Store.getFavStores();
            favorites = favoritedPlants;
            coupons = Coupons.couponsList;
          });
        }
      ),
    );
  }
}
