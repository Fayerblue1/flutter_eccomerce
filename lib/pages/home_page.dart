import 'package:flutter/material.dart';
import 'package:flutter_eccomerce/components/menu_button.dart';
import 'package:flutter_eccomerce/components/product_card.dart';
import 'package:flutter_eccomerce/models/data_dummy.dart';
import 'package:flutter_eccomerce/models/product_model.dart';
import 'package:flutter_eccomerce/providers/product_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  String _selectedCategory = 'Semua';
  int _currentBannerIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Product> _getFilteredProducts(List<Product> products) {
    return products.where((product) {
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
    final filteredProducts = _getFilteredProducts(allProducts);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Header: Background + Search Bar + Location
            _buildTopHeader(),

            const SizedBox(height: 12),

            // Wallet & Rewards Card (GoPay, Plus/Bintang, Silver)
            _buildWalletCard(),

            const SizedBox(height: 14),

            // Promo Banner Carousel
            _buildPromoBanners(),

            const SizedBox(height: 14),

            // Quick Menu Horizontal Shortcuts
            _buildQuickMenu(),

            const SizedBox(height: 12),

            // Category Filter Pills
            _buildCategoryFilter(),

            const SizedBox(height: 10),

            // Product Grid Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: filteredProducts.isEmpty
                  ? _buildEmptyState()
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.54,
                      ),
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = filteredProducts[index];
                        return ProductCard(
                          product: product,
                          onFavoriteTap: () {
                            ref
                                .read(productsProvider.notifier)
                                .toggleFavorite(product.id);
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
    );
  }

  Widget _buildTopHeader() {
    return Stack(
      children: [
        // Background Header Image with subtle dark overlay
        Positioned.fill(
          child: Image.asset(
            'assets/images/navbar_bg.png',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF03AC0E), Color(0xFF028A0B)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              );
            },
          ),
        ),

        SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14.0, 10.0, 14.0, 12.0),
            child: Column(
              children: [
                // Search Row: TextField + Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 38,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(20),
                              blurRadius: 4,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _searchController,
                          onChanged: (value) {
                            setState(() {
                              _searchQuery = value;
                            });
                          },
                          textAlignVertical: TextAlignVertical.center,
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: const Color(0xFF212121),
                          ),
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: 'Cari di Tokopedia',
                            hintStyle: GoogleFonts.poppins(
                              color: Colors.grey.shade500,
                              fontSize: 13.0,
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              size: 20.0,
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
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    _buildHeaderIconButton(
                      icon: Icons.mail_outline,
                      onTap: () {},
                    ),
                    _buildHeaderIconButton(
                      icon: Icons.notifications_outlined,
                      badge: '2',
                      onTap: () {},
                    ),
                    _buildHeaderIconButton(
                      icon: Icons.shopping_cart_outlined,
                      badge: '1',
                      onTap: () {},
                    ),
                  ],
                ),

                const SizedBox(height: 8.0),

                // Delivery Address Strip
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 15.0,
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      'Dikirim ke ',
                      style: GoogleFonts.poppins(
                        fontSize: 11.5,
                        color: Colors.white.withAlpha(230),
                      ),
                    ),
                    Text(
                      'Rumah Deni Alwan (Brebes)',
                      style: GoogleFonts.poppins(
                        fontSize: 11.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 16.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderIconButton({
    required IconData icon,
    String? badge,
    required VoidCallback onTap,
  }) {
    return Stack(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Icon(icon, size: 22.0, color: Colors.white),
            ),
          ),
        ),
        if (badge != null)
          Positioned(
            right: 4.0,
            top: 4.0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 1.0),
              decoration: const BoxDecoration(
                color: Color(0xFFE53935),
                shape: BoxShape.circle,
              ),
              child: Text(
                badge,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 9.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildWalletCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(12),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // GoPay Segment
              _buildWalletSegment(
                image: 'assets/images/gopay_icon.png',
                fallbackIcon: Icons.account_balance_wallet,
                fallbackColor: const Color(0xFF00AED6),
                title: 'Rp 99.999',
                subtitle: '0 Coins',
                subtitleColor: Colors.grey.shade500,
              ),

              _buildWalletDivider(),

              // Plus / Langganan Segment
              _buildWalletSegment(
                image: 'assets/images/bintang_icon.png',
                fallbackIcon: Icons.stars,
                fallbackColor: const Color(0xFFFFB800),
                title: 'Diskon 99%',
                subtitle: 'Langganan, Yuk!',
                subtitleColor: const Color(0xFF03AC0E),
              ),

              _buildWalletDivider(),

              // Tier / Kupon Segment
              _buildWalletSegment(
                image: 'assets/images/silver_icon.png',
                fallbackIcon: Icons.military_tech,
                fallbackColor: Colors.grey,
                title: 'Silver',
                subtitle: '16 Kupon Baru',
                subtitleColor: Colors.grey.shade500,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWalletSegment({
    required String image,
    required IconData fallbackIcon,
    required Color fallbackColor,
    required String title,
    required String subtitle,
    required Color subtitleColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            image,
            width: 26,
            height: 26,
            errorBuilder: (context, error, stackTrace) =>
                Icon(fallbackIcon, color: fallbackColor, size: 24),
          ),
          const SizedBox(width: 6.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 11.5,
                  color: const Color(0xFF212121),
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.poppins(
                  color: subtitleColor,
                  fontWeight: subtitleColor == const Color(0xFF03AC0E)
                      ? FontWeight.w600
                      : FontWeight.normal,
                  fontSize: 9.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWalletDivider() {
    return Container(
      width: 1,
      height: 26,
      color: Colors.grey.shade200,
    );
  }

  Widget _buildPromoBanners() {
    return Column(
      children: [
        SizedBox(
          height: 135,
          child: PageView.builder(
            itemCount: 4,
            onPageChanged: (index) {
              setState(() {
                _currentBannerIndex = index;
              });
            },
            controller: PageController(viewportFraction: 0.92),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    'assets/images/banner.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: const Color(0xFF03AC0E),
                      child: const Center(
                        child: Text(
                          'Promo Spesial Tokopedia',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 6),
        // Active Indicator Dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (index) {
            final isActive = _currentBannerIndex == index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 2.5),
              width: isActive ? 16 : 6,
              height: 5,
              decoration: BoxDecoration(
                color: isActive
                    ? const Color(0xFF03AC0E)
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildQuickMenu() {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        itemCount: dummyMenuButton.length,
        separatorBuilder: (context, index) => const SizedBox(width: 6.0),
        itemBuilder: (context, index) {
          final item = dummyMenuButton[index];
          return MenuButton(
            image: item.image,
            name: item.name,
            onTap: () {},
          );
        },
      ),
    );
  }

  Widget _buildCategoryFilter() {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        itemCount: productCategories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8.0),
        itemBuilder: (context, index) {
          final category = productCategories[index];
          final isSelected = _selectedCategory == category;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategory = category;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
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
                  fontSize: 12.5,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
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
      padding: const EdgeInsets.symmetric(vertical: 40),
      alignment: Alignment.center,
      child: Column(
        children: [
          Icon(Icons.search_off_rounded, size: 54, color: Colors.grey.shade400),
          const SizedBox(height: 12),
          Text(
            'Produk Tidak Ditemukan',
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Coba ubah kata kunci atau pilih kategori lain',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }
}
