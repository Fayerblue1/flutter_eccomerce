import 'package:flutter/material.dart';
import 'package:flutter_eccomerce/models/product_model.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductCard({super.key, required this.product, this.onTap,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 400,
        width: 200,
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
        child: Column(
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    product.image,
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
                          size: 40,
                        ),
                      );
                    },
                  ),
                ),
                //Badge Diskon
                if(product.discount > 0)
                Positioned(
                  top: 6,
                  left: 6,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular((10.0)),
                    ),
                    child: Text(
                      '${product.discount}%',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                //BAdge Free Ongkir
                if(product.isFreeShipping)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: (Container(
                    padding: EdgeInsets.symmetric(vertical: 3),
                    decoration: BoxDecoration(color: Colors.green),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.local_shipping,
                          color: Colors.white,
                          size: 11,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          'Gratis Ongkir',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )),
                ),
              ],
            ),
            //Detail Product
            Container(
              padding: EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(fontSize: 13, height: 1.3),
                  ),
                  
                  SizedBox(height: 5.0),
                  Text(
                    product.price.toString(),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  
                  if (product.originalPrice != null)
                  Text(
                    product.originalPrice.toString(),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                      fontSize: 11,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),

                      Text(
                        product.rating.toString(),
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(width: 5.0),

                      Text(
                        '|',
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(width: 5.0),


                      Text(
                        '${product.sold.toString()}Terjual'  ,
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),

                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_pin, color: Colors.grey, size: 15),
                      Text(
                        product.location,
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                        ],
                      ),

                      if(product.isOfficial)
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          border: Border.all(color: Colors.green, width: 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          'Official',
                          style: GoogleFonts.poppins(
                            color: Colors.green,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
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
      ),
    );
  }
}
