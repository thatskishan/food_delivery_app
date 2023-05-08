import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/views/tabbar%20/cart.dart';
import 'package:food_delivery_app/views/tabbar%20/chat.dart';
import 'package:food_delivery_app/views/tabbar%20/favourite.dart';
import 'package:food_delivery_app/views/tabbar%20/home.dart';
import 'package:food_delivery_app/views/tabbar%20/notifications.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/favicon_controller.dart';
import '../../controllers/favourite_controller.dart';
import '../../controllers/quantity_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FavouriteController favouriteController = Get.put(FavouriteController());
  FavIconController iconController = Get.put(FavIconController());

  int _selectedIndex = 0;

  List<Widget> tabItems = [
    const Home(),
    const Chat(),
    const Cart(),
    const Notifications(),
    const Favourite(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color(0xff1d2030),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                  ),
                  Text(
                    "Surat",
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          leadingWidth: 100,
          actions: const [
            CircleAvatar(
              backgroundColor: Color(0xffeda038),
              child: Icon(
                Icons.account_circle_outlined,
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
      body: Center(
        child: tabItems[_selectedIndex],
      ),
      bottomNavigationBar: FlashyTabBar(
        animationCurve: Curves.linear,
        selectedIndex: _selectedIndex,
        iconSize: 30,
        showElevation: false, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('Home'),
          ),
          FlashyTabBarItem(
            icon: Icon(CupertinoIcons.chat_bubble),
            title: Text('Chat'),
          ),
          /*FlashyTabBarItem(
            icon: Icon(CupertinoIcons.cart),
            title: Text('Cart'),
          ),*/
          FlashyTabBarItem(
            icon: Stack(
              alignment: Alignment.topCenter,
              children: [
                const Icon(
                  CupertinoIcons.shopping_cart,
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: GetX<QuantityController>(builder: (cc) {
                      return Text(
                        "${cc.quantityModel.qty}",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
            title: Text('Cart'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.notifications_active_outlined),
            title: Text('Notification'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text('Favourite'),
          ),
        ],
      ),
    );
  }
}
