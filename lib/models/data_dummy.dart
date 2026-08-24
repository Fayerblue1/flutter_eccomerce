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
