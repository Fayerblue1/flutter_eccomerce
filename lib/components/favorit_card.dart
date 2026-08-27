import 'package:flutter/material.dart';
import 'package:flutter_eccomerce/models/favorit_model.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritCard extends StatelessWidget {
  final Favorit favorit;
  final VoidCallback? onTap;

  const FavoritCard({super.key, required this.favorit, this.onTap, });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.09),
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    favorit.image,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      return Container(
                        color: Colors.white,
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.green,
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.white,
                        child: const Icon(
                          Icons.image_not_supported,
                          color: Colors.grey,
                          size: 20,
                        ),
                      );
                    },
                  ),
                ),

                // Positioned(
                //   top: 6,
                //   left: 5,
                //   child: Container(
                //     padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                //     decoration: BoxDecoration(
                //       color: Colors.amberAccent,
                //       borderRadius: BorderRadius.only(
                //         topRight: Radius.circular(10),
                //         bottomRight: Radius.circular(10),
                //       ),
                //     ),
                //     child: Text(
                //       '#${favorit.leaderBoard}',
                //       style: GoogleFonts.poppins(
                //         color: Colors.white,
                //         fontSize: 11,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),
                // ),
                // Row(
                //   children: [
                //     Positioned(
                //       bottom: 0,
                //       left: 0,
                //       right: 0,
                //       child: Container(
                //         width: 200,
                //         padding: EdgeInsets.symmetric(vertical: 3),
                //         decoration: BoxDecoration(color: Colors.green),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Text(
                //               'Ramadhan \nEkstra Seru',
                //               style: GoogleFonts.poppins(
                //                 fontSize: 10,
                //                 fontWeight: FontWeight.w600,
                //                 color: Colors.white,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),

                //     Positioned(
                //       bottom: 0,
                //       left: 0,
                //       right: 0,
                //       child: Container(
                //         width: 200,
                //         padding: EdgeInsets.symmetric(vertical: 3),
                //         decoration: BoxDecoration(color: Colors.green.shade600),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Text(
                //               'Belanja \n20rb',
                //               style: GoogleFonts.poppins(
                //                 fontSize: 10,
                //                 fontWeight: FontWeight.w600,
                //                 color: Colors.yellowAccent,
                //               ),
                //             ),
                //             Text(
                //               'Free \nDilevery',
                //               style: GoogleFonts.poppins(
                //                 fontSize: 10,
                //                 fontWeight: FontWeight.w600,
                //                 color: Colors.white,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),

                //     Positioned(
                //       bottom: 0,
                //       left: 0,
                //       right: 0,
                //       child: Container(
                //         width: 200,
                //         padding: EdgeInsets.symmetric(vertical: 3),
                //         decoration: BoxDecoration(
                //           color: Colors.greenAccent.shade400,
                //         ),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Image.asset(
                //               "assets/images/lokalProduct.png",
                //               width: 100,
                //               height: 100,
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              
              ],
            ),

            //Detailed Product
            // Container(
            //  padding: EdgeInsets.all(5.0),
            //  child:Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text(
            //         favorit.name,
            //         maxLines: 2,
            //         overflow: TextOverflow.ellipsis,
            //         style: GoogleFonts.poppins(fontSize: 13, height: 1.3),
            //     ),

            //     SizedBox(height: 5,),
            //     Row(
            //       children: [
            //         Text(
            //         favorit.price.toString(),
            //         style: GoogleFonts.poppins(
            //           fontWeight: FontWeight.w600,
            //           fontSize: 14,
            //         ),
            //         ),
                      
            //         SizedBox(width: 5,),

            //         Text(
            //         favorit.originalPrice.toString(),
            //         style: GoogleFonts.poppins(
            //           fontWeight: FontWeight.w600,
            //           color: Colors.grey,
            //           fontSize: 11,
            //           decoration: TextDecoration.lineThrough,
            //           decorationColor: Colors.grey,
            //         ),
            //       ),

            //       SizedBox(width: 5,),

            //         Text(
            //           favorit.discount.toString(),
            //           style: GoogleFonts.poppins(
            //             fontWeight: FontWeight.w600,
            //           color: Colors.red,
            //           fontSize: 11,
            //           )
            //           )

            //       ],
            //       ),
            //       Row(
            //         children: [
            //           Icon(
            //             Icons.star,
            //             color: Colors.amber,
            //           ),

            //           SizedBox(width:3),

            //           Padding(
            //           padding: EdgeInsets.symmetric(horizontal:6),
            //           child: 
            //           Text('•',
            //           style:TextStyle(
            //               color:Colors.grey
            //           ),
            //           ),
            //           ),
            //           Text(
            //             '${favorit.sold.toString()}Terjual'  ,
            //             style: TextStyle(
            //               color: Colors.grey.shade400,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),

            //         ],
            //         ),
            //   ],
            //  )
            // )
          
          ],
        ),
      ),
    );
  }
}
