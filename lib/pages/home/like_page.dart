import 'package:flutter/material.dart';
import 'package:flutter_latihan_1/providers/like_provider.dart';
import 'package:flutter_latihan_1/theme.dart';
import 'package:flutter_latihan_1/widgets/likes_page.dart';
import 'package:provider/provider.dart';

class LikePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LikeProvider likeProvider = Provider.of<LikeProvider>(context);
    Widget header() {
      return AppBar(
        backgroundColor: bgColor1,
        centerTitle: true,
        title: Text(
          "Favorite Shoes",
          style: primaryStyle.copyWith(fontSize: 16),
        ),
        elevation: 0,
      );
    }

    Widget emptyWishlist() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: bgColor3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Love Icon.png',
                width: 74,
              ),
              SizedBox(
                height: 23,
              ),
              Text(
                "Product Favoritte Shoes",
                style: primaryStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Product Favoritte Shoes",
                style: secondaryTextStyle,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 44,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: Text(
                    "Explore Text",
                    style:
                        primaryStyle.copyWith(fontSize: 16, fontWeight: medium),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
          child: Container(
        color: bgColor3,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: likeProvider.like.map((e) => LikeCard()).toList(),
        ),
      ));
    }

    return Column(
      children: [
        header(),
        // emptyWishlist(),
        content()
      ],
    );
  }
}
