import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/views/screens/categories.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: "Search items",
                hintStyle: GoogleFonts.poppins(),
                suffixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                catCon(
                    path: "assets/images/pizza.png",
                    name: "Pizza",
                    filepath: 'pizza',
                    appName: 'Pizza De-Light'),
                catCon(
                    path: "assets/images/salads.png",
                    name: "Salad",
                    filepath: 'salad',
                    appName: 'Fresh Garden Delights'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                catCon(
                    path: "assets/images/drinks.png",
                    name: "Drinks",
                    filepath: 'drink',
                    appName: 'Beverage Bliss'),
                catCon(
                    path: "assets/images/desserts.png",
                    name: "Desserts",
                    filepath: 'desserts',
                    appName: 'Sweet Endings'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                catCon(
                    path: "assets/images/pasta.png",
                    name: "Pasta",
                    filepath: 'pasta',
                    appName: 'From Italy with Love'),
                catCon(
                    path: "assets/images/burger.png",
                    name: "Burger",
                    filepath: 'burger',
                    appName: 'Juicy and Delicious'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget catCon({
    required String path,
    required String name,
    required String filepath,
    required String appName,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Menu(title: appName, categories: filepath)));
      },
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width * 0.40,
        decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: Colors.grey,
          ),
          color: const Color(0xff1d2030),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: Image.asset(path),
            ),
            Text(
              name,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
