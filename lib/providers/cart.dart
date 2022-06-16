
import 'package:flutter/material.dart';

class CartItem{
  final String id;
  final String title;
  final double price;
  final int quantity;

CartItem({
  required this.id,
  required this.title,
  required this.price,
  required this.quantity});

}
class Cart with ChangeNotifier{
   Map<String, CartItem> _items = {};
  Map<String, CartItem> get item{
    return {..._items};
  }

  int get itemCount{
    return _items.length;
  }
  double get totalAmount{
    var total = 0.0;
    _items.forEach((key, CartItem) {
      total += CartItem.price * CartItem.quantity;
    });
    return total;
  }
  void addItem (
      String productId,
      double price,
      String title){
    if (_items.containsKey(productId)){
      _items.update(productId, (existingCartItem) => CartItem(
          id: existingCartItem.id,
          price: existingCartItem.price,
          title: existingCartItem.title,
          quantity: existingCartItem.quantity+1),);
    }
    else{
      _items.putIfAbsent(
          productId, () => CartItem(id: DateTime.now().toString(),price: price,title: title, quantity: 1));
    }
    notifyListeners();
  }
  void removeItem(String productId){
    _items.remove(productId);
    notifyListeners();
  }
  
  void reoveSingleItem(String productId){
    
    if(!_items.containsKey(productId)){
      return;
      
    }
    if(_items[productId]!.quantity> 1){
      _items.update(productId, (existingCartItem) =>
          CartItem(
              id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price, quantity: existingCartItem.quantity-1));
    }
    else{
      _items.remove(productId);
    }
    notifyListeners();
  }
   void clear(){
     _items={};
     notifyListeners();
  }

}