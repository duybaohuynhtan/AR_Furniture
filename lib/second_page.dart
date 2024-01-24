import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:provider/provider.dart';

import 'cart_firestore.dart';
import 'cart_item.dart';
import 'cart_page.dart';
import 'cart_provider.dart';
import 'main.dart';

class SecondPage extends StatelessWidget {
  final int index;

  const SecondPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          productList[index][0],
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<ProfileScreen>(
                  builder: (context) => ProfileScreen(
                    appBar: AppBar(
                      title: const Text('User Profile'),
                    ),
                    actions: [
                      SignedOutAction((context) {
                        Navigator.of(context).pop();
                      })
                    ],
                    children: [
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset('assets/flutterfire_300x.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_basket),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<ProfileScreen>(
                  builder: (context) => CartPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 550,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: ModelViewer(
                  backgroundColor: const Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
                  src: productList[index][3],
                  ar: true,
                  arPlacement: ArPlacement.floor,
                  autoRotate: true,
                  cameraControls: true,
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ), // Add some space between the ModelViewer and buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          CartItem newItem = CartItem(
                            productName: productList[index][0],
                            quantity: 1,
                            price: productList[index][1],
                          );
                          CartManager().addToCart(newItem);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "Added ${productList[index][0]} to Cart"),
                              duration: const Duration(milliseconds: 2000),
                            ),
                          );
                        },
                        child: const Icon(Icons.add_shopping_cart),
                      ),
                      const Text('Add to Cart'),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.payment),
                        onPressed: () {
                          // Navigate to Payment page
                          if (kDebugMode) {
                            print('Navigating to Payment page...');
                          }
                          /*Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PaymentPage()),
                          );*/
                        },
                      ),
                      const Text('Buy Now'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 50), // Add some space
              Container(
                width: 370, // Set your desired width
                height: 300, // Set your desired height
                decoration: BoxDecoration(
                  color: Colors.grey, // Set your desired background color
                  borderRadius: BorderRadius.circular(
                      15), // Adjust the radius for rounded corners
                ),
                padding: const EdgeInsets.all(17),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About This Item',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold, // Make 'Description' bold
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ), // Add some space between 'Description' and the rest of the text
                    Text(
                      'This is a cool 360 no scope ergonomic chair from Herman Miller.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                  height: 20), // Add some space before the new container
              Container(
                width: 370, // Set your desired width
                height: 300, // Set your desired height
                decoration: BoxDecoration(
                  color: Colors.blue, // Set your desired background color
                  borderRadius: BorderRadius.circular(
                      15), // Adjust the radius for rounded corners
                ),
                padding: const EdgeInsets.all(17),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About Herman Miller',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Overpriced ergonomic shit.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                  height: 20), // Add some space before the new container
              Container(
                width: 370, // Set your desired width
                height: 180, // Set your desired height
                decoration: BoxDecoration(
                  color:
                      Colors.yellow[400], // Set your desired background color
                  borderRadius: BorderRadius.circular(
                      15), // Adjust the radius for rounded corners
                ),
                padding: const EdgeInsets.all(17),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'From Developer',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Your 99% of payment will go to Ukraine.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
