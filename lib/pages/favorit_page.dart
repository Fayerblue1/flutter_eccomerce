import 'package:flutter/material.dart';
import 'package:flutter_eccomerce/components/favorit_card.dart';
import 'package:flutter_eccomerce/models/data_dummy.dart';
import 'package:flutter_eccomerce/models/favorit_model.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritPage extends StatefulWidget {
  const FavoritPage({super.key});

  @override
  State<FavoritPage> createState() => _FavoritPageState();
}

class _FavoritPageState extends State<FavoritPage> {
  String _selectedCategory = 'Electronic';

  List<Favorit> get _filteredFavorit {
    return dummyFavorit
        .where((favorit) => favorit.category == _selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.fromLTRB(16.0, 16.0, 16.0, 0.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.search, size: 25),
                            prefixIconColor: Colors.black,
                            hint: Text(
                              "Cari di Tokopedia",
                              style: GoogleFonts.poppins(
                                color: Colors.grey.shade700,
                                fontSize: 16,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 3),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.mail_outline, size: 25.0),
                        visualDensity: VisualDensity.compact,
                      ),
                      Stack(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.notifications_outlined,

                              size: 25.0,
                            ),
                            visualDensity: VisualDensity.compact,
                          ),
                          Positioned(
                            right: 8.0,
                            top: 5.0,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.redAccent,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                '1',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.shopping_cart_outlined, size: 25.0),
                        visualDensity: VisualDensity.compact,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.menu, size: 25.0),
                        visualDensity: VisualDensity.compact,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Divider(color: Colors.grey, thickness: 1, height: 1),

            SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Favorit Toppers Hari ini",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),

                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey, width: 0.6),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),


          SizedBox(height: 20,),

            Padding(
              padding: EdgeInsetsGeometry.fromLTRB(10.0, 0, 10.0, 0),
              child: SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: favoritCategories.length,
                  separatorBuilder: ((contex, index) => SizedBox(width: 10)),
                  itemBuilder: ((context, index) {
                    final category = favoritCategories[index];
                    final isSelected = _selectedCategory == category;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCategory = category;
                        });
                      },

                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 100),
                        child: Container(
                          width: 150,
                          height: 50,
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.0,
                            vertical: 5.0,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.green.shade50
                                : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(50),
                            border: isSelected
                                ? Border.all(color: Colors.green.shade600,
                                width:1
                                )
                                : Border.all(color: Colors.transparent),
                          ),
                          child: Center(
                            child: Text(
                              category,
                              style: GoogleFonts.poppins(
                                color: isSelected ? Colors.green.shade600 : Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2.5, // Horizontal 6 | vertical 10,
                ),
                itemCount: _filteredFavorit.length,
                itemBuilder: (context, index) {
                  final favorit = _filteredFavorit[index];
                  return FavoritCard(favorit: favorit);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
