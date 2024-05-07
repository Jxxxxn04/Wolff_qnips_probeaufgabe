import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qnips_probeaufgabe/models/product.dart';
import 'package:qnips_probeaufgabe/screens/product_page.dart';
import 'package:qnips_probeaufgabe/services/api_service.dart';
import 'package:qnips_probeaufgabe/widgets/product_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          FutureBuilder(
            future: ApiService.getResponse(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Map<int, Product> productsMap = getProductsMap(snapshot.data!.body);
                Map<String, dynamic> jsonMap = jsonDecode(snapshot.data!.body);
                List<dynamic> rows = jsonMap['Rows'];

                return SafeArea(
                    child: Table(
                  border: TableBorder.all(),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    const TableRow(children: [
                      TableCell(child: Text("KW8")),
                      TableCell(child: Text("Montag")),
                      TableCell(child: Text("Dienstag")),
                      TableCell(child: Text("Mittwoch")),
                      TableCell(child: Text("Donnerstag")),
                      TableCell(child: Text("Freitag")),
                    ]),
                    for (int i = 0; i <= 2; i++)
                      TableRow(children: [
                        TableCell(child: Text(rows[i]["Name"])),
                        for (int j = 0; j <= 4; j++)
                          TableCell(
                              child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ProductPage(
                                        products: rows[i]["Days"],
                                        productsMap: productsMap,
                                        initalDayIndex: j,
                                      )));
                            },
                            child: ProductWidget(
                              product: productsMap[rows[i]["Days"][j]["ProductIds"]
                                  [0]["ProductId"]]!,
                            ),
                          ))
                      ]),
                  ],
                ));
              }
              if (snapshot.hasError) {
                return const SafeArea(
                  child: Text("Fehler"),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          const Expanded(child: Align(alignment: Alignment.bottomCenter, child: Text("Tap on a specific product to get a better view!")))
        ],
      ),
    );
  }

  Map<String, String> getAllergenesMap(String jsonText) {
    Map<String, dynamic> jsonMap = jsonDecode(jsonText);
    Map<String, dynamic> allergens = jsonMap['Allergens'];

    Map<String, String> allergensMap = {};
    allergens.forEach((key, value) {
      allergensMap[value['Id']] = value['Label'];
    });

    return allergensMap;
  }

  Map<int, Product> getProductsMap(String jsonText) {
    Map allergensMap = getAllergenesMap(jsonText);

    Map<String, dynamic> jsonMap = jsonDecode(jsonText);
    Map<String, dynamic> products = jsonMap['Products'];

    Map<int, Product> productsMap = {};

    products.forEach((key, value) {
      List<String> allergenIds = [];
      for (String key in List<String>.from(value['AllergenIds'])) {
        allergenIds.add(allergensMap[key]);
      }
      String productName = value['Name'];
      double price = value['Price']['Betrag'].toDouble();
      int productId = int.parse(key);

      Product product = Product(productId, productName, allergenIds, price);
      productsMap[productId] = product;
    });

    return productsMap;
  }
}
