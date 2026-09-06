/// Utility for formatting currency and sales numbers in Indonesian standard format.
class CurrencyFormatter {
  /// Formats a number to Indonesian Rupiah (e.g. 499000 -> "Rp 499.000")
  static String toRupiah(num? amount) {
    if (amount == null) return 'Rp 0';
    final parts = amount.toInt().toString().split('');
    final buffer = StringBuffer();
    int count = 0;
    for (int i = parts.length - 1; i >= 0; i--) {
      buffer.write(parts[i]);
      count++;
      if (count % 3 == 0 && i > 0) {
        buffer.write('.');
      }
    }
    return 'Rp ${buffer.toString().split('').reversed.join()}';
  }

  /// Formats sold count (e.g. 12500 -> "12.500+ Terjual", 450 -> "450 Terjual")
  static String formatSold(int sold) {
    if (sold >= 1000) {
      final inThousands = (sold / 1000).toStringAsFixed(1).replaceAll('.0', '');
      return '$inThousands rb+ terjual';
    }
    return '$sold terjual';
  }
}
