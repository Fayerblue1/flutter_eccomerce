import 'package:flutter_eccomerce/models/menu_button_model.dart';
import 'package:flutter_eccomerce/models/product_model.dart';

const List<String> productCategories = [
  'Semua',
  'Electronic',
  'Furniture',
  'Fashion',
  'Lokal Product',
  'Action Figure',
];

const List<String> favoritCategories = [
  'Semua',
  'Electronic',
  'Furniture',
  'Fashion',
];

const List<Product> initialProducts = [
  // 1. Electronic
  Product(
    id: '1',
    name: 'Headphone Bluetooth Tune Premium Wireless Bass High Fidelity',
    image: 'assets/images/product_headphone.jpg',
    price: 320000,
    originalPrice: 400000,
    discount: 20,
    rating: 4.8,
    sold: 12500,
    location: 'Jakarta',
    category: 'Electronic',
    isFreeShipping: true,
    isOfficial: true,
    isFavorite: true,
    leaderBoard: '1',
    requirementFreeDelivery: true,
    ramadhanSeru: true,
  ),
  Product(
    id: '2',
    name: 'Smartwatch Digital OLED Health & Fitness Tracker Waterproof',
    image: 'assets/images/product_smartwatch.jpg',
    price: 425000,
    originalPrice: 500000,
    discount: 15,
    rating: 4.7,
    sold: 8500,
    location: 'Jakarta',
    category: 'Electronic',
    isFreeShipping: false,
    isOfficial: true,
    isFavorite: true,
    leaderBoard: '2',
    ramadhanSeru: true,
  ),

  // 2. Furniture
  Product(
    id: '3',
    name: 'Kursi Gaming Ergonomis Premium Breathable Mesh Back',
    image: 'assets/images/product_chair.jpg',
    price: 1299000,
    originalPrice: 1799000,
    discount: 28,
    rating: 4.8,
    sold: 3400,
    location: 'Jakarta',
    category: 'Furniture',
    isFreeShipping: false,
    isOfficial: false,
    isFavorite: true,
    leaderBoard: '1',
    localProduct: true,
  ),
  Product(
    id: '4',
    name: 'Wooden Study Table Minimalist Solid Oak Wood Hairpin Legs',
    image: 'assets/images/product_table.jpg',
    price: 680000,
    originalPrice: 800000,
    discount: 15,
    rating: 4.8,
    sold: 3100,
    location: 'Yogyakarta',
    category: 'Furniture',
    isFreeShipping: true,
    isOfficial: false,
    isFavorite: true,
    leaderBoard: '2',
    requirementFreeDelivery: true,
    ramadhanSeru: true,
    localProduct: true,
  ),

  // 3. Fashion
  Product(
    id: '5',
    name: 'Oversize T-Shirt Streetwear Minimalist Cotton Combed 24s',
    image: 'assets/images/product_tshirt.jpg',
    price: 150000,
    originalPrice: 200000,
    discount: 25,
    rating: 4.9,
    sold: 23000,
    location: 'Bandung',
    category: 'Fashion',
    isFreeShipping: true,
    isOfficial: true,
    isFavorite: true,
    leaderBoard: '1',
    requirementFreeDelivery: true,
    localProduct: true,
  ),
  Product(
    id: '6',
    name: 'Sneakers Casual Lifestyle Urban Sport Edition Green Accent',
    image: 'assets/images/product_sneakers.jpg',
    price: 360000,
    originalPrice: 400000,
    discount: 10,
    rating: 4.6,
    sold: 6700,
    location: 'Surabaya',
    category: 'Fashion',
    isFreeShipping: true,
    isOfficial: false,
    isFavorite: true,
    leaderBoard: '2',
    requirementFreeDelivery: true,
    ramadhanSeru: true,
  ),
  Product(
    id: '7',
    name: 'Hoodie Oversize Premium Unisex Soft Fleece',
    image: 'assets/images/hoodie.jpg',
    price: 199000,
    originalPrice: 299000,
    discount: 33,
    rating: 4.8,
    sold: 7800,
    location: 'Bandung',
    category: 'Fashion',
    isFreeShipping: false,
    isOfficial: true,
    isFavorite: false,
  ),

  // 4. Lokal Product
  Product(
    id: '8',
    name: 'Batik Pria Premium Motif Tradisional Solo Eksklusif',
    image: 'assets/images/batik.jpg',
    price: 299000,
    originalPrice: 399000,
    discount: 25,
    rating: 4.9,
    sold: 5600,
    location: 'Solo',
    category: 'Lokal Product',
    isFreeShipping: true,
    isOfficial: true,
    isFavorite: false,
    localProduct: true,
  ),

  // 5. Action Figure
  Product(
    id: '9',
    name: 'Action Figure One Piece Gear 5 Collector Edition',
    image: 'assets/images/figure.jpg',
    price: 549000,
    originalPrice: 699000,
    discount: 21,
    rating: 4.8,
    sold: 2300,
    location: 'Yogyakarta',
    category: 'Action Figure',
    isFreeShipping: true,
    isOfficial: false,
    isFavorite: false,
  ),
];

// Alias for existing references
const List<Product> dummyProduct = initialProducts;

List<Product> get dummyFavorit =>
    initialProducts.where((p) => p.isFavorite).toList();

const List<MenuButtonItem> dummyMenuButton = [
  MenuButtonItem(
    id: '1',
    image: 'assets/images/ramadhan_logo.png',
    name: 'Promo \nRamadhan',
  ),
  MenuButtonItem(
    id: '2',
    image: 'assets/images/api_logo.png',
    name: 'Mumpung \nMurah',
  ),
  MenuButtonItem(
    id: '3',
    image: 'assets/images/beli_lokal_logo.png',
    name: 'Beli Lokal',
  ),
  MenuButtonItem(
    id: '4',
    image: 'assets/images/bri_visa_logo.png',
    name: 'Tokopedia \nCard',
  ),
  MenuButtonItem(
    id: '5',
    image: 'assets/images/coins_logo.png',
    name: 'Keuangan',
  ),
  MenuButtonItem(
    id: '6',
    image: 'assets/images/hadiah_logo.png',
    name: 'Tokopedia \nSeru',
  ),
];
