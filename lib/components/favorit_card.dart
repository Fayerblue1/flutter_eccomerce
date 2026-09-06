import 'package:flutter/material.dart';
import 'package:flutter_eccomerce/models/product_model.dart';
import 'package:flutter_eccomerce/utils/currency_formatter.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritCard extends StatelessWidget {
  final Product favorit;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;

  const FavoritCard({
    super.key,
    required this.favorit,
    this.onTap,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade200, width: 0.8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(12),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Left: Product Image with Leaderboard Badge & Free Ongkir Strip
              SizedBox(
                width: 125,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        favorit.image,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.shade100,
                            child: const Center(
                              child: Icon(
                                Icons.image_not_supported_outlined,
                                color: Colors.grey,
                                size: 32,
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // Leaderboard Rank Badge (Top Left)
                    if (favorit.leaderBoard != null)
                      Positioned(
                        top: 6,
                        left: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFFF9800), Color(0xFFFFB300)],
                            ),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(6),
                              bottomRight: Radius.circular(6),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withAlpha(30),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.emoji_events,
                                color: Colors.white,
                                size: 12,
                              ),
                              const SizedBox(width: 3),
                              Text(
                                '#${favorit.leaderBoard}',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 10.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    // Bottom Tag (Free delivery or special promo)
                    if (favorit.requirementFreeDelivery)
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 2.5),
                          color: const Color(0xFF03AC0E),
                          child: Text(
                            'Bebas Ongkir',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // Right: Product Details & Badges
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Name & Favorite Toggle Row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              favorit.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                height: 1.3,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF212121),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: onFavoriteTap,
                            borderRadius: BorderRadius.circular(20),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(
                                favorit.isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: favorit.isFavorite
                                    ? const Color(0xFFE53935)
                                    : Colors.grey.shade400,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 6),

                      // Pricing Row (Current + Original + Discount %)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            CurrencyFormatter.toRupiah(favorit.price),
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: const Color(0xFF212121),
                            ),
                          ),
                          if (favorit.originalPrice != null &&
                              favorit.discount > 0) ...[
                            const SizedBox(width: 6),
                            Text(
                              CurrencyFormatter.toRupiah(favorit.originalPrice),
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade500,
                                fontSize: 10.5,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 1,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFEBEE),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Text(
                                '${favorit.discount}%',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFE53935),
                                  fontSize: 9.5,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),

                      const SizedBox(height: 6),

                      // Badges strip (Ramadhan Seru / Lokal Product)
                      if (favorit.ramadhanSeru || favorit.localProduct)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6.0),
                          child: Wrap(
                            spacing: 4,
                            children: [
                              if (favorit.ramadhanSeru)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE8F5E9),
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: const Color(0xFF03AC0E),
                                      width: 0.6,
                                    ),
                                  ),
                                  child: Text(
                                    'Ramadhan Seru',
                                    style: GoogleFonts.poppins(
                                      fontSize: 9.5,
                                      color: const Color(0xFF03AC0E),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              if (favorit.localProduct)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFF8E1),
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: const Color(0xFFFFA000),
                                      width: 0.6,
                                    ),
                                  ),
                                  child: Text(
                                    'Beli Lokal',
                                    style: GoogleFonts.poppins(
                                      fontSize: 9.5,
                                      color: const Color(0xFFE65100),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),

                      // Rating & Sales Count Row
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: Color(0xFFFFB800),
                            size: 16,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            favorit.rating.toString(),
                            style: GoogleFonts.poppins(
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.w600,
                              fontSize: 11.5,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '•',
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 10,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            CurrencyFormatter.formatSold(favorit.sold),
                            style: GoogleFonts.poppins(
                              color: Colors.grey.shade500,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
