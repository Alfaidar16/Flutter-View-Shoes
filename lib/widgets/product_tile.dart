import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_latihan_1/models/product_model.dart';
import 'package:flutter_latihan_1/pages/product_page.dart';
import 'package:flutter_latihan_1/theme.dart';

class ProductTile extends StatelessWidget {
  final ProductModel products;
  ProductTile(this.products);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductPage(products)));
      },
      child: Container(
        margin: EdgeInsets.only(
            left: defaultMargin, right: defaultMargin, bottom: defaultMargin),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                products.url,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  products.nama,
                  style: secondaryTextStyle.copyWith(fontSize: 12),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  products.namaProduct,
                  style:
                      primaryStyle.copyWith(fontSize: 15, fontWeight: semiBold),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  "\$${products.harga}",
                  style: priceTextStyle.copyWith(fontWeight: semiBold),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
