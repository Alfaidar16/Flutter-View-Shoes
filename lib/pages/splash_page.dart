import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_latihan_1/providers/product_provider.dart';
import 'package:flutter_latihan_1/theme.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    getInit();
  }

  getInit() async {
    // Fetch products without navigating during widget initialization
    await Provider.of<ProductProvider>(context, listen: false).getProducts();
    Navigator.pushNamed(context, '/sign-In');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      body: Center(
        child: Container(
          width: 130,
          height: 150,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image_splash.png'),
            ),
          ),
        ),
      ),
    );
  }
}
