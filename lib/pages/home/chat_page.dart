import 'package:flutter/material.dart';
import 'package:flutter_latihan_1/theme.dart';
import 'package:flutter_latihan_1/widgets/chat_tile.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: bgColor1,
        centerTitle: true,
        title: Text(
          'Message Supports',
          style: primaryStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyChat() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: bgColor3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Headset Icon.png',
                width: 80,
              ),
              SizedBox(height: 20),
              Text(
                "Oops Text Message",
                style: primaryStyle.copyWith(fontSize: 14, fontWeight: medium),
              ),
              SizedBox(
                height: 12,
              ),
              Text("You Have Are To Transaction", style: textSubtitile),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 44,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: Text(
                    "Explore Text",
                    style:
                        primaryStyle.copyWith(fontSize: 14, fontWeight: medium),
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
            width: double.infinity,
            color: bgColor3,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              children: [ChatTile()],
            )),
      );
    }

    return Column(
      children: [header(), content()],
    );
  }
}
