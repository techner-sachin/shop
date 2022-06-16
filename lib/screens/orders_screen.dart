import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/order.dart'show  Orders;

import '../widgets/app_drawer.dart';
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);
  static const routeName = 'order-screen';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),),
     drawer: AppDrawer(),

     body:Container(
       margin: EdgeInsets.all(10),
       child:ListView.builder(itemBuilder: ( ctx,  i)=>OrderItem(orderData.orders[i]),
       itemCount: orderData.orders.length,)

     )
    );
  }
}
