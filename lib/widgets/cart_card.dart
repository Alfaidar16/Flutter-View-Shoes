import 'package:flutter/material.dart';
import 'package:flutter_latihan_1/theme.dart';

class CartCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultMargin),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage('assets/image 31.png'),
                  ),
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
                    "Pesanan Anda",
                    style: primaryStyle.copyWith(
                        fontSize: 14, fontWeight: semiBold),
                  ),
                  Text(
                    "\$123,600",
                    style: priceTextStyle,
                  )
                ],
              )),
              Column(
                children: [
                  Image.asset(
                    'assets/Add Jumlah Item.png',
                    width: 16,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "2",
                    style: primaryStyle.copyWith(fontWeight: medium),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Image.asset(
                    'assets/Reduce Jumlah Item.png',
                    width: 16,
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Image.asset(
                'assets/icon_delete.png',
                width: 10,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                'Remove',
                style: alertStyle.copyWith(fontSize: 14, fontWeight: light),
              )
            ],
          )
        ],
      ),
    );
  }
}
