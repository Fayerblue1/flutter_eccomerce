/// Consolidated Product entity that represents both general products
/// and wishlist/favorite items across the application.
class Product {
  final String id;
  final String name;
  final String image;
  final double price;
  final double? originalPrice;
  final int discount;
  final double rating;
  final int sold;
  final String location;
  final String category;
  final bool isFreeShipping;
  final bool isOfficial;
  final bool isFavorite;
  final String? leaderBoard;
  final bool ramadhanSeru;
  final bool localProduct;
  final bool requirementFreeDelivery;

  const Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.originalPrice,
    this.discount = 0,
    required this.rating,
    required this.sold,
    this.location = 'Jakarta',
    required this.category,
    this.isFreeShipping = false,
    this.isOfficial = false,
    this.isFavorite = false,
    this.leaderBoard,
    this.ramadhanSeru = false,
    this.localProduct = false,
    this.requirementFreeDelivery = false,
  });

  Product copyWith({
    String? id,
    String? name,
    String? image,
    double? price,
    double? originalPrice,
    int? discount,
    double? rating,
    int? sold,
    String? location,
    String? category,
    bool? isFreeShipping,
    bool? isOfficial,
    bool? isFavorite,
    String? leaderBoard,
    bool? ramadhanSeru,
    bool? localProduct,
    bool? requirementFreeDelivery,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      originalPrice: originalPrice ?? this.originalPrice,
      discount: discount ?? this.discount,
      rating: rating ?? this.rating,
      sold: sold ?? this.sold,
      location: location ?? this.location,
      category: category ?? this.category,
      isFreeShipping: isFreeShipping ?? this.isFreeShipping,
      isOfficial: isOfficial ?? this.isOfficial,
      isFavorite: isFavorite ?? this.isFavorite,
      leaderBoard: leaderBoard ?? this.leaderBoard,
      ramadhanSeru: ramadhanSeru ?? this.ramadhanSeru,
      localProduct: localProduct ?? this.localProduct,
      requirementFreeDelivery:
          requirementFreeDelivery ?? this.requirementFreeDelivery,
    );
  }
}

/// Backward compatibility and clarity alias
typedef ProductItem = Product;
