import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_latihan_1/providers/auth_provider.dart';
import 'package:flutter_latihan_1/theme.dart';
import 'package:flutter_latihan_1/widgets/loading_page.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController phoneController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleSignUp() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.register(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        phone: phoneController.text,
      )) {
        Navigator.pushNamed(context, '/sign-In');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              "Register Gagal",
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
      setState(() {
        isLoading = false;
      });
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 40),
        child: Column(
          // agar text menjadi rata kiri
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign Up',
              style: primaryStyle.copyWith(fontSize: 30, fontWeight: medium),
            ),
            SizedBox(height: 2),
            Text("Sign Up To Users", style: textSubtitile),
          ],
        ),
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Full Name",
              style: primaryStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(height: 12),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: bgColor2, borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/Username_Icon.png',
                      width: 17,
                    ),
                    SizedBox(
                      width: 16,
                    ),

                    // Expanded Ini fungsi nya untuk menyesuaikan text pada Text Field
                    Expanded(
                      child: TextFormField(
                        style: primaryStyle,
                        controller: nameController,
                        // .colpased merupakan menghilangkan garis bawah
                        decoration: InputDecoration.collapsed(
                            hintText: "Your Full Name",
                            hintStyle: textSubtitile),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget usernameInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "No Handphone",
              style: primaryStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(height: 12),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: bgColor2, borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_username.png',
                      width: 17,
                    ),
                    SizedBox(
                      width: 16,
                    ),

                    // Expanded Ini fungsi nya untuk menyesuaikan text pada Text Field
                    Expanded(
                      child: TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        style: primaryStyle,
                        // .colpased merupakan menghilangkan garis bawah
                        decoration: InputDecoration.collapsed(
                            hintText: "Masukkan Nomor Hp",
                            hintStyle: textSubtitile),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email Address",
              style: primaryStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(height: 12),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: bgColor2, borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/Email_Icon.png',
                      width: 17,
                    ),
                    SizedBox(
                      width: 16,
                    ),

                    // Expanded Ini fungsi nya untuk menyesuaikan text pada Text Field
                    Expanded(
                      child: TextFormField(
                        style: primaryStyle,
                        controller: emailController,
                        // .colpased merupakan menghilangkan garis bawah
                        decoration: InputDecoration.collapsed(
                            hintText: "Your Email Addres",
                            hintStyle: textSubtitile),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Password",
              style: primaryStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(height: 12),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: bgColor2, borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/Password_Icon.png',
                      width: 17,
                    ),
                    SizedBox(
                      width: 16,
                    ),

                    // Expanded Ini fungsi nya untuk menyesuaikan text pada Text Field
                    Expanded(
                      child: TextFormField(
                        obscureText: true,
                        style: primaryStyle,
                        controller: passwordController,
                        // .colpased merupakan menghilangkan garis bawah
                        decoration: InputDecoration.collapsed(
                            hintText: "Your Password",
                            hintStyle: textSubtitile),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget signUpButton() {
      return Container(
        height: 50,
        // fungsi infinity memnysuaikan width layar
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: handleSignUp,
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: Text(
            'Sign Up',
            style: primaryStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        // padding: EdgeInsets.symmetric(horizontal: 70),
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sudah Punya Akun ?',
              style: textSubtitile.copyWith(fontSize: 12, fontWeight: medium),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/sign-In'),
              child: Text(
                'Sign In',
                style:
                    purpleTextStyle.copyWith(fontSize: 12, fontWeight: medium),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor1,
      resizeToAvoidBottomInset: false,
      // widget SafeArea berfungsi agar content tidak tertutup dengan tapp bar
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              nameInput(),
              usernameInput(),
              emailInput(),
              passwordInput(),
              isLoading ? LoadingButton() : signUpButton(),
              Spacer(),
              footer()
            ],
          ),
        ),
      ),
    );
  }
}
