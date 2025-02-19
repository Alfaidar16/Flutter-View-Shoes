import 'package:flutter/material.dart';
import 'package:flutter_latihan_1/models/product_model.dart';
import 'package:flutter_latihan_1/services/product_service.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  set products(List<ProductModel> products) {
    _products = products;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<ProductModel> products = await ProductService().getProducts();
      this.products = products;
    } catch (e) {
      print('Error fetching products: $e');
    }
  }
}
