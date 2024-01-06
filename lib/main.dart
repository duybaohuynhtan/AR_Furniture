import 'package:ar_furniture_app/onboarding_page.dart';
import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String csvData = await rootBundle.loadString(
    "assets/product_data.csv",
  );
  List<List<dynamic>> productList = const CsvToListConverter().convert(csvData);
  if (kDebugMode) {
    print(productList);
    print(productList[0][0]);
    print('Type of myVariable: ${productList[1][1].runtimeType}');
  }
  //print('Type of myVariable: ${productList[1][2].runtimeType}');
  // List<String> stringList = csvList.map((row) => row.join(', ')).toList();
  // stringList.forEach((str) {
  //   print(str);
  // });
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ConcentricAnimationOnboarding(productList: productList),
  ));
}
