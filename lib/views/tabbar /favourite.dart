import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/controllers/favourite_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  FavouriteController favouriteController = Get.find<FavouriteController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favourite Items",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: favouriteController.favProduct.isNotEmpty
          ? GetBuilder<CartController>(builder: (context) {
              return ListView.builder(
                itemCount: favouriteController.favProduct.length,
                itemBuilder: (BuildContext context, int index) {
                  // final item = cartItems[index];

                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                      top: 10.0,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.indigo.shade100,
                        child: Row(
                          children: [
                            Expanded(
                              child: CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.indigo,
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundImage: NetworkImage(
                                    favouriteController.favProduct[index]
                                        ['image'],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    favouriteController.favProduct[index]
                                        ['name'],
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "⭐️${favouriteController.favProduct[index]['rating']}",
                                        style: GoogleFonts.poppins(
                                          color: Colors.grey.shade800,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "₹${favouriteController.favProduct[index]['price']}/-",
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  setState(
                                    () {
                                      favouriteController.removeProduct(
                                          data: favouriteController
                                              .favProduct[index]);
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            })
          : Center(
              child: Text(
                "Nothing in your wishlist!",
                style: GoogleFonts.poppins(fontSize: 18),
              ),
            ),
    );
  }
}
