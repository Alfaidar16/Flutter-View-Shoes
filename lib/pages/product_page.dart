import 'dart:js';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_latihan_1/models/product_model.dart';
import 'package:flutter_latihan_1/providers/like_provider.dart';
import 'package:flutter_latihan_1/theme.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  final ProductModel products;
  ProductPage(this.products);
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List images = [
    'assets/image 31.png',
    'assets/image 31.png',
    'assets/image 31.png'
  ];

  List familiarShoes = [
    'assets/image 31.png',
    'assets/image 31.png',
    'assets/image 31.png',
    'assets/image 31.png',
    'assets/image 31.png',
    'assets/image 31.png',
    'assets/image 31.png',
    'assets/image 31.png',
    'assets/image 31.png'
  ];

  int currentIndex = 0;
  // bool isLike = false;

  @override
  Widget build(BuildContext context) {
    LikeProvider likeProvider = Provider.of<LikeProvider>(context);
    // Modal Dialog
    Future<void> showSuccessDialog() {
      return showDialog(
          context: context,
          builder: (BuildContext context) => Container(
                width: MediaQuery.of(context).size.width - (2 * defaultMargin),
                child: AlertDialog(
                  backgroundColor: bgColor3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  content: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Icons.close,
                              color: textColor,
                            ),
                          ),
                        ),
                        Image.asset(
                          'assets/Icon_success1.png',
                          width: 100,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Huray",
                          style: primaryStyle.copyWith(
                              fontSize: 18, fontWeight: semiBold),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Berhasil",
                          style: secondaryTextStyle,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 154,
                          height: 44,
                          child: GestureDetector(
                            onTap: () {},
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                              onPressed: () {},
                              child: Text(
                                'View My Cart',
                                style: primaryStyle.copyWith(
                                    fontSize: 16, fontWeight: medium),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ));
    }

    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? 16 : 4,
        height: 4,
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: currentIndex == index ? primaryColor : Color(0xffC4C4C4)),
      );
    }

    Widget familiarcard(String imageUrl) {
      return Container(
        width: 54,
        height: 54,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(6)),
      );
    }

    Widget header() {
      int index = -1;
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: 20, left: defaultMargin, right: defaultMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.chevron_left),
                ),
                Icon(
                  Icons.shopping_bag,
                  color: bgColor1,
                )
              ],
            ),
          ),
          CarouselSlider(
            items: images
                .map(
                  (image) => Image.asset(
                    image,
                    width: MediaQuery.of(context).size.width,
                    height: 310,
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
            options: CarouselOptions(
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                }),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((e) {
              index++;
              return indicator(index);
            }).toList(),
          )
        ],
      );
    }

    // Content Detail Product
    Widget content() {
      int index = -1;
      return Container(
        margin: EdgeInsets.only(top: 17),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(45),
            ),
            color: bgColor1),
        child: Column(
          // Note Header
          children: [
            Container(
              // width: double.infinity,
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Shoes BasketBall",
                          style: primaryStyle.copyWith(
                              fontSize: 18, fontWeight: semiBold),
                        ),
                        Text(
                          "Hikin",
                          style: secondaryTextStyle.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      likeProvider.setProduct(widget.products);
                      // setState(() {
                      //   isLike = !isLike;
                      // });
                      if (likeProvider.isLike(widget.products)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: secondaryColor,
                            content: const Text(
                              "Has been added to the Whitelist",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: alertColor,
                            content: const Text(
                              "Has been added to the Whitelist",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                    },
                    child: Image.asset(
                      likeProvider.isLike(widget.products)
                          ? 'assets/Love Icon.png'
                          : 'assets/icon_like.png',
                      width: 46,
                    ),
                  )
                ],
              ),
            ),

            // Price Container
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  top: 20, left: defaultMargin, right: defaultMargin),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: bgColor2, borderRadius: BorderRadius.circular(4)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price Start From',
                    style: primaryStyle,
                  ),
                  Text(
                    '\$56,727',
                    style: priceTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                ],
              ),
            ),

            // Note Description

            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                  top: defaultMargin,
                  left: defaultMargin,
                  right: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: primaryStyle.copyWith(fontWeight: medium),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Unpaved trails and mixed surfaces are easy when you have the traction and support you need. Casual enough for the daily commute.",
                    style: textSubtitile.copyWith(fontWeight: light),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),

            // Note Familiar Shoes
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Text(
                      'Familiar Shoes',
                      style: primaryStyle.copyWith(fontWeight: medium),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: familiarShoes.map((image) {
                        index++;
                        return Container(
                            margin: EdgeInsets.only(
                                left: index == 0 ? defaultMargin : 0),
                            child: familiarcard(image));
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),

            // Note Buttons
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(defaultMargin),
              child: Row(
                children: [
                  Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/Chat Icon.png',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      height: 54,
                      child: TextButton(
                        onPressed: () {
                          showSuccessDialog();
                        },
                        style: TextButton.styleFrom(
                            // primaryColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: primaryColor),
                        child: Text(
                          'Add To Cart',
                          style: primaryStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: bgColor6,
        body: ListView(
          children: [header(), content()],
        ));
  }
}
