import 'package:flutter/material.dart';
import 'package:flutter_eccomerce/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  
  final List<Widget> _pages = [
    HomePage(),
    _PlaceHolderPage(icon: Icons.tv, label: 'feed'),
    _PlaceHolderPage(icon: Icons.mail, label: 'mail'),
    _PlaceHolderPage(icon: Icons.dangerous, label: 'forbidden'),
    _PlaceHolderPage(icon: Icons.person, label: 'Account'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children:_pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        indicatorColor: Colors.green,
        backgroundColor: Colors.white,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });

        },

        destinations:[
          NavigationDestination(
            icon:Icon(Icons.home_outlined, ) ,
            label: 'Home',
            selectedIcon: Icon(Icons.home),
            ),
          NavigationDestination(
            icon:Icon(Icons.local_offer_outlined, ) ,
            label: 'Fedd',
            selectedIcon: Icon(Icons.local_offer),
            ),
          NavigationDestination(
            icon:Icon(Icons.receipt_long_outlined, ) ,
            label: 'Pesanan',
            selectedIcon: Icon(Icons.receipt_long),
            ),
          NavigationDestination(
            icon:Icon(Icons.chat_bubble_outline, ) ,
            label: 'Chat',
            selectedIcon: Icon(Icons.chat_bubble),
            ),
          NavigationDestination(
            icon:Icon(Icons.person_outline, ) ,
            label: 'Akun',
            selectedIcon: Icon(Icons.person),
            ),
        ] ),
    );
  }
}

class _PlaceHolderPage extends StatelessWidget {
  final IconData icon;
  final String label;
  const _PlaceHolderPage({ required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column (
        children: [
          Icon(icon, size: 64, color: Colors.grey.shade400),
          const SizedBox(height: 12),
          Text(
            'Halaman',
            style:
            GoogleFonts.poppins(
              fontSize: 18,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w500
            ),
             ),
             const SizedBox(height:4),
             Text(
              'Segera Hadir',
              style: 
              GoogleFonts.poppins(
                fontSize:13, color: Colors.grey.shade400 )
             )
        ],
      ),
    );
  }
}