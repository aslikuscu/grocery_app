import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop_app/model/cart_model.dart';
import 'package:provider/provider.dart';

import '../components/GroceryItemTile.dart';
import 'cartpages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return CartPage();
          },
        )),
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 48,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text("good morning"),
          ),
          SizedBox(
            height: 4,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "let's order fresh items for you",
              style: GoogleFonts.notoSerif(
                  fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(),
          ),
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "fresh items",
              style: TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            child: Consumer<CartModel>(
              builder: (context, value, child) {
                return GridView.builder(
                  itemCount: value.shopItems.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                  itemBuilder: (context, index) {
                    return GroceryItemTile(
                      itemName: value.shopItems[index][0],
                      itemPrice: value.shopItems[index][1],
                      imagePath: value.shopItems[index][2],
                      color: value.shopItems[index][3],
                      onPressed: () {
                        Provider.of<CartModel>(context, listen: false)
                            .addItemToCart(index);
                      },
                    );
                  },
                );
              },
            ),
          )
        ],
      )),
    );
  }
}
