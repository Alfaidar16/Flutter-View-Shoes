import 'package:flutter/material.dart';
import 'package:flutter_latihan_1/models/user_model.dart';
import 'package:flutter_latihan_1/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_latihan_1/providers/auth_provider.dart';

class EditProfilePage extends StatefulWidget {
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    PreferredSizeWidget header() {
      return AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            color: textColor,
          ),
        ),
        backgroundColor: bgColor1,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: primaryStyle,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.check,
                color: primaryColor,
              ))
        ],
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name",
              style: secondaryTextStyle.copyWith(fontSize: 13),
            ),
            TextFormField(
              style: primaryStyle,
              decoration: InputDecoration(
                  hintText: "${user.name}",
                  hintStyle: primaryStyle,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: subtitle))),
            )
          ],
        ),
      );
    }

    Widget usernameInput() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "No Hp",
              style: secondaryTextStyle.copyWith(fontSize: 13),
            ),
            TextFormField(
              style: primaryStyle,
              decoration: InputDecoration(
                  hintText: "${user.phone}",
                  hintStyle: primaryStyle,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: subtitle))),
            )
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email",
              style: secondaryTextStyle.copyWith(fontSize: 13),
            ),
            TextFormField(
              style: primaryStyle,
              decoration: InputDecoration(
                  hintText: "${user.email}",
                  hintStyle: primaryStyle,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: subtitle))),
            )
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: defaultMargin),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/Image_profile.png'))),
            ),
            nameInput(),
            usernameInput(),
            emailInput()
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: header(),
      body: content(),
      resizeToAvoidBottomInset: false,
    );
  }
}
