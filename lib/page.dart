import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class FirstPage extends StatelessWidget {
  final List<List<dynamic>> productList;
  const FirstPage({Key? key, required this.productList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AR Furniture App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        appBar: AppBar(
            title: const Center(
          child: Text(
            "AR Furniture",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        )),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                    itemCount: productList.length,
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SecondPage(
                                  index: index, productList: productList)));
                        },
                        child: Card(
                          elevation: 10,
                          shadowColor: Colors.black45,
                          margin: const EdgeInsets.all(10),
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  const BorderSide(color: Colors.black26)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  color: Colors.white,
                                  child: Image.asset(
                                    productList[index][2],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      productList[index][0],
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      '${productList[index][1]} ¥',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.greenAccent),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final int index;
  final List<List<dynamic>> productList;

  const SecondPage({super.key, required this.index, required this.productList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        productList[index][0],
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      )),
      body: Column(
        children: [
          Expanded(
            child: ModelViewer(
              backgroundColor: const Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
              src: productList[index][3],
              ar: true,
              arPlacement: ArPlacement.floor,
              autoRotate: true,
              cameraControls: true,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 300),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                    onPressed: () {
                      print('Add to Cart!');
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      elevation: 10,
                      shadowColor: Colors.black.withOpacity(1),
                    ),
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      size: 30,
                    ),
                    label: const Text(
                      'Add to Cart!',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                ElevatedButton.icon(
                    onPressed: () {
                      print('Buy now!');
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      elevation: 10,
                      shadowColor: Colors.black.withOpacity(1),
                    ),
                    icon: const Icon(
                      Icons.shopping_cart_checkout_outlined,
                      size: 30,
                    ),
                    label: const Text(
                      'Buy now!',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
