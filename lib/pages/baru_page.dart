// import 'package:flutter/material.dart';
// import 'package:flutter_eccomerce/models/menu_baru_dummy.dart';

// class BaruPage extends StatelessWidget {
//   const BaruPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final products = MenuBaruDummy.getDummyList();

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: SizedBox(
//                       height: 40,
//                       padding: const EdgeInsets.symmetric(horizontal: 12),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(8),
//                         border: Border.all(color: Colors.grey.shade300),
//                       ),
//                       child: Row(
//                         children: const [
//                           Icon(Icons.search, color: Colors.grey, size: 20),
//                           SizedBox(width: 8),
//                           Text(
//                             'Cari di Tokopedia',
//                             style: TextStyle(color: Colors.grey, fontSize: 14),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   const Icon(Icons.mail_lock_outlined, color: Colors.black87),
//                   const SizedBox(width: 12),
//                   Stack(
//                     children: [
//                       const Icon(Icons.notifications_none, color: Colors.black87),
//                       Positioned(
//                         right: 0,
//                         top: 0,
//                         child: Container(
//                           padding: const EdgeInsets.all(2),
//                           decoration: const BoxDecoration(
//                             color: Colors.red,
//                             shape: BoxShape.circle,

//                           ),
//                           child: const Text(
//                             '1',
//                             style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
//                           )
//                         )
//                       )
//                     ]
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
