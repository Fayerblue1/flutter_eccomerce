// import 'package:flutter/material.dart';
// import 'package:flutter_eccomerce/models/menu_baru_dummy.dart';

// class ProductCard extends StatelessWidget {
//   final MenuBaruDummy product;

//   const ProductCard({Key? key, required this.product}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 280,
//       padding: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 4,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Gambar & Ranking Badge
//           Stack(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(6),
//                 child: Image.network(
//                   product.imageUrl,
//                   width: 100,
//                   height: 100,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Positioned(
//                 top: 0,
//                 left: 0,
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//                   decoration: const BoxDecoration(
//                     color: Colors.amber,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(6),
//                       bottomRight: Radius.circular(6),
//                     ),
//                   ),
//                   child: Text(
//                     product.rank,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 11,
//                     ),
//                   ),
//                 ),
//               ),
//               if (product.isAd)
//                 Positioned(
//                   bottom: 4,
//                   right: 4,
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.8),
//                       borderRadius: BorderRadius.circular(3),
//                     ),
//                     child: const Text(
//                       'Ad',
//                       style: TextStyle(fontSize: 9, color: Colors.grey),
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//           const SizedBox(width: 8),

//           // Detail Produk
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   product.title,
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w500,
//                     height: 1.2,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   'Rp${product.price}',
//                   style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 if (product.originalPrice != null) ...[
//                   const SizedBox(height: 2),
//                   Row(
//                     children: [
//                       Text(
//                         'Rp${product.originalPrice}',
//                         style: const TextStyle(
//                           fontSize: 10,
//                           color: Colors.grey,
//                           decoration: TextBaseline.alphabetic == null
//                               ? TextDecoration.lineThrough
//                               : TextDecoration.lineThrough,
//                         ),
//                       ),
//                       const SizedBox(width: 4),
//                       Text(
//                         product.discount ?? '',
//                         style: const TextStyle(
//                           fontSize: 10,
//                           color: Colors.red,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//                 if (product.cashback != null) ...[
//                   const SizedBox(height: 4),
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
//                     decoration: BoxDecoration(
//                       color: Colors.red.shade50,
//                       borderRadius: BorderRadius.circular(4),
//                       border: Border.all(color: Colors.red.shade200),
//                     ),
//                     child: Text(
//                       product.cashback!,
//                       style: const TextStyle(
//                         fontSize: 9,
//                         color: Colors.red,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ],
//                 const SizedBox(height: 6),
//                 Row(
//                   children: [
//                     const Icon(Icons.star, size: 12, color: Colors.amber),
//                     const SizedBox(width: 2),
//                     Text(
//                       '${product.rating}',
//                       style: const TextStyle(
//                         fontSize: 11,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black87,
//                       ),
//                     ),
//                     const Text(' • ', style: TextStyle(fontSize: 11, color: Colors.grey)),
//                     Text(
//                       '${product.sold} terjual',
//                       style: const TextStyle(fontSize: 11, color: Colors.grey),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }