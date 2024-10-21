import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_latihan_1/theme.dart';
import 'package:flutter_latihan_1/widgets/chat_buble.dart';

class DetailChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            backgroundColor: bgColor1,
            centerTitle: false,
            title: Row(
              children: [
                Image.asset(
                  'assets/Logo Shop Picture.png',
                  width: 50,
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Shoes Stroe",
                      style: primaryStyle.copyWith(
                          fontSize: 14, fontWeight: medium),
                    ),
                    Text(
                      "Online",
                      style: secondaryTextStyle.copyWith(
                          fontSize: 12, fontWeight: light),
                    )
                  ],
                )
              ],
            ),
          ));
    }

    Widget productView() {
      return Container(
        width: 255,
        height: 74,
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: bgColor5,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: primaryColor),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/image 31.png',
                width: 54,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "COURT VISION",
                    style: primaryStyle.copyWith(
                        fontWeight: regular, overflow: TextOverflow.ellipsis),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "\$28,20",
                    style: priceTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                        overflow: TextOverflow.ellipsis),
                  )
                ],
              ),
            ),
            Image.asset(
              'assets/Close.png',
              width: 22,
            )
          ],
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            productView(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                        color: bgColor4,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'Silahkan Mengetik',
                          hintStyle: textSubtitile,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Image.asset(
                  'assets/Send Button.png',
                  width: 45,
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          ChatBubble(
            isSender: true,
            text: 'Apakah Barangnya Masih Ada?',
            hasProduct: true,
          ),
          ChatBubble(
            isSender: false,
            text: 'Iya Masih Ada Barangnya Apakah Minat?',
            hasProduct: false,
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: header(),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}
