import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_latihan_1/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_latihan_1/providers/auth_provider.dart';
import 'package:flutter_latihan_1/widgets/loading_page.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController =
      TextEditingController(text: 'rafli@gmail.com');
  TextEditingController passwordController =
      TextEditingController(text: 'rafli123');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleSignIn() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.login(
        email: emailController.text,
        password: passwordController.text,
      )) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: Text(
              "Login Gagal",
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
        margin: EdgeInsets.only(top: 90),
        child: Column(
          // agar text menjadi rata kiri
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: primaryStyle.copyWith(fontSize: 30, fontWeight: medium),
            ),
            SizedBox(height: 2),
            Text("Sign In To Continue", style: textSubtitile),
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email Address",
              style: primaryStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const SizedBox(height: 12),
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
                    const SizedBox(
                      width: 16,
                    ),

                    // Expanded Ini fungsi nya untuk menyesuaikan text pada Text Field
                    Expanded(
                      child: TextFormField(
                        controller: emailController,
                        style: primaryStyle,
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
                        controller: passwordController,
                        obscureText: true,
                        style: primaryStyle,
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

    Widget signInButton() {
      return Container(
        height: 50,
        // fungsi infinity memnysuaikan width layar
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: handleSignIn,
          // onPressed: () {
          //   Navigator.pushNamed(context, '/home');
          // },
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: Text(
            'Sign In',
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
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Dont\'t have you Account?',
              style: textSubtitile.copyWith(fontSize: 12, fontWeight: medium),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/sign-Up'),
              child: Text(
                'Sign Up',
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
              emailInput(),
              passwordInput(),
              isLoading ? LoadingButton() : signInButton(),
              Spacer(),
              footer()
            ],
          ),
        ),
      ),
    );
  }
}
