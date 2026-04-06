import 'model_menu.dart';

class CartModel {
  final MenuModel menu;
  int qty;

  CartModel({
    required this.menu,
    this.qty = 1,
  });

  int get totalPrice => menu.price * qty;
}