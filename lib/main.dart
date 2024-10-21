import 'package:flutter/material.dart';
import 'package:flutter_latihan_1/pages/cart_page.dart';
import 'package:flutter_latihan_1/pages/checkout_page.dart';
import 'package:flutter_latihan_1/pages/detail_chat.dart';
import 'package:flutter_latihan_1/pages/edit_profile_page.dart';
import 'package:flutter_latihan_1/pages/product_page.dart';
import 'package:flutter_latihan_1/pages/sign_in_page.dart';
import 'package:flutter_latihan_1/pages/splash_page.dart';
import 'package:flutter_latihan_1/providers/auth_provider.dart';
import 'package:flutter_latihan_1/providers/like_provider.dart';
import 'package:flutter_latihan_1/providers/product_provider.dart';
import 'package:flutter_latihan_1/widgets/product_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_latihan_1/theme.dart';
import 'package:flutter_latihan_1/pages/sign_up_page.dart';
import 'package:flutter_latihan_1/pages/home/main_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => LikeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/sign-In': (context) => SignInPage(),
          '/sign-Up': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/detail-chat': (context) => DetailChatPage(),
          '/edit-profile': (context) => EditProfilePage(),
          // '/product': (context) => ProductPage(),
          '/card': (context) => CardPage(),
          '/checkout': (context) => Keranjang()
        },
        // home: SplashPage(),
      ),
    );
  }
}
