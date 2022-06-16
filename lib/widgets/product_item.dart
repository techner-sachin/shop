import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/product.dart';
import '../screens/product_detail_screen.dart';
class ProductItem extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final product=Provider.of<Product>(context,listen: false);
    final cart = Provider.of<Cart>(context,listen: false);

    return ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: GridTile(
              footer: GridTileBar(
                backgroundColor: Colors.black45,
                leading: Consumer<Product>(
                  builder: ( ctx ,product , _) =>IconButton(
                    icon: Icon(
                      product.isFavorite ? Icons.favorite :Icons.favorite_border,color: Colors.red,),
                    onPressed: () {
                      product.favoriteStatus();
                    }
                    ),
                ),

                title: Text(
                  product.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),

                trailing: IconButton(icon: const Icon(Icons.shopping_cart),onPressed:(){
                  cart.addItem(product.id, product.price, product.title);
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(
                      content: const Text('Added item to the cart!',),
                      duration: const Duration(seconds: 2),
                      action:SnackBarAction(label:'Undo', onPressed: (){
                        cart.reoveSingleItem(product.id);
                      }),
                    ),
                  );
                },),
              ),

              child:GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamed(ProjectDetailScreen.routeName,arguments: product.id);

                },

                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),

    );

  }
}
