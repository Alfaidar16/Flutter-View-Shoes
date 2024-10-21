import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_latihan_1/theme.dart';

class CheckoutCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      decoration: BoxDecoration(
          color: bgColor4, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image:
                    DecorationImage(image: AssetImage('assets/image 31.png'))),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sepatu Bola",
                  style:
                      primaryStyle.copyWith(fontSize: 14, fontWeight: semiBold),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "\$123,444",
                  style: priceTextStyle,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            "2 Items",
            style: secondaryTextStyle.copyWith(fontSize: 12),
          )
        ],
      ),
    );
  }
}
