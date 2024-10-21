import 'package:flutter/material.dart';
import 'package:flutter_latihan_1/theme.dart';
import 'package:flutter_latihan_1/widgets/checkout_card.dart';

class Keranjang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: bgColor1,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Checkout Detail",
          style: primaryStyle,
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Note Item
                Text(
                  "List Items",
                  style:
                      primaryStyle.copyWith(fontSize: 16, fontWeight: medium),
                ),
                CheckoutCard(),
                CheckoutCard(),
              ],
            ),
          ),

          // Note  Address Details
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: bgColor4,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Address Detail",
                  style:
                      primaryStyle.copyWith(fontSize: 16, fontWeight: medium),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/Restaurant Icon.png',
                          width: 40,
                        ),
                        Image.asset(
                          'assets/Line 1.png',
                          height: 30,
                        ),
                        Image.asset(
                          'assets/Location Icon.png',
                          width: 40,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Store Location",
                          style: secondaryTextStyle.copyWith(
                              fontSize: 12, fontWeight: light),
                        ),
                        Text(
                          "Adidas Store",
                          style: primaryStyle.copyWith(
                              fontSize: 14, fontWeight: medium),
                        ),
                        SizedBox(
                          height: defaultMargin,
                        ),
                        Text(
                          "Maros Tamrampu",
                          style: secondaryTextStyle.copyWith(
                              fontSize: 12, fontWeight: light),
                        ),
                        Text(
                          "Kariango",
                          style: primaryStyle.copyWith(
                              fontSize: 14, fontWeight: medium),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),

          // Note Payment Details
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: bgColor4,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Payemnet Summary",
                  style:
                      primaryStyle.copyWith(fontSize: 16, fontWeight: medium),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Product Quantyty",
                      style: secondaryTextStyle.copyWith(fontSize: 12),
                    ),
                    Text(
                      "2 Items",
                      style: primaryStyle.copyWith(
                          fontSize: 12, fontWeight: medium),
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Harga Product",
                      style: secondaryTextStyle.copyWith(fontSize: 12),
                    ),
                    Text(
                      "\$123,123",
                      style: primaryStyle.copyWith(
                          fontSize: 12, fontWeight: medium),
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ongkir",
                      style: secondaryTextStyle.copyWith(fontSize: 12),
                    ),
                    Text(
                      "Free",
                      style: primaryStyle.copyWith(
                          fontSize: 12, fontWeight: medium),
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Divider(
                  thickness: 1,
                  color: Color(0xff2E3141),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: priceTextStyle.copyWith(
                          fontSize: 14, fontWeight: semiBold),
                    ),
                    Text(
                      "\$123,123",
                      style: priceTextStyle.copyWith(
                          fontSize: 14, fontWeight: semiBold),
                    )
                  ],
                )
              ],
            ),
          ),

          // Note Cheout Button
          SizedBox(
            height: defaultMargin,
          ),
          Divider(
            thickness: 1,
            color: Color(0xff2E3141),
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.symmetric(vertical: defaultMargin),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              onPressed: () {},
              child: Text(
                "Checkout Now",
                style:
                    primaryStyle.copyWith(fontWeight: semiBold, fontSize: 16),
              ),
            ),
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: header(),
      body: content(),
    );
  }
}
