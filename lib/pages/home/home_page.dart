import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_latihan_1/models/user_model.dart';
import 'package:flutter_latihan_1/providers/auth_provider.dart';
import 'package:flutter_latihan_1/providers/product_provider.dart';
import 'package:flutter_latihan_1/theme.dart';
import 'package:flutter_latihan_1/widgets/product_page.dart';

import 'package:flutter_latihan_1/widgets/product_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello ${user.name}",
                    style: primaryStyle.copyWith(
                        fontSize: 24, fontWeight: semiBold),
                  ),
                  Text(
                    '@${user.email}',
                    style: textSubtitile.copyWith(fontSize: 16),
                  )
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image:
                      DecorationImage(image: AssetImage("assets/Profile.png"))),
            )
          ],
        ),
      );
    }

    Widget categories() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: defaultMargin),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: primaryColor),
                margin: EdgeInsets.only(right: 16),
                child: Text(
                  'All Shoes',
                  style: primaryStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: subtitle,
                    ),
                    color: transparentColor),
                margin: EdgeInsets.only(right: 16),
                child: Text(
                  'Hiking',
                  style: textSubtitile.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: subtitle,
                    ),
                    color: transparentColor),
                margin: EdgeInsets.only(right: 16),
                child: Text(
                  'Running',
                  style: textSubtitile.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: subtitle,
                    ),
                    color: transparentColor),
                margin: EdgeInsets.only(right: 16),
                child: Text(
                  'Adidas',
                  style: textSubtitile.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: subtitle,
                    ),
                    color: transparentColor),
                child: Text(
                  'Nike',
                  style: textSubtitile.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget popularProductTitle() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Text("Popular Productss",
            style: primaryStyle.copyWith(fontSize: 24, fontWeight: semiBold)),
      );
    }

    Widget popularProduct() {
      return Container(
        margin: const EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Row(
                children: productProvider.products
                    .map((products) => ProductCard(products))
                    .toList(),

                // children: [ProductCard()],
              )
            ],
          ),
        ),
      );
    }

    Widget arrivalTitle() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Text("New Arrival ",
            style: primaryStyle.copyWith(fontSize: 24, fontWeight: semiBold)),
      );
    }

    Widget newArrivals() {
      return Container(
        margin: const EdgeInsets.only(top: 14),
        child: Column(
          children: productProvider.products
              .map(
                (products) => ProductTile(products),
              )
              .toList(),
          // children: [
          //   ProductTile(),
          //   ProductTile(),
          //   ProductTile(),
          //   ProductTile()
          // ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: bgColor4,
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            header(),
            categories(),
            popularProductTitle(),
            popularProduct(),
            arrivalTitle(),
            newArrivals()
          ],
        ));
  }
}
