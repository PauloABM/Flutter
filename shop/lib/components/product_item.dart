import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.name),
      subtitle: Text(product.price.toString()),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(AppRoutes.PRODUCT_FORM, arguments: product);
            },
            color: Theme.of(context).colorScheme.primary,
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              showDialog<bool>(
                  context: context,
                  builder: (ctx) => AlertDialog(
                        title: Text('Excluir Produto'),
                        content: Text('Tem certeza?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: Text('Não'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            child: Text('Sim'),
                          ),
                        ],
                      )).then((value) {
                if (value != null) {
                  Provider.of<ProductList>(context, listen: false)
                      .removeProduct(product);
                }
              });
            },
            color: Theme.of(context).colorScheme.error,
          ),
        ],
      ),
    );
  }
}
