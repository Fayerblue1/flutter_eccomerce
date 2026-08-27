class Favorit{
  final String id;
  final String leaderBoard;
  final String name;
  final String image;
  final double price;
  final double? originalPrice;
  final int discount;
  final double rating;
  final int sold;
  final String category;
  final bool requirementFreeDilevery;
  final bool ramadhanSeru;
  final bool localProduct;

    const Favorit({
      
      required this.id,
      required this.leaderBoard,
      required this.name,
      required this.image, 
      required this.price, 
      this.originalPrice, 
      this.discount = 0, 
      required this.rating, 
      required this.sold, 
      required this.category, 
      this.requirementFreeDilevery = false, 
      this.ramadhanSeru = false, 
      this.localProduct = false,
      });

}