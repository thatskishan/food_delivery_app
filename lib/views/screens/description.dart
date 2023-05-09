import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/views/tabbar%20/cart.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/favicon_controller.dart';
import '../../controllers/favourite_controller.dart';
import '../../controllers/quantity_controller.dart';

class Description extends StatefulWidget {
  final String title;
  final String id;
  final String categories;
  const Description(
      {Key? key,
      required this.title,
      required this.categories,
      required this.id})
      : super(key: key);

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  CartController cartController = Get.put(CartController());
  QuantityController quantityController = Get.find<QuantityController>();
  FavouriteController favouriteController = Get.find<FavouriteController>();
  FavIconController iconController = Get.find<FavIconController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: GoogleFonts.poppins(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
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
          ),
        ],
        centerTitle: true,
        backgroundColor: const Color(0xff1d2030),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection(widget.categories)
            .snapshots(),
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Center(
              child: Text("ERROR:${snapShot.error}"),
            );
          } else if (snapShot.hasData) {
            QuerySnapshot<Map<String, dynamic>>? data = snapShot.data;

            if (data == null) {
              return const Center(
                child: Text("No Data Available"),
              );
            } else {
              List<QueryDocumentSnapshot<Map<String, dynamic>>> allDocs =
                  data.docs;

              return Stack(
                alignment: Alignment.topCenter,
                children: [
                  Expanded(
                    child: Container(
                      color: const Color(0xff1d2030),
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height * 0.65,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.18,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${allDocs[int.parse(widget.id) - 1].data()['name']}",
                                        style: GoogleFonts.poppins(
                                          fontSize: 26,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        "₹${allDocs[int.parse(widget.id) - 1].data()['price']}.00/-",
                                        style: GoogleFonts.poppins(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xff1d2030),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: const Color(0xff1d2030),
                                    ),
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            quantityController.decrement();
                                          },
                                          icon: const Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                          ),
                                        ),
                                        GetX<QuantityController>(builder: (cc) {
                                          return Text(
                                            "${cc.quantityModel.qty}",
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                            ),
                                          );
                                        }),
                                        IconButton(
                                          onPressed: () {
                                            quantityController.increment();
                                          },
                                          icon: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "́⭐️${allDocs[int.parse(widget.id) - 1].data()['rating']}",
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  "́⏰${allDocs[int.parse(widget.id) - 1].data()['time']}",
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  "́🔥100Kcal",
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: GestureDetector(
                                    onTap: () {
                                      iconController.tap();

                                      favouriteController.addProduct(
                                          data:
                                              allDocs[int.parse(widget.id) - 1]
                                                  .data());

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text("Item added to favourite"),
                                        ),
                                      );

                                      iconController.tap();
                                    },
                                    child: GetBuilder<FavIconController>(
                                        builder: (ic) {
                                      return Icon(
                                        (iconController.icon.isFav)
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: (iconController.icon.isFav)
                                            ? Colors.red
                                            : Colors.black,
                                        size: 30,
                                      );
                                    }),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "About Food",
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "${allDocs[int.parse(widget.id) - 1].data()['des']}",
                                style: GoogleFonts.poppins(color: Colors.grey),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  /*cartItems.add(
                                      allDocs[int.parse(widget.id) - 1].data());*/
                                  CartModel data = CartModel(
                                      name:
                                          "${allDocs[int.parse(widget.id) - 1].data()['name']}",
                                      image:
                                          "${allDocs[int.parse(widget.id) - 1].data()['image']}",
                                      price: allDocs[int.parse(widget.id) - 1]
                                          .data()['price'],
                                      qty: quantityController
                                          .quantityModel.qty.value);
                                  // cartController.addToCart(
                                  //     data: allDocs[int.parse(widget.id) - 1]
                                  //         .data());
                                  cartController.adProduct.add(data);
                                  quantityController.empty();
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const Cart()));

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Item added to cart"),
                                    ),
                                  );
                                });
                              },
                              child: Container(
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color(0xff1d2030),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "Add to cart",
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: CircleAvatar(
                      radius: 134,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 130,
                        backgroundImage: NetworkImage(
                          "${allDocs[int.parse(widget.id) - 1].data()['image']}",
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
