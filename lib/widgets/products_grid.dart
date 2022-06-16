import 'package:flutter/material.dart';
import 'package:shop_app/widgets/product_item.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFav;

  ProductsGrid(this.showFav);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFav ? productsData.favoriteItems :productsData.items ;
    return Container(
      margin: const EdgeInsets.all(20),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
            childAspectRatio: 3 / 3),
        itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
          value:products[index],
         // create: (c) => products[index],
          child: ProductItem(),
        ),
      ),
    );
  }
}
