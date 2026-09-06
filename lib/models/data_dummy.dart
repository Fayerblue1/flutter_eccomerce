import 'package:flutter_eccomerce/models/favorit_model.dart';
import 'package:flutter_eccomerce/models/menu_button_model.dart';
import 'package:flutter_eccomerce/models/product_model.dart';

const List<String> productCategories = [
  'Semua',
  'Electronic',
  'Furniture',
  'Action Figure',
  'Lokal Product',
  'Fashion',
];

const List<Product> dummyProduct = [
 Product(
    id: '1',
    name: 'Headphone Bluetooth JBL Tune 520BT Premium Wireless Bass',
    image: 'https://picsum.photos/seed/headphone/300/300',
    price: 499000,
    originalPrice: 799000,
    discount: 38,
    rating: 4.8,
    sold: 12500,
    location: 'Jakarta',
    category: 'Electronic',
    isFreeShipping: true,
    isOfficial: false,
  ),

  Product(
    id: '2',
    name: 'Kursi Gaming Ergonomis Premium',
    image: 'https://picsum.photos/seed/chair/300/300',
    price: 1299000,
    originalPrice: 1799000,
    discount: 28,
    rating: 4.8,
    sold: 3400,
    location: 'Jakarta',
    category: 'Furniture',
    isFreeShipping: false,
    isOfficial: false,
  ),

  Product(
    id: '3',
    name: 'Action Figure One Piece Luffy Gear 5',
    image: 'https://picsum.photos/seed/luffy/300/300',
    price: 549000,
    originalPrice: 699000,
    discount: 21,
    rating: 4.8,
    sold: 2300,
    location: 'Yogyakarta',
    category: 'Action Figure',
    isFreeShipping: true,
    isOfficial: false,
  ),

  Product(
    id: '4',
    name: 'Batik Pria Premium Motif Tradisional',
    image: 'https://picsum.photos/seed/batik/300/300',
    price: 299000,
    originalPrice: 399000,
    discount: 25,
    rating: 4.9,
    sold: 5600,
    location: 'Solo',
    category: 'Lokal Product',
    isFreeShipping: true,
    isOfficial: true,
  ),

  Product(
    id: '5',
    name: 'Hoodie Oversize Premium Unisex',
    image: 'https://picsum.photos/seed/hoodie/300/300',
    price: 199000,
    originalPrice: 299000,
    discount: 33,
    rating: 4.8,
    sold: 7800,
    location: 'Bandung',
    category: 'Fashion',
    isFreeShipping: false,
    isOfficial: true,
  ),
];


const List<MenuButton> dummyMenuButton = [
  MenuButton(
    id : '1',
    image: 'assets/images/ramadhan_logo.png', 
    name: 'Promo \nRamadhan',
    
  ),
  MenuButton(
    id : '2',
    image: 'assets/images/api_logo.png', 
    name: 'Mumpung \nMurah',
    
  ),
  MenuButton(
    id : '3',
    image: 'assets/images/beli_lokal_logo.png', 
    name: 'Beli Lokal',
    
  ),
  MenuButton(
    id : '4',
    image: 'assets/images/bri_visa_logo.png', 
    name: 'Tokopedia \ncard',
    
  ),
  MenuButton(
    id : '5',
    image: 'assets/images/coins_logo.png', 
    name: 'Keuangan',
    
  ),
  MenuButton(
    id : '6',
    image: 'assets/images/hadiah_logo.png', 
    name: 'Tokopedia \nSeru',
    
  ),
];

const List<String> favoritCategories = [
  'Electronic',
  'Furniture',
  'Fashion',
];

const List<Favorit>dummyFavorit = [
  // Kategori: Electronic
Favorit(
  id: '1',
  name: "Wireless Headphone",
  image: "assets/images/headphone.jpg",
  discount: 20,
  price: 320000,
  originalPrice: 400000,
  rating: 4.8,
  sold: 1200,
  category: "Electronic",
  leaderBoard: '1',
  requirementFreeDilevery: true,
  ramadhanSeru: true,
  localProduct: false,
),

Favorit(
  id: '2',
  name: "Smartwatch",
  image: "assets/images/smartwatch.jpg",
  discount: 15,
  price: 425000,
  originalPrice: 500000,
  rating: 4.7,
  sold: 850,
  category: "Electronic",
  leaderBoard: '2',
 requirementFreeDilevery: false,
  ramadhanSeru: true,
  localProduct: false,
),

// Kategori: Fashion
Favorit(
  id: '3',
  name: "Oversize T-Shirt",
  image: "assets/images/tshirt.jpg",
  discount: 25,
  price: 150000,
  originalPrice: 200000,
  rating: 4.9,
  sold: 2300,
  category: "Fashion",
  leaderBoard: '1',
  requirementFreeDilevery: true,
  ramadhanSeru: false,
  localProduct: true,
),

Favorit(
  id: '4',
  name: "Sneakers Casual",
  image: "assets/images/sneakers.jpg",
  discount: 10,
  price: 360000,
  originalPrice: 400000,
  rating: 4.6,
  sold: 670,
  category: "Fashion",
  leaderBoard: '2',
  requirementFreeDilevery: true,
  ramadhanSeru: true,
  localProduct: false,
),

// Kategori: Furniture
Favorit(
  id: '5',
  name: "Minimalist Chair",
  image: "assets/images/chair.jpg",
  discount: 20,
  price: 280000,
  originalPrice: 350000,
  rating: 4.7,
  sold: 420,
  category: "Furniture",
  leaderBoard: '1',
 requirementFreeDilevery: false,
  ramadhanSeru: false,
  localProduct: true,
),

Favorit(
  id: '6',
  name: "Wooden Study Table",
  image: "assets/images/table.jpg",
  discount: 15,
  price: 680000,
  originalPrice: 800000,
  rating: 4.8,
  sold: 310,
  category: "Furniture",
  leaderBoard: '2',
 requirementFreeDilevery: true,
  ramadhanSeru: true,
  localProduct: true,
),
];
