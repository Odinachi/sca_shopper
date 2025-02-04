import 'package:flutter/cupertino.dart';
import 'package:sca_shopper/models/response_model/product_model.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> _products = [];

  // Map<String, ProductModel> map = {};

  List<ProductModel> get productList => _products;

  void addItem(ProductModel? item) {
    if (item != null) {
      _products.add(item);
      notifyListeners();
    }
  }

  void removeItem(ProductModel? item) {
    if (item != null && _products.where((e) => e.id == item.id).isNotEmpty) {
      final index = _products.indexWhere((e) => e.id == item.id);
      _products.removeAt(index);
      notifyListeners();
    }
  }
}
