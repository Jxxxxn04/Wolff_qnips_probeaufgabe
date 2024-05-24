import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:qnips_probeaufgabe/models/old_product.dart';
import 'package:sizer/sizer.dart';

import '../models/response.dart';


class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.productIds, required this.responseBody});

  final List<int> productIds;
  final Response responseBody;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final id in productIds) ...[
          AutoSizeText(
            responseBody.products[id.toString()]?.name ?? "Kein name",
            style: TextStyle(fontSize: 10.sp),
            minFontSize: 8.sp.floorToDouble(),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            stepGranularity: 1,
          ),
          Text(
            "${responseBody.products[id.toString()]?.price.betrag.toStringAsPrecision(3).replaceAll('.', ',')}€" ?? "Kein Preis",
            style: TextStyle(fontSize: 10.sp),
            textAlign: TextAlign.left,
          ),
        ],
      ],
    );

  }
}
