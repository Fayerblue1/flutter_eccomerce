class ChatMessage {
  final String id;
  final String sender; // 'user' or 'seller'
  final String text;
  final String time;

  const ChatMessage({
    required this.id,
    required this.sender,
    required this.text,
    required this.time,
  });
}

class ChatConversation {
  final String id;
  final String sellerName;
  final String sellerAvatar;
  final bool isOfficial;
  final String lastMessage;
  final String time;
  final int unreadCount;
  final bool isOnline;
  final List<ChatMessage> messages;

  const ChatConversation({
    required this.id,
    required this.sellerName,
    required this.sellerAvatar,
    this.isOfficial = false,
    required this.lastMessage,
    required this.time,
    this.unreadCount = 0,
    this.isOnline = false,
    required this.messages,
  });

  ChatConversation copyWith({
    String? id,
    String? sellerName,
    String? sellerAvatar,
    bool? isOfficial,
    String? lastMessage,
    String? time,
    int? unreadCount,
    bool? isOnline,
    List<ChatMessage>? messages,
  }) {
    return ChatConversation(
      id: id ?? this.id,
      sellerName: sellerName ?? this.sellerName,
      sellerAvatar: sellerAvatar ?? this.sellerAvatar,
      isOfficial: isOfficial ?? this.isOfficial,
      lastMessage: lastMessage ?? this.lastMessage,
      time: time ?? this.time,
      unreadCount: unreadCount ?? this.unreadCount,
      isOnline: isOnline ?? this.isOnline,
      messages: messages ?? this.messages,
    );
  }
}

final List<ChatConversation> initialConversations = [
  ChatConversation(
    id: 'chat_001',
    sellerName: 'Toko Elektronik Official',
    sellerAvatar: 'assets/images/product_headphone.jpg',
    isOfficial: true,
    lastMessage: 'Halo kak, stok Headphone Bluetooth ready ya! Silakan diorder kak.',
    time: '14:35',
    unreadCount: 2,
    isOnline: true,
    messages: [
      const ChatMessage(
        id: 'm1',
        sender: 'user',
        text: 'Halo kak, apakah Headphone Bluetooth Tune ini masih ready?',
        time: '14:30',
      ),
      const ChatMessage(
        id: 'm2',
        sender: 'seller',
        text: 'Halo! Selamat datang di Toko Elektronik Official.',
        time: '14:32',
      ),
      const ChatMessage(
        id: 'm3',
        sender: 'seller',
        text: 'Halo kak, stok Headphone Bluetooth ready ya! Silakan diorder kak.',
        time: '14:35',
      ),
    ],
  ),
  ChatConversation(
    id: 'chat_002',
    sellerName: 'Gadget Store ID',
    sellerAvatar: 'assets/images/product_smartwatch.jpg',
    isOfficial: true,
    lastMessage: 'Pesanan Smartwatch OLED sudah diserahkan ke kurir ya kak.',
    time: '11:20',
    unreadCount: 1,
    isOnline: true,
    messages: [
      const ChatMessage(
        id: 'm1',
        sender: 'user',
        text: 'Siang kak, pesanan smartwatch saya apa sudah dikirim?',
        time: '11:15',
      ),
      const ChatMessage(
        id: 'm2',
        sender: 'seller',
        text: 'Pesanan Smartwatch OLED sudah diserahkan ke kurir ya kak. Nomor resi akan otomatis terupdate.',
        time: '11:20',
      ),
    ],
  ),
  ChatConversation(
    id: 'chat_003',
    sellerName: 'Furniture Official Store',
    sellerAvatar: 'assets/images/product_chair.jpg',
    isOfficial: true,
    lastMessage: 'Baik kak, untuk kursi gaming warna hitam saat ini tersedia.',
    time: 'Kemarin',
    unreadCount: 0,
    isOnline: false,
    messages: [
      const ChatMessage(
        id: 'm1',
        sender: 'user',
        text: 'Malam kak, untuk kursi gaming ergonomis ada pilihan warna apa saja?',
        time: 'Kemarin 20:10',
      ),
      const ChatMessage(
        id: 'm2',
        sender: 'seller',
        text: 'Baik kak, untuk kursi gaming warna hitam saat ini tersedia. Garansi rangka 2 tahun ya kak.',
        time: 'Kemarin 20:14',
      ),
    ],
  ),
  ChatConversation(
    id: 'chat_004',
    sellerName: 'Fashion Store Bandung',
    sellerAvatar: 'assets/images/product_tshirt.jpg',
    isOfficial: false,
    lastMessage: 'Untuk ukuran XL lingkar dada 110cm dan panjang 74cm ya kak.',
    time: '04 Sep',
    unreadCount: 0,
    isOnline: false,
    messages: [
      const ChatMessage(
        id: 'm1',
        sender: 'user',
        text: 'Sore kak, mau tanya ukuran baju oversize ini chart-nya gimana ya?',
        time: '04 Sep 16:02',
      ),
      const ChatMessage(
        id: 'm2',
        sender: 'seller',
        text: 'Untuk ukuran XL lingkar dada 110cm dan panjang 74cm ya kak. Bahannya combed 24s adem banget.',
        time: '04 Sep 16:05',
      ),
    ],
  ),
  ChatConversation(
    id: 'chat_005',
    sellerName: 'Urban Footwear Studio',
    sellerAvatar: 'assets/images/product_sneakers.jpg',
    isOfficial: false,
    lastMessage: 'Terima kasih banyak telah berbelanja di toko kami! Semoga suka.',
    time: '28 Agu',
    unreadCount: 0,
    isOnline: false,
    messages: [
      const ChatMessage(
        id: 'm1',
        sender: 'seller',
        text: 'Paket sepatu sneakers sudah sampai di alamat tujuan kak.',
        time: '28 Agu 14:00',
      ),
      const ChatMessage(
        id: 'm2',
        sender: 'user',
        text: 'Sudah saya terima kak, sepatunya pas dan bagus banget!',
        time: '28 Agu 15:30',
      ),
      const ChatMessage(
        id: 'm3',
        sender: 'seller',
        text: 'Terima kasih banyak telah berbelanja di toko kami! Semoga suka.',
        time: '28 Agu 15:35',
      ),
    ],
  ),
];
