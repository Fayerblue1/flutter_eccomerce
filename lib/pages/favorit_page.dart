import 'package:flutter/material.dart';
import 'package:flutter_eccomerce/components/favorit_card.dart';
import 'package:flutter_eccomerce/models/data_dummy.dart';
import 'package:flutter_eccomerce/models/product_model.dart';
import 'package:flutter_eccomerce/providers/navigation_provider.dart';
import 'package:flutter_eccomerce/providers/product_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritPage extends ConsumerStatefulWidget {
  const FavoritPage({super.key});

  @override
  ConsumerState<FavoritPage> createState() => _FavoritPageState();
}

class _FavoritPageState extends ConsumerState<FavoritPage> {
  String _selectedCategory = 'Semua';
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Product> _getFilteredFavorites(List<Product> products) {
    return products.where((product) {
      if (!product.isFavorite) return false;
      final matchesCategory = _selectedCategory == 'Semua' ||
          product.category == _selectedCategory;
      final matchesSearch = _searchQuery.isEmpty ||
          product.name.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final allProducts = ref.watch(productsProvider);
    final favoriteProducts = _getFilteredFavorites(allProducts);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search & Actions Header
              _buildSearchHeader(),

              const Divider(
                color: Color(0xFFEEEEEE),
                thickness: 1,
                height: 1,
              ),

              const SizedBox(height: 16),

              // Title Section: "Favorit Toppers Hari ini"
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Favorit Toppers Hari Ini',
                      style: GoogleFonts.poppins(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF212121),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 0.8,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(8),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Color(0xFF212121),
                        size: 14,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // Horizontal Category Filter Pills
              _buildCategoryPills(),

              const SizedBox(height: 16),

              // Favorite Products List
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: favoriteProducts.isEmpty
                    ? _buildEmptyState()
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: favoriteProducts.length,
                        itemBuilder: (context, index) {
                          final favorit = favoriteProducts[index];
                          return FavoritCard(
                            favorit: favorit,
                            onFavoriteTap: () {
                              ref
                                  .read(productsProvider.notifier)
                                  .toggleFavorite(favorit.id);
                            },
                            onTap: () {},
                          );
                        },
                      ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 12.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 38,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey.shade300, width: 0.8),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (val) {
                  setState(() {
                    _searchQuery = val;
                  });
                },
                textAlignVertical: TextAlignVertical.center,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: const Color(0xFF212121),
                ),
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Cari di Favorit',
                  hintStyle: GoogleFonts.poppins(
                    color: Colors.grey.shade500,
                    fontSize: 13.0,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.grey,
                  ),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, size: 16),
                          onPressed: () {
                            _searchController.clear();
                            setState(() {
                              _searchQuery = '';
                            });
                          },
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.mail_outline, size: 23.0, color: Color(0xFF424242)),
            visualDensity: VisualDensity.compact,
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_outlined, size: 23.0, color: Color(0xFF424242)),
                visualDensity: VisualDensity.compact,
              ),
              Positioned(
                right: 6.0,
                top: 6.0,
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: const BoxDecoration(
                    color: Color(0xFFE53935),
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined, size: 23.0, color: Color(0xFF424242)),
            visualDensity: VisualDensity.compact,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu, size: 23.0, color: Color(0xFF424242)),
            visualDensity: VisualDensity.compact,
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryPills() {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        itemCount: favoritCategories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = favoritCategories[index];
          final isSelected = _selectedCategory == category;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategory = category;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFFE8F5E9)
                    : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF03AC0E)
                      : Colors.grey.shade300,
                  width: isSelected ? 1.2 : 0.8,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                category,
                style: GoogleFonts.poppins(
                  color: isSelected
                      ? const Color(0xFF03AC0E)
                      : const Color(0xFF616161),
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  fontSize: 12.5,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F5E9),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.favorite_border_rounded,
              color: Color(0xFF03AC0E),
              size: 48,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Wah, Favoritmu Masih Kosong',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF212121),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Yuk simpan produk impianmu dengan menekan ikon hati ❤️ di katalog produk!',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 12.5,
              color: Colors.grey.shade600,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Switch to Home tab
              ref.read(selectedNavIndexProvider.notifier).state = 0;
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF03AC0E),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: Text(
              'Cari Produk Sekarang',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
