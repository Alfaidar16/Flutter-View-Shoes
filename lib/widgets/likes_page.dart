import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_latihan_1/theme.dart';

class LikeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Membuat Halaman Card Content
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: bgColor4),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/image 31.png',
              width: 60,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Shoes BasketBalsl",
                  style: primaryStyle.copyWith(fontWeight: semiBold),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "\$584,99",
                  style: priceTextStyle.copyWith(fontWeight: semiBold),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/Icon Love1.png',
            width: 34,
          )
        ],
      ),
    );
  }
}
