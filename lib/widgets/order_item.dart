import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/providers/order.dart' as ordr;

class OrderItem extends StatefulWidget {


  final ordr.OrderItem order;

  OrderItem(this.order);

  @override
  State<OrderItem> createState() => _OrderItemState();


}
var _expanded =false;

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [

            ListTile(
              title:Text('\$${widget.order.amount}', style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),),
              subtitle: Text(DateFormat('dd/MM/yyyy hh:mm').format(widget.order.datetime),
            ),
              trailing: IconButton(icon:const Icon(Icons.expand_more),
                onPressed: () {
                setState((){
                  _expanded=!_expanded;
                });
                },),
            ),
            if(_expanded)
              Container(
                padding: const  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                height: min(widget.order.product.length * 20.0+100, 180),
                child:ListView(
                  children:
                    widget.order.product.map(
                        (prod)=>Row(

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Text(prod.title,
                            style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),),
                          Text('${prod.quantity}x \$${prod.price}',
                            style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,), )
                        ],)
                    ).toList()

                )
              )


          ],

        ));
  }
}
