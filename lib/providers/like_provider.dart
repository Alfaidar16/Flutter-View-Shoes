import 'package:flutter/material.dart';
import 'package:flutter_latihan_1/models/product_model.dart';

class LikeProvider with ChangeNotifier {
  List<ProductModel> _like = [];
  List<ProductModel> get like => _like;

  set like(List<ProductModel> like) {
    _like = like;
    notifyListeners();
  }

  setProduct(ProductModel products) {
    if (!isLike(products)) {
      _like.add(products);
    } else {
      _like.removeWhere((element) => element.id == products.id);
    }
    notifyListeners();
  }

  isLike(ProductModel products) {
    if (_like.indexWhere((element) => element.id == products.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
