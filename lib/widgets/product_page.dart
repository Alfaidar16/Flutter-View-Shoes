import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_latihan_1/models/product_model.dart';
import 'package:flutter_latihan_1/pages/product_page.dart';

import 'package:flutter_latihan_1/theme.dart';

class ProductCard extends StatelessWidget {
  final ProductModel products;
  ProductCard(this.products);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductPage(products)));
      },
      child: Container(
        width: 215,
        height: 278,
        margin: EdgeInsets.only(right: defaultMargin),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xffECEDEF)),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.network(
              products.url,
              width: 215,
              height: 150,
              fit: BoxFit.cover,
            ),
            Container(
              // margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  Text(products.nama,
                      style: textSubtitile.copyWith(fontSize: 12)),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    products.namaProduct,
                    style: blackTextStyle.copyWith(
                        fontSize: 15, fontWeight: semiBold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    '\$${products.harga}',
                    style: priceTextStyle.copyWith(
                        fontSize: 14, fontWeight: medium),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
