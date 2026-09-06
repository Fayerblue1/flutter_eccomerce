class MenuBaruDummy {
  final int id;
  final String rank;
  final String title;
  final int price;
  final int? originalPrice;
  final String? discount;
  final String? cashback;
  final double rating;
  final String sold;
  final String imageUrl;
  final bool isAd;
  

  MenuBaruDummy({
    required this.id,
    required this.rank,
    required this.title,
    required this.price,
    this.originalPrice,
    this.discount,
    this.cashback,
    required this.rating,
    required this.sold,
    required this.imageUrl,
    this.isAd = false,
  });

  static List<MenuBaruDummy> getDummyList() {
    return [
      MenuBaruDummy(
        id: 1,
        rank: "#1",
        title: "Kit Rubbing Compound 60gr",
        price: 11250,
        originalPrice: 15000,
        discount: "25%",
        rating: 4.9,
        sold: "10rb+",
        imageUrl: "https://via.placeholder.com/150",
      ),
      MenuBaruDummy(
        id: 2,
        rank: "#2",
        title: "SPONGE CUCI MOBIL MOTOR BUSA F...",
        price: 15000,
        rating: 4.9,
        sold: "8rb+",
        imageUrl: "https://via.placeholder.com/150",
        isAd: true,
      ),
      MenuBaruDummy(
        id: 3,
        rank: "#3",
        title: "Kit Glass Polish 170mL",
        price: 31330,
        originalPrice: 48200,
        discount: "35%",
        cashback: "Cashback 2,19rb",
        rating: 4.9,
        sold: "10rb+",
        imageUrl: "https://via.placeholder.com/150",
      ),
      MenuBaruDummy(
        id: 4,
        rank: "#4",
        title: "RUST REMOVER 250ml",
        price: 25000,
        rating: 4.8,
        sold: "5rb+",
        imageUrl: "https://via.placeholder.com/150",
      ),
      MenuBaruDummy(
        id: 5,
        rank: "#5",
        title: "TITANIUM GOLD SHAMPOO N2",
        price: 45000,
        rating: 4.9,
        sold: "20rb+",
        imageUrl: "https://via.placeholder.com/150",
      ),
      MenuBaruDummy(
        id: 6,
        rank: "#6",
        title: "WASH WAX CAR WASH SHAMPOO",
        price: 35000,
        rating: 4.9,
        sold: "15rb+",
        imageUrl: "https://via.placeholder.com/150",
      ),
    ];
  }
}