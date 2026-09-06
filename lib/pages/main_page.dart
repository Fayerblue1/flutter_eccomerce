import 'package:flutter/material.dart';
import 'package:flutter_eccomerce/pages/akun_page.dart';
import 'package:flutter_eccomerce/pages/chat_page.dart';
import 'package:flutter_eccomerce/pages/favorit_page.dart';
import 'package:flutter_eccomerce/pages/home_page.dart';
import 'package:flutter_eccomerce/pages/pesanan_page.dart';
import 'package:flutter_eccomerce/providers/navigation_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  static const List<Widget> _pages = [
    HomePage(),
    FavoritPage(),
    PesananPage(),
    ChatPage(),
    AkunPage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedNavIndexProvider);

    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(12),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: NavigationBar(
          selectedIndex: selectedIndex,
          indicatorColor: const Color(0xFFE8F5E9),
          backgroundColor: Colors.white,
          elevation: 0,
          height: 62,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          onDestinationSelected: (index) {
            ref.read(selectedNavIndexProvider.notifier).state = index;
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home, color: Color(0xFF03AC0E)),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.star_outline),
              selectedIcon: Icon(Icons.star, color: Color(0xFF03AC0E)),
              label: 'Favorit',
            ),
            NavigationDestination(
              icon: Icon(Icons.receipt_long_outlined),
              selectedIcon: Icon(Icons.receipt_long, color: Color(0xFF03AC0E)),
              label: 'Pesanan',
            ),
            NavigationDestination(
              icon: Icon(Icons.chat_bubble_outline),
              selectedIcon: Icon(Icons.chat_bubble, color: Color(0xFF03AC0E)),
              label: 'Chat',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person, color: Color(0xFF03AC0E)),
              label: 'Akun',
            ),
          ],
        ),
      ),
    );
  }
}