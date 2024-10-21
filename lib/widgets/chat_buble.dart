import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_latihan_1/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSender;
  final hasProduct;

  ChatBubble({this.isSender = false, this.text = '', this.hasProduct = false});

  @override
  Widget build(BuildContext context) {
    Widget productPreview() {
      return Container(
        width: 250,
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(isSender ? 12 : 0),
              topRight: Radius.circular(isSender ? 0 : 12),
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            color: isSender ? bgColor5 : bgColor4),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/image 31.png',
                    width: 70,
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "COURT VISION 2.0 SHOES",
                        style: primaryStyle.copyWith(fontWeight: regular),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "\$54.09",
                        style: priceTextStyle.copyWith(fontWeight: regular),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(color: primaryColor),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: Text(
                    "Add To Cart",
                    style: purpleTextStyle,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Text(
                      "Buy Now",
                      style: GoogleFonts.poppins(
                          color: bgColor5, fontWeight: medium),
                    ))
              ],
            )
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          hasProduct ? productPreview() : SizedBox(),
          Row(
            mainAxisAlignment:
                isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.6),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12)),
                      color: isSender ? bgColor5 : bgColor4),
                  child: Text(
                    text,
                    style: primaryStyle,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
