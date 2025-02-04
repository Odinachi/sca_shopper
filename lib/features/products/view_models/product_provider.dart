import 'package:flutter/cupertino.dart';
import 'package:sca_shopper/models/response_model/product_model.dart';

class ProductProvider extends ChangeNotifier {
  // List<ProductModel> _products = [];

//key: the product id
  final Map<num, ({int count, ProductModel model})?> _map = {};

  Map<num, ({int count, ProductModel model})?> get map => _map;

  // List<ProductModel> get productList => _products;

  void addItem(ProductModel? item) {
    if (item != null) {
      if (_map[item.id] != null) {
        _map[item.id ?? 0] = (count: _map[item.id]!.count + 1, model: item);
      } else {
        _map[item.id ?? 0] = (count: 1, model: item);
      }
      // _products.add(item);
      notifyListeners();
    }
  }

  void clearCart() {
    _map.clear();
    notifyListeners();
  }

  void removeItem(ProductModel? item) {
    if (item != null && _map[item.id] != null) {
      // final index = _products.indexWhere((e) => e.id == item.id);
      // _products.removeAt(index);

      if ((_map[item.id]?.count ?? 0) < 2) {
        _map.remove(item.id ?? 0);
      } else {
        _map[item.id ?? 0] =
            (count: (_map[item.id ?? 0]?.count ?? 0) - 1, model: item);
      }

      notifyListeners();
    }
  }
}
