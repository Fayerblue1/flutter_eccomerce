import 'package:flutter/material.dart';
import 'package:flutter_eccomerce/components/menu_button.dart';
import 'package:flutter_eccomerce/components/product_card.dart';
import 'package:flutter_eccomerce/models/data_dummy.dart';
import 'package:flutter_eccomerce/models/product_model.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedCategory = 'Semua';
  // int _selectedBottomIndex = 0;

  List<Product> get _filteredProduct {
    if (_selectedCategory == 'Semua') return dummyProduct;
    return dummyProduct
        .where((product) => product.category == _selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/navbar_bg.png',
                  width: double.infinity,
                  height: 160.0,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Icon(Icons.search, size: 25.0),
                                prefixIconColor: Colors.black,
                                hint: Text(
                                  'Cari di Tokopedia',
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontSize: 16.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 3.0,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.mail_outline, size: 25.0),
                            visualDensity: VisualDensity.compact,
                          ),
                          Stack(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.notifications_outlined,

                                  size: 25.0,
                                ),
                                visualDensity: VisualDensity.compact,
                              ),
                              Positioned(
                                right: 8.0,
                                top: 5.0,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.shopping_cart_outlined,
                              size: 25.0,
                            ),
                            visualDensity: VisualDensity.compact,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.menu, size: 25.0),
                            visualDensity: VisualDensity.compact,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.green,
                            size: 15.0,
                          ),
                          Text(' Dikirim Ke '),
                          Text(
                            'Rumah Deni Alwan (Brebes)',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.keyboard_arrow_down_outlined),
                            visualDensity: VisualDensity.compact,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/gopay_icon.png',
                                    width: 30,
                                    height: 30,
                                  ),
                                  SizedBox(width: 4.0),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Rp 99,999',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                      ),
                                      Text(
                                        '0 Coins',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(width: 8.0),
                          Container(
                            width: 1.5,
                            height: 30.0,
                            color: Colors.grey.shade300,
                          ),
                          SizedBox(width: 3.0),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/bintang_icon.png',
                                    width: 30,
                                    height: 30,
                                  ),
                                  SizedBox(width: 4.0),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Diskon 9,999%',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13.0,
                                        ),
                                      ),
                                      Text(
                                        'Langganan, Yuk!',
                                        style: TextStyle(
                                          color: Colors.green[600],
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(width: 8.0),
                          Container(
                            width: 1.5,
                            height: 30.0,
                            color: Colors.grey.shade300,
                          ),
                          SizedBox(width: 4.0),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/silver_icon.png',
                                    width: 30,
                                    height: 30,
                                  ),
                                  SizedBox(width: 4.0),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Silver',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '16 Kupon Baru',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/banner.png',
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/banner.png',
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/banner.png',
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/banner.png',
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),

            // SizedBox(
            //   child: SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     padding: const EdgeInsets.all(10.0),
            //     child: Row(
            //       spacing: 5.0,
            //       children: [
            //         MenuButton(
            //           image: 'assets/images/ramadhan_logo.png',
            //           name: 'Promo \nRamadhan',
            //           onTap: () {},
            //         ),
            //         MenuButton(
            //           image: 'assets/images/api_logo.png',
            //           name: 'Mumpung \nMurah',
            //           onTap: () {},
            //         ),
            //         MenuButton(
            //           image: 'assets/images/beli_lokal_logo.png',
            //           name: 'Beli Lokal',
            //           onTap: () {},
            //         ),
            //         MenuButton(
            //           image: 'assets/images/bri_visa_logo.png',
            //           name: 'Tokopedia \ncard',
            //           onTap: () {},
            //         ),
            //         MenuButton(
            //           image: 'assets/images/coins_logo.png',
            //           name: 'Keuangan',
            //           onTap: () {},
            //         ),
            //         MenuButton(
            //           image: 'assets/images/hadiah_logo.png',
            //           name: 'Tokopedia \nSeru',
            //           onTap: () {},
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

           SizedBox(
            height:140,
             child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: dummyMenuButton.length,
              separatorBuilder: ((context, index) => SizedBox(width:10.0)),
              itemBuilder: (context, index) {
                final category = dummyMenuButton[index];
                return MenuButton(image: category.image, name: category.name, onTap: (){},);
              },
              
             ),
           ),
            SizedBox(height: 10),
            // Kategory
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
              child: SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: productCategories.length,
                  separatorBuilder: ((context, index) => SizedBox(width: 10.0)),
                  itemBuilder: ((context, index) {
                    final category = productCategories[index];
                    final isSelected = _selectedCategory == category;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCategory = category;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        child: Text(
                          category,
                          style: GoogleFonts.poppins(
                            color: isSelected ? Colors.green : Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            // Product
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.57, // Horizontal 6 | vertical 10,
                ),
                itemCount: _filteredProduct.length,
                itemBuilder: (context, index) {
                  final product = _filteredProduct[index];
                  return ProductCard(product: product);
                },
              ),
            ),
          ],
        ),
      ),

      // With BottomNavigationBar

      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _selectedBottomIndex,

      //   onTap: (index) {
      //     setState(() {
      //       _selectedBottomIndex = index;
      //     });
      //   },

      //   selectedItemColor: Colors.green,
      //   unselectedItemColor: Colors.grey,

      //   type: BottomNavigationBarType.fixed,

      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home_outlined),
      //       activeIcon: Icon(Icons.home),
      //       label: 'Home',
      //     ),

      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.local_offer_outlined),
      //       activeIcon: Icon(Icons.local_offer),
      //       label: 'Feed',
      //     ),

      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.receipt_long_outlined),
      //       activeIcon: Icon(Icons.receipt_long),
      //       label: 'Pesanan',
      //     ),

      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.chat_bubble_outline),
      //       activeIcon: Icon(Icons.chat_bubble),
      //       label: 'Chat',
      //     ),

      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person_outline),
      //       activeIcon: Icon(Icons.person),
      //       label: 'Akun',
      //     ),
      //   ],
      // ),

      // With Navigation

      // bottomNavigationBar: NavigationBar(
      //   onDestinationSelected: (value) {
          
      //   },

      //   destinations: [
      //     NavigationDestination(
      //       icon: Icon(Icons.home_outlined),
      //       selectedIcon: Icon(Icons.home),
      //       label: 'Home',
      //       )
      //   ]
      //   ),
    );
  }
}
