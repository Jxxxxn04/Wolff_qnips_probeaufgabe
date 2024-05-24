import 'package:flutter/material.dart';
import 'package:qnips_probeaufgabe/models/old_product.dart';
import 'package:qnips_probeaufgabe/widgets/product_page_widget.dart';

class ProductPage extends StatelessWidget {
  const ProductPage(
      {super.key,
      required this.products,
      required this.productsMap,
      required this.initalDayIndex});

  final Map<int, OldProduct> productsMap;
  final List<dynamic> products;
  final int initalDayIndex;

  @override
  Widget build(BuildContext context) {
    final PageController pageController =
        PageController(initialPage: initalDayIndex);
    return Scaffold(
        appBar: AppBar(),
        body: PageView.builder(
          controller: pageController,
          itemCount: products.length,
          itemBuilder: (context, index) {
            int productIndex = products[index]['Weekday'];
            int productId = products[index]['ProductIds'][0]['ProductId'];
            return ProductPageWidget(
              nameOfTheDay: getDayByIndex(productIndex), product: productsMap[productId]!,);
          },
        ));
  }

  static String getDayByIndex(int index) {
    switch (index) {
      case 0:
        return "Montag";
      case 1:
        return "Dienstag";
      case 2:
        return "Mittwoch";
      case 3:
        return "Donnerstag";
      case 4:
        return "Freitag";
      case 5:
        return "Samstag";
      case 6:
        return "Sonntag";
      default:
        return "WrongIndex";
    }
  }
}
