import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:qnips_probeaufgabe/models/old_product.dart';
import 'package:sizer/sizer.dart';

class ProductPageWidget extends StatelessWidget {
  const ProductPageWidget(
      {super.key, required this.nameOfTheDay, required this.product});

  final String nameOfTheDay;
  final OldProduct product;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: 10.h,
      width: 30.w,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 4.h,
            ),
            Text(
              nameOfTheDay,
              style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold, decoration: TextDecoration.underline, decorationThickness: 1),
            ),
            SizedBox(height: 5.h),
            AutoSizeText(
              product.productName,
              style: TextStyle(fontSize: 18.sp),
              minFontSize: 8.sp.floorToDouble(),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              stepGranularity: 1,
            ),
            AutoSizeText(product.allergens.join(", "), style: TextStyle(fontSize: 18.sp)),
            Text("${product.price.toString()}€", style: TextStyle(fontSize: 18.sp)),
            const Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text("\u21E6 Swipe Left | Swipe Right \u21E8"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
