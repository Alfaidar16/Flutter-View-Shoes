import 'dart:convert';
import 'package:flutter_latihan_1/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  String urlProduct = '';

  Future<List<ProductModel>> getProducts() async {
    var uri = '$urlProduct/products';

    var url = Uri.parse(uri);
    // print(url);
    var headers = {'Content-type': 'application/json'};
    var response = await http.get(
      url,
      headers: headers,
    );

    print(response.body);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<ProductModel> products = [];

      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }
      return products;
    } else {
      throw Exception('Failed to fetch product data');
    }
  }
}
