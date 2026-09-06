import 'package:flutter_eccomerce/models/data_dummy.dart';
import 'package:flutter_eccomerce/models/product_model.dart';
import 'package:flutter_riverpod/legacy.dart';

class ProductsNotifier extends StateNotifier<List<Product>> {
  ProductsNotifier() : super(initialProducts);

  void toggleFavorite(String productId) {
    state = [
      for (final product in state)
        if (product.id == productId)
          product.copyWith(isFavorite: !product.isFavorite)
        else
          product,
    ];
  }
}

/// Global provider for catalog products with live favorite toggle support
final productsProvider =
    StateNotifierProvider<ProductsNotifier, List<Product>>((ref) {
  return ProductsNotifier();
});
