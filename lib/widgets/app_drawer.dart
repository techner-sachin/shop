import 'package:flutter/material.dart';
import 'package:shop_app/screens/orders_screen.dart';
import 'package:shop_app/screens/user_product_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:Column(
        children: [
          AppBar(title:const Text(''),
          automaticallyImplyLeading: false,),
           Divider(),
          ListTile(
            leading: Icon(Icons.shop,size: 30,),
            title: const Text('Shop',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/');
            },

          ),
          ListTile(
            leading: Icon(Icons.payment,size: 30,),
            title: const Text('Orders',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
            },

          ),
          ListTile(
            leading: Icon(Icons.edit,size: 30,),
            title: const Text('My Products',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(UserProductScreen.routeName);
            },

          ),
        ],
      )
    );
  }
}
