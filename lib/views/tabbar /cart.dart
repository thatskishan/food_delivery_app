import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  CartController cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Items",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: cartController.cartItems.isNotEmpty
          ? GetBuilder<CartController>(builder: (context) {
              return ListView.builder(
                itemCount: cartController.cartItems.length,
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
                                    cartController.cartItems[index]['image'],
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
                                    cartController.cartItems[index]['name'],
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
                                        "⭐️${cartController.cartItems[index]['rating']}",
                                        style: GoogleFonts.poppins(
                                          color: Colors.grey.shade800,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "₹${cartController.cartItems[index]['price']}/-",
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
                                icon: const Icon(Icons.remove_shopping_cart),
                                onPressed: () {
                                  setState(() {
                                    cartController.removeFromCart(
                                        data: cartController.cartItems[index]);
                                  });
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
                "Your shopping cart is empty!",
                style: GoogleFonts.poppins(fontSize: 18),
              ),
            ),
    );
  }
}
