import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/cart_screen.dart';
import '../providers/cart.dart';
import '../widgets/app_drawer.dart';
import '../widgets/badge.dart';
import '../widgets/products_grid.dart';
import '/widgets/products_grid.dart';

enum FilterOptions { favorites, all }

class ProductOverviewScreen extends StatefulWidget {
  static const routName = '/ProductOverviewScreen';
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

var _showfavorites = false;

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'MyShop',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectValue) {
              setState(() {
                if (selectValue == FilterOptions.favorites) {
                  _showfavorites = true;
                } else {
                  _showfavorites = false;
                }
              });
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                  value: FilterOptions.favorites,
                  child: Text('Only Favorites',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20))),
              const PopupMenuItem(
                  value: FilterOptions.all,
                  child: Text('All',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20))),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cartData, ch) => Badge(
              value: cartData.itemCount.toString(),
              color: Colors.red,
              child: ch as Widget,
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routName);
              },
            ),
          )
        ],
      ),
        drawer:AppDrawer(),
      body: ProductsGrid(_showfavorites),
    );
  }
}
