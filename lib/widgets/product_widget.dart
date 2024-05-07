import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:qnips_probeaufgabe/models/product.dart';
import 'package:sizer/sizer.dart';


class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.product});

  final Product product;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AutoSizeText(
          product.productName,
          style: TextStyle(fontSize: 10.sp),
          minFontSize: 8.sp.floorToDouble(),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          stepGranularity: 1,
        ),
        Text(product.allergens.join(", "), style: TextStyle(fontSize: 10.sp), textAlign: TextAlign.left),
        Text("${product.price}€", style: TextStyle(fontSize: 10.sp), textAlign: TextAlign.left,)
      ],
    );
  }
}
