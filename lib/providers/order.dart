import 'package:flutter/material.dart';

import '../widgets/cart_item.dart';
import 'cart.dart';

class OrderItem{
  final String id;
  final double amount;
  final List<CartItem> product;
  final DateTime datetime;

  OrderItem({
    required this.id,
    required this.amount,
    required this.product,
    required this.datetime
});

}

class Orders with ChangeNotifier{

  List<OrderItem> _orders=[];

  List<OrderItem> get orders{
    return [..._orders];

  }

  void addOrder(List<CartItem> cartProduct,double total){
    _orders.insert(0, OrderItem(
        id: DateTime.now().toString(),
        amount: total,
        product: cartProduct,
        datetime: DateTime.now()));
    notifyListeners();
  }

}