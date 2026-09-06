import 'package:flutter/material.dart';
import 'package:flutter_eccomerce/models/order_model.dart';
import 'package:flutter_eccomerce/utils/currency_formatter.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;
  final VoidCallback? onDetailTap;
  final VoidCallback? onActionTap;

  const OrderCard({
    super.key,
    required this.order,
    this.onDetailTap,
    this.onActionTap,
  });

  Color _getStatusColor() {
    switch (order.status) {
      case OrderStatus.selesai:
        return const Color(0xFF03AC0E); // Tokopedia Green
      case OrderStatus.dikirim:
        return const Color(0xFF0088CC); // Sky Blue
      case OrderStatus.diproses:
        return const Color(0xFFFF9800); // Amber Orange
      case OrderStatus.belumBayar:
        return const Color(0xFFE53935); // Crimson Red
    }
  }

  Color _getStatusBgColor() {
    switch (order.status) {
      case OrderStatus.selesai:
        return const Color(0xFFE8F5E9);
      case OrderStatus.dikirim:
        return const Color(0xFFE1F5FE);
      case OrderStatus.diproses:
        return const Color(0xFFFFF3E0);
      case OrderStatus.belumBayar:
        return const Color(0xFFFFEBEE);
    }
  }

  String _getPrimaryActionLabel() {
    switch (order.status) {
      case OrderStatus.selesai:
        return 'Beli Lagi';
      case OrderStatus.dikirim:
        return 'Lacak';
      case OrderStatus.diproses:
        return 'Hubungi Penjual';
      case OrderStatus.belumBayar:
        return 'Bayar Sekarang';
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor();
    final statusBgColor = _getStatusBgColor();

    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey.shade200, width: 0.8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Store Icon + Store Name + Official Badge + Status Chip
          Padding(
            padding: const EdgeInsets.fromLTRB(14.0, 12.0, 14.0, 10.0),
            child: Row(
              children: [
                const Icon(
                  Icons.storefront_rounded,
                  color: Color(0xFF03AC0E),
                  size: 18,
                ),
                const SizedBox(width: 6),
                Flexible(
                  child: Text(
                    order.storeName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.5,
                      color: const Color(0xFF212121),
                    ),
                  ),
                ),
                if (order.isOfficial) ...[
                  const SizedBox(width: 4),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F5E9),
                      border: Border.all(
                        color: const Color(0xFF03AC0E),
                        width: 0.8,
                      ),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Text(
                      'Official',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF03AC0E),
                        fontSize: 8.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: statusBgColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    order.status.label,
                    style: GoogleFonts.poppins(
                      color: statusColor,
                      fontSize: 10.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1, thickness: 0.8, color: Color(0xFFEEEEEE)),

          // Product Details Row: Thumbnail + Name + Qty + Price
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    order.productImage,
                    width: 64,
                    height: 64,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 64,
                      height: 64,
                      color: Colors.grey.shade100,
                      child: const Icon(
                        Icons.image_not_supported_outlined,
                        color: Colors.grey,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order.productName,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF212121),
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${order.quantity} barang  •  ${CurrencyFormatter.toRupiah(order.price)}',
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        order.orderDate,
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1, thickness: 0.8, color: Color(0xFFEEEEEE)),

          // Bottom Bar: Total Pesanan + Action Buttons
          Padding(
            padding: const EdgeInsets.fromLTRB(14.0, 10.0, 14.0, 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Pesanan',
                      style: GoogleFonts.poppins(
                        fontSize: 10.5,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    Text(
                      CurrencyFormatter.toRupiah(order.totalPrice),
                      style: GoogleFonts.poppins(
                        fontSize: 13.5,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF212121),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    // Secondary Action: Lihat Detail
                    OutlinedButton(
                      onPressed: onDetailTap,
                      style: OutlinedButton.styleFrom(
                        visualDensity: VisualDensity.compact,
                        side: BorderSide(color: Colors.grey.shade300),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                      ),
                      child: Text(
                        'Lihat Detail',
                        style: GoogleFonts.poppins(
                          fontSize: 11.5,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Primary Action: Beli Lagi / Lacak / Bayar
                    ElevatedButton(
                      onPressed: onActionTap,
                      style: ElevatedButton.styleFrom(
                        visualDensity: VisualDensity.compact,
                        backgroundColor: const Color(0xFF03AC0E),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                      ),
                      child: Text(
                        _getPrimaryActionLabel(),
                        style: GoogleFonts.poppins(
                          fontSize: 11.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
