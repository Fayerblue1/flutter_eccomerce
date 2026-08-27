import 'package:flutter/material.dart';
import 'package:flutter_eccomerce/pages/favorit_page.dart';
import 'package:flutter_eccomerce/pages/home_page.dart';
import 'package:flutter_eccomerce/providers/navigation_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  

  static final List<Widget> _pages = [
    HomePage(),
    FavoritPage(),
    _PlaceHolderPage(icon: Icons.mail, label: 'mail'),
    _PlaceHolderPage(icon: Icons.dangerous, label: 'forbidden'),
    _PlaceHolderPage(icon: Icons.person, label: 'Account'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
      final selectedIndex = ref.watch(selectedNavIndexProvider);


    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children:_pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        indicatorColor: Colors.green,
        backgroundColor: Colors.white,
        onDestinationSelected: (index) {
          ref.read(selectedNavIndexProvider.notifier).state = index;

        },

        destinations:[
          NavigationDestination(
            icon:Icon(Icons.home_outlined, ) ,
            label: 'Home',
            selectedIcon: Icon(Icons.home),
            ),
          NavigationDestination(
            icon:Icon(Icons.star_outline, ) ,
            label: 'Favorit',
            selectedIcon: Icon(Icons.star),
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