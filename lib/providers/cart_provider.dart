import 'package:flutter/material.dart';
import '../models/cart_model.dart';
import '../models/model_menu.dart';

class CartProvider with ChangeNotifier {
  final List<CartModel> _items = [];

  /// 🔥 GET ITEMS
  List<CartModel> get items => _items;

  /// 🛒 ADD TO CART
  void addToCart(MenuModel menu) {
    final index = _items.indexWhere(
      (item) => item.menu.name == menu.name,
    );

    if (index != -1) {
      _items[index].qty++;
    } else {
      _items.add(CartModel(menu: menu));
    }

    notifyListeners();
  }

  /// ➕ TAMBAH QTY
  void increaseQty(CartModel item) {
    item.qty++;
    notifyListeners();
  }

  /// ➖ KURANG QTY
  void decreaseQty(CartModel item) {
    if (item.qty > 1) {
      item.qty--;
    } else {
      _items.remove(item);
    }
    notifyListeners();
  }

  /// 💰 TOTAL HARGA
  int get totalPrice {
    return _items.fold(0, (sum, item) => sum + item.totalPrice);
  }

  /// 🧹 CLEAR CART
  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  /// 🔢 TOTAL ITEM (UNTUK BADGE)
  int get totalItems {
    return _items.fold(0, (sum, item) => sum + item.qty);
  }
}