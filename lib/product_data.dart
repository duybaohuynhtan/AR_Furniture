import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class ProductData extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProductDataState();
}

class _ProductDataState extends State<ProductData> {
  List<List<dynamic>> data = [];
  loadAsset() async {
    final productData = await DefaultAssetBundle.of(context)
        .loadString("assets/product_data.csv");
    List<List<dynamic>> csvTable =
        const CsvToListConverter().convert(productData, eol: "\n");
    print(csvTable);
    data = csvTable;
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
