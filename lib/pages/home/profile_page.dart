import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_latihan_1/models/user_model.dart';
import 'package:flutter_latihan_1/theme.dart';
import 'package:flutter_latihan_1/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    Widget header() {
      return AppBar(
        backgroundColor: bgColor1,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
            child: Container(
          padding: EdgeInsets.all(defaultMargin),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/Image_profile.png',
                  width: 64,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${user.name}",
                    style: primaryStyle.copyWith(
                        fontSize: 24, fontWeight: semiBold),
                  ),
                  Text(
                    "${user.email}",
                    style: textSubtitile.copyWith(
                        fontSize: 16, fontWeight: regular),
                  )
                ],
              )),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/sign-In'),
                child: Image.asset(
                  'assets/Exit Button.png',
                  width: 20,
                ),
              )
            ],
          ),
        )),
      );
    }

    Widget menuItem(String text) {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: secondaryTextStyle.copyWith(fontSize: 14),
            ),
            Icon(
              Icons.chevron_right,
              color: primaryColor,
            )
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          width: double.infinity,
          decoration: BoxDecoration(color: bgColor3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Account",
                style:
                    primaryStyle.copyWith(fontSize: 16, fontWeight: semiBold),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/edit-profile'),
                child: menuItem("Edit Profile"),
              ),
              menuItem("Your Orders"),
              menuItem("Help"),
              SizedBox(
                height: 30,
              ),
              Text(
                "General",
                style: primaryStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              menuItem("Privacy & Policy"),
              menuItem("Term of Service"),
              menuItem("Rate App"),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [header(), content()],
    );
  }
}
