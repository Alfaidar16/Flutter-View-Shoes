import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_latihan_1/theme.dart';
import 'package:flutter_latihan_1/widgets/cart_card.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: bgColor1,
        centerTitle: true,
        title: Text(
          ' Your Card',
          style: primaryStyle,
        ),
        elevation: 0,
      );
    }

    Widget emptyCard() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Cart icon.png',
              width: 80,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Anda Belum Pesan",
              style: primaryStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Silahkan Pesan Sebelumnya',
              style: secondaryTextStyle,
            ),
            Container(
              width: 154,
              height: 44,
              margin: EdgeInsets.only(top: 20),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false);
                },
                child: Text(
                  "Explore Store",
                  style:
                      primaryStyle.copyWith(fontSize: 16, fontWeight: medium),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [CartCard()],
      );
    }

    Widget customBottomNav() {
      return Container(
        height: 180,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "SubTotoal",
                    style: primaryStyle,
                  ),
                  Text(
                    "\$123,333",
                    style: priceTextStyle,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              color: subtitle,
              thickness: 0.3,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () {
                  Navigator.pushNamed(context, '/checkout');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Continue To ChekOut",
                      style: primaryStyle.copyWith(
                          fontWeight: semiBold, fontSize: 16),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: textColor,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: header(),
      body: content(),
      bottomNavigationBar: customBottomNav(),
    );
  }
}
