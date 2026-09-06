enum OrderStatus {
  belumBayar('Belum Bayar'),
  diproses('Diproses'),
  dikirim('Dikirim'),
  selesai('Selesai');

  final String label;
  const OrderStatus(this.label);
}

class OrderModel {
  final String id;
  final String storeName;
  final bool isOfficial;
  final String productName;
  final String productImage;
  final double price;
  final int quantity;
  final double totalPrice;
  final OrderStatus status;
  final String orderDate;

  const OrderModel({
    required this.id,
    required this.storeName,
    this.isOfficial = false,
    required this.productName,
    required this.productImage,
    required this.price,
    required this.quantity,
    required this.totalPrice,
    required this.status,
    required this.orderDate,
  });
}

const List<OrderModel> dummyOrders = [
  OrderModel(
    id: 'INV/20260906/001',
    storeName: 'Audio Official Store',
    isOfficial: true,
    productName: 'Headphone Bluetooth Tune Premium Wireless Bass High Fidelity',
    productImage: 'assets/images/product_headphone.jpg',
    price: 320000,
    quantity: 1,
    totalPrice: 320000,
    status: OrderStatus.selesai,
    orderDate: '04 Sep 2026',
  ),
  OrderModel(
    id: 'INV/20260905/002',
    storeName: 'TechGadget Indonesia',
    isOfficial: true,
    productName: 'Smartwatch Digital OLED Health & Fitness Tracker Waterproof',
    productImage: 'assets/images/product_smartwatch.jpg',
    price: 425000,
    quantity: 1,
    totalPrice: 425000,
    status: OrderStatus.dikirim,
    orderDate: '05 Sep 2026',
  ),
  OrderModel(
    id: 'INV/20260906/003',
    storeName: 'ErgoLiving Official',
    isOfficial: true,
    productName: 'Kursi Gaming Ergonomis Premium Breathable Mesh Back',
    productImage: 'assets/images/product_chair.jpg',
    price: 1299000,
    quantity: 1,
    totalPrice: 1299000,
    status: OrderStatus.diproses,
    orderDate: '06 Sep 2026',
  ),
  OrderModel(
    id: 'INV/20260906/004',
    storeName: 'Urban Kicks ID',
    isOfficial: false,
    productName: 'Sneakers Casual Lifestyle Urban Sport Edition Green Accent',
    productImage: 'assets/images/product_sneakers.jpg',
    price: 360000,
    quantity: 1,
    totalPrice: 360000,
    status: OrderStatus.belumBayar,
    orderDate: '06 Sep 2026',
  ),
  OrderModel(
    id: 'INV/20260828/005',
    storeName: 'Bandung Apparel Store',
    isOfficial: false,
    productName: 'Oversize T-Shirt Streetwear Minimalist Cotton Combed 24s',
    productImage: 'assets/images/product_tshirt.jpg',
    price: 150000,
    quantity: 2,
    totalPrice: 300000,
    status: OrderStatus.selesai,
    orderDate: '28 Agu 2026',
  ),
  OrderModel(
    id: 'INV/20260820/006',
    storeName: 'FurniCraft Nusantara',
    isOfficial: true,
    productName: 'Wooden Study Table Minimalist Solid Oak Wood Hairpin Legs',
    productImage: 'assets/images/product_table.jpg',
    price: 680000,
    quantity: 1,
    totalPrice: 680000,
    status: OrderStatus.selesai,
    orderDate: '20 Agu 2026',
  ),
];
