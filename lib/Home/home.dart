

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:task/Helper.dart';

// class Home_page extends StatefulWidget {
//   const Home_page({Key? key}) : super(key: key);

//   @override
//   State<Home_page> createState() => _Home_pageState();
// }

// class _Home_pageState extends State<Home_page> {
//   final List<Map<String, dynamic>> sweets = [
//     {
//       "path": "assets/images/Sweet1.jpeg",
//       "title": "Gulab Jamun",
//       "price": 250.0,
//       "quantity": 0,
//     },
//     {
//       "path": "assets/images/Sweet2.jpeg",
//       "title": "Rasgulla",
//       "price": 200.0,
//       "quantity": 0,
//     },
//     {
//       "path": "assets/images/Sweet3.jpeg",
//       "title": "Jalebi",
//       "price": 180.0,
//       "quantity": 0,
//     },
//     {
//       "path": "assets/images/Sweet4.jpeg",
//       "title": "Barfi",
//       "price": 300.0,
//       "quantity": 0,
//     },
//     {
//       "path": "assets/images/Sweet5.jpeg",
//       "title": "Ladoo",
//       "price": 220.0,
//       "quantity": 0,
//     },
//   ];

//   double totalAmount = 0.0;
//   int totalItems = 0;

//   @override
//   void initState() {
//     super.initState();
//     calculateTotal();
//   }

//   // void calculateTotal() {
//   //   double amount = 0.0;
//   //   int items = 0;

//   //   for (var sweet in sweets) {
//   //     items += sweet["quantity"];
//   //     amount += sweet["quantity"] * sweet["price"];
//   //   }

//   //   setState(() {
//   //     totalAmount = amount;
//   //     totalItems = items;
//   //   });
//   // }

//   void calculateTotal() {
//     double amount = 0.0;
//     int items = 0;

//     for (var sweet in sweets) {
//       // Cast quantity to int
//       items += (sweet["quantity"] as int);
//       amount += (sweet["quantity"] as int) * (sweet["price"] as double);
//     }

//     setState(() {
//       totalAmount = amount;
//       totalItems = items;
//     });
//   }

//   void addToCart(int index) {
//     setState(() {
//       sweets[index]["quantity"] += 1;
//       calculateTotal();
//     });
//   }

//   void removeFromCart(int index) {
//     if (sweets[index]["quantity"] > 0) {
//       setState(() {
//         sweets[index]["quantity"] -= 1;
//         calculateTotal();
//       });
//     }
//   }

//   void navigateToPaymentPage() {
//     // Check if cart has items
//     if (totalItems == 0) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please add items to cart first'),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }

//     // Navigate to payment page
//     // Navigator.push(
//     //   context,
//     //   MaterialPageRoute(
//     //     builder: (context) => PaymentPage(
//     //       cartItems: sweets.where((item) => item["quantity"] > 0).toList(),
//     //       totalAmount: totalAmount,
//     //     ),
//     //   ),
//     // );

//     // For now, show a dialog
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Payment'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Total Items: $totalItems'),
//             Text('Total Amount: ₹${totalAmount.toStringAsFixed(2)}'),
//             SizedBox(height: 10),
//             Text('Proceed to payment?'),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text('Payment successful!'),
//                   backgroundColor: Colors.green,
//                 ),
//               );
//               // Clear cart after successful payment
//               setState(() {
//                 for (var sweet in sweets) {
//                   sweet["quantity"] = 0;
//                 }
//                 calculateTotal();
//               });
//             },
//             child: Text('Confirm Payment'),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     setScreenSize(context);
//     return Scaffold(
//       backgroundColor: AppColors.fillcolour,
//       body: Column(
//         children: [
//           Container(
//             height: screenHeight * 0.12,
//             decoration: BoxDecoration(
//               color: const Color(0xFFE22B4B),
//               borderRadius: const BorderRadius.only(
//                 bottomLeft: Radius.circular(30),
//                 bottomRight: Radius.circular(30),
//               ),
//             ),
//             child: Stack(
//               children: [
//                 // Big circle (left)
//                 Positioned(
//                   left: -10,
//                   top: -10,
//                   child: Container(
//                     width: 60,
//                     height: 60,
//                     decoration: BoxDecoration(
//                       color: Colors.red.shade700.withOpacity(0.6),
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                 ),

//                 // Mid circle (center right)
//                 Positioned(
//                   right: 70,
//                   top: 40,
//                   child: Container(
//                     width: 40,
//                     height: 40,
//                     decoration: BoxDecoration(
//                       color: Colors.red.shade300.withOpacity(0.5),
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                 ),

//                 // Small circle (top right)
//                 Positioned(
//                   right: 20,
//                   top: 25,
//                   child: Container(
//                     width: 18,
//                     height: 18,
//                     decoration: BoxDecoration(
//                       color: Colors.red.shade200.withOpacity(0.6),
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                 ),

//                 // Top small circle (center)
//                 Positioned(
//                   top: -15,
//                   left: 150,
//                   child: Container(
//                     width: 40,
//                     height: 40,
//                     decoration: BoxDecoration(
//                       color: Colors.red.shade900.withOpacity(0.5),
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                 ),

//                 // Center title
//                 Align(
//                   alignment: Alignment.center,
//                   child: Text(
//                     "Home",
//                     style: GoogleFonts.lexend(
//                       color: Colors.white,
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),

//                 // Cart icon with badge
//                 Positioned(
//                   right: 20,
//                   top: 50,
//                   child: Stack(
//                     children: [
//                       IconButton(
//                         onPressed: () {
//                           // Show cart summary
//                           showCartSummary();
//                         },
//                         icon: Icon(
//                           Icons.shopping_cart,
//                           color: Colors.white,
//                           size: 28,
//                         ),
//                       ),
//                       if (totalItems > 0)
//                         Positioned(
//                           right: 8,
//                           top: 8,
//                           child: Container(
//                             padding: EdgeInsets.all(2),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             constraints: BoxConstraints(
//                               minWidth: 16,
//                               minHeight: 16,
//                             ),
//                             child: Text(
//                               '$totalItems',
//                               style: TextStyle(
//                                 color: Color(0xFFE22B4B),
//                                 fontSize: 10,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // Total Amount and Checkout Button
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//             color: Colors.grey[100],
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Total Items: $totalItems',
//                       style: GoogleFonts.lexend(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     Text(
//                       'Total: ₹${totalAmount.toStringAsFixed(2)}',
//                       style: GoogleFonts.lexend(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFFE22B4B),
//                       ),
//                     ),
//                   ],
//                 ),
//                 ElevatedButton(
//                   onPressed: navigateToPaymentPage,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xFFE22B4B),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
//                   ),
//                   child: Row(
//                     children: [
//                       Icon(Icons.payment, color: Colors.white, size: 20),
//                       SizedBox(width: 8),
//                       Text(
//                         'Checkout',
//                         style: GoogleFonts.lexend(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           Expanded(
//             child: GridView.builder(
//               padding: const EdgeInsets.all(12),
//               itemCount: sweets.length,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: MediaQuery.of(context).size.width > 800
//                     ? 5
//                     : MediaQuery.of(context).size.width > 500
//                     ? 3
//                     : 2,
//                 mainAxisSpacing: 12,
//                 crossAxisSpacing: 12,
//                 childAspectRatio: 0.7,
//               ),
//               itemBuilder: (context, index) {
//                 return Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(15),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.2),
//                         blurRadius: 5,
//                         spreadRadius: 1,
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     children: [
//                       // Image Container
//                       Expanded(
//                         flex: 3,
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(15),
//                             topRight: Radius.circular(15),
//                           ),
//                           child: Image.asset(
//                             sweets[index]["path"],
//                             fit: BoxFit.cover,
//                             width: double.infinity,
//                           ),
//                         ),
//                       ),

//                       // Product Details
//                       Padding(
//                         padding: EdgeInsets.all(10),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               sweets[index]["title"],
//                               style: GoogleFonts.lexend(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                             SizedBox(height: 4),
//                             Text(
//                               '₹${sweets[index]["price"]}',
//                               style: GoogleFonts.lexend(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xFFE22B4B),
//                               ),
//                             ),
//                             SizedBox(height: 8),

//                             // Quantity Controls
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 // Remove Button
//                                 Container(
//                                   width: 30,
//                                   height: 30,
//                                   decoration: BoxDecoration(
//                                     color: sweets[index]["quantity"] > 0
//                                         ? Color(0xFFE22B4B)
//                                         : Colors.grey[300],
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: IconButton(
//                                     onPressed: () => removeFromCart(index),
//                                     icon: Icon(
//                                       Icons.remove,
//                                       color: sweets[index]["quantity"] > 0
//                                           ? Colors.white
//                                           : Colors.grey,
//                                       size: 16,
//                                     ),
//                                     padding: EdgeInsets.zero,
//                                   ),
//                                 ),

//                                 // Quantity Display
//                                 Text(
//                                   '${sweets[index]["quantity"]}',
//                                   style: GoogleFonts.lexend(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),

//                                 // Add Button
//                                 Container(
//                                   width: 30,
//                                   height: 30,
//                                   decoration: BoxDecoration(
//                                     color: Color(0xFFE22B4B),
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: IconButton(
//                                     onPressed: () => addToCart(index),
//                                     icon: Icon(
//                                       Icons.add,
//                                       color: Colors.white,
//                                       size: 16,
//                                     ),
//                                     padding: EdgeInsets.zero,
//                                   ),
//                                 ),
//                               ],
//                             ),

//                             // Add to Cart Button (alternative)
//                             SizedBox(height: 8),
//                             ElevatedButton(
//                               onPressed: () => addToCart(index),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Color(0xFFE22B4B),
//                                 minimumSize: Size(double.infinity, 36),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                               ),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Icon(Icons.add_shopping_cart, size: 18),
//                                   SizedBox(width: 5),
//                                   Text(
//                                     'Add to Cart',
//                                     style: GoogleFonts.lexend(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void showCartSummary() {
//     showModalBottomSheet(
//       context: context,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (context) {
//         final cartItems = sweets.where((item) => item["quantity"] > 0).toList();

//         return Container(
//           padding: EdgeInsets.all(20),
//           height: 400,
//           child: Column(
//             children: [
//               Text(
//                 'Cart Summary',
//                 style: GoogleFonts.lexend(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFFE22B4B),
//                 ),
//               ),
//               SizedBox(height: 10),
//               Divider(),
//               Expanded(
//                 child: cartItems.isEmpty
//                     ? Center(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(
//                               Icons.shopping_cart_outlined,
//                               size: 60,
//                               color: Colors.grey,
//                             ),
//                             SizedBox(height: 10),
//                             Text(
//                               'Your cart is empty',
//                               style: GoogleFonts.lexend(
//                                 fontSize: 18,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     : ListView.builder(
//                         itemCount: cartItems.length,
//                         itemBuilder: (context, index) {
//                           var item = cartItems[index];
//                           return ListTile(
//                             leading: CircleAvatar(
//                               backgroundImage: AssetImage(item["path"]),
//                             ),
//                             title: Text(item["title"]),
//                             subtitle: Text(
//                               'Quantity: ${item["quantity"]} × ₹${item["price"]}',
//                             ),
//                             trailing: Text(
//                               '₹${(item["quantity"] * item["price"]).toStringAsFixed(2)}',
//                               style: GoogleFonts.lexend(
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//               ),
//               if (cartItems.isNotEmpty)
//                 Column(
//                   children: [
//                     Divider(),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Total:',
//                           style: GoogleFonts.lexend(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           '₹${totalAmount.toStringAsFixed(2)}',
//                           style: GoogleFonts.lexend(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFFE22B4B),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 10),
//                     ElevatedButton(
//                       onPressed: navigateToPaymentPage,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Color(0xFFE22B4B),
//                         minimumSize: Size(double.infinity, 50),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                       ),
//                       child: Text(
//                         'Proceed to Payment',
//                         style: GoogleFonts.lexend(
//                           fontSize: 16,
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }









import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/Helper.dart';

class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  final List<Map<String, dynamic>> sweets = [
    {
      "path": "assets/images/Sweet1.jpeg",
      "title": "Gulab Jamun",
      "price": 250.0,
      "quantity": 0,
    },
    {
      "path": "assets/images/Sweet2.jpeg",
      "title": "Rasgulla",
      "price": 200.0,
      "quantity": 0,
    },
    {
      "path": "assets/images/Sweet3.jpeg",
      "title": "Jalebi",
      "price": 180.0,
      "quantity": 0,
    },
    {
      "path": "assets/images/Sweet4.jpeg",
      "title": "Barfi",
      "price": 300.0,
      "quantity": 0,
    },
    {
      "path": "assets/images/Sweet5.jpeg",
      "title": "Ladoo",
      "price": 220.0,
      "quantity": 0,
    },
  ];

  double totalAmount = 0.0;
  int totalItems = 0;

 
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> filteredSweets = [];

  @override
  void initState() {
    super.initState();
    calculateTotal();
   
    filteredSweets = List.from(sweets);
  }

  void calculateTotal() {
    double amount = 0.0;
    int items = 0;

    for (var sweet in sweets) {
      items += (sweet["quantity"] as int);
      amount += (sweet["quantity"] as int) * (sweet["price"] as double);
    }

    setState(() {
      totalAmount = amount;
      totalItems = items;
    });
  }


  void filterSweets(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredSweets = List.from(sweets);
      } else {
        filteredSweets = sweets.where((sweet) {
          return sweet["title"].toString().toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  void addToCart(int index) {
    setState(() {
      
      final sweetTitle = filteredSweets[index]["title"];
      final originalIndex = sweets.indexWhere((sweet) => sweet["title"] == sweetTitle);
      
      if (originalIndex != -1) {
        sweets[originalIndex]["quantity"] += 1;
      }
      calculateTotal();
    });
  }

  void removeFromCart(int index) {

    final sweetTitle = filteredSweets[index]["title"];
    final originalIndex = sweets.indexWhere((sweet) => sweet["title"] == sweetTitle);
    
    if (originalIndex != -1 && sweets[originalIndex]["quantity"] > 0) {
      setState(() {
        sweets[originalIndex]["quantity"] -= 1;
        calculateTotal();
      });
    }
  }

  void navigateToPaymentPage() {
    
    if (totalItems == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please add items to cart first'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    
    double finalAmount = totalAmount - 20.0;
    if (finalAmount < 0) finalAmount = 0.0;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Payment'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total Items: $totalItems'),
            Text('Subtotal: ₹${totalAmount.toStringAsFixed(2)}'),
            SizedBox(height: 5),
            Text('Bonus: -₹20.00', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Divider(),
            Text('Final Amount: ₹${finalAmount.toStringAsFixed(2)}', 
                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 10),
            Text('Proceed to payment?'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Payment successful! ₹20 bonus applied.'),
                  backgroundColor: Colors.green,
                ),
              );
            
              setState(() {
                for (var sweet in sweets) {
                  sweet["quantity"] = 0;
                }
                calculateTotal();
              });
            },
            child: Text('Confirm Payment'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    setScreenSize(context);
    return Scaffold(
      backgroundColor: AppColors.fillcolour,
      body: Column(
        children: [
          Container(
            height: screenHeight * 0.12,
            decoration: BoxDecoration(
              color: const Color(0xFFE22B4B),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Stack(
              children: [
            
                Positioned(
                  left: -10,
                  top: -10,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.red.shade700.withOpacity(0.6),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),

             
                Positioned(
                  right: 70,
                  top: 40,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.red.shade300.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),

              
                Positioned(
                  right: 20,
                  top: 25,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: Colors.red.shade200.withOpacity(0.6),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),

            
                Positioned(
                  top: -15,
                  left: 150,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.red.shade900.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),

               
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Home",
                    style: GoogleFonts.lexend(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

         
                Positioned(
                  right: 20,
                  top: 50,
                  child: Stack(
                    children: [
                      IconButton(
                        onPressed: () {
                     
                          showCartSummary();
                        },
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      if (totalItems > 0)
                        Positioned(
                          right: 8,
                          top: 8,
                          child: Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            constraints: BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            child: Text(
                              '$totalItems',
                              style: TextStyle(
                                color: Color(0xFFE22B4B),
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),

      
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: Colors.white,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 8),
                    child: Icon(Icons.search, color: Colors.grey[600]),
                  ),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      onChanged: filterSweets,
                      decoration: InputDecoration(
                        hintText: "Search for sweets...",
                        hintStyle: GoogleFonts.lexend(color: Colors.grey[600]),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      style: GoogleFonts.lexend(fontSize: 16),
                    ),
                  ),
                  if (searchController.text.isNotEmpty)
                    IconButton(
                      onPressed: () {
                        searchController.clear();
                        filterSweets('');
                      },
                      icon: Icon(Icons.clear, color: Colors.grey[600]),
                    ),
                ],
              ),
            ),
          ),

         
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            color: Colors.grey[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Items: $totalItems',
                      style: GoogleFonts.lexend(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Subtotal: ₹${totalAmount.toStringAsFixed(2)}',
                      style: GoogleFonts.lexend(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.card_giftcard, color: Colors.green, size: 16),
                        SizedBox(width: 4),
                        Text(
                          'Bonus: ₹20.00',
                          style: GoogleFonts.lexend(
                            fontSize: 14,
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Total: ₹${(totalAmount - 20.0).toStringAsFixed(2)}',
                      style: GoogleFonts.lexend(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFE22B4B),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: navigateToPaymentPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFE22B4B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.payment, color: Colors.white, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Checkout',
                        style: GoogleFonts.lexend(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          if (filteredSweets.length != sweets.length)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.white,
              child: Row(
                children: [
                  Text(
                    '${filteredSweets.length} result${filteredSweets.length == 1 ? '' : 's'} found',
                    style: GoogleFonts.lexend(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      searchController.clear();
                      filterSweets('');
                    },
                    child: Text(
                      'Clear search',
                      style: GoogleFonts.lexend(
                        fontSize: 14,
                        color: Color(0xFFE22B4B),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          Expanded(
            child: filteredSweets.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 60,
                          color: Colors.grey[400],
                        ),
                        SizedBox(height: 16),
                        Text(
                          'No sweets found',
                          style: GoogleFonts.lexend(
                            fontSize: 18,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Try a different search term',
                          style: GoogleFonts.lexend(
                            fontSize: 14,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: filteredSweets.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width > 800
                          ? 5
                          : MediaQuery.of(context).size.width > 500
                              ? 3
                              : 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) {
                      // Get the quantity from original sweets list
                      final sweetTitle = filteredSweets[index]["title"];
                      final originalSweet = sweets.firstWhere(
                        (sweet) => sweet["title"] == sweetTitle,
                        orElse: () => filteredSweets[index],
                      );
                      
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 5,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                        
                            Expanded(
                              flex: 3,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                                child: Image.asset(
                                  filteredSweets[index]["path"],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            ),

                      
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    filteredSweets[index]["title"],
                                    style: GoogleFonts.lexend(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '₹${filteredSweets[index]["price"]}',
                                    style: GoogleFonts.lexend(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFE22B4B),
                                    ),
                                  ),
                                  SizedBox(height: 8),

                                  // Quantity Controls
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Remove Button
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: originalSweet["quantity"] > 0
                                              ? Color(0xFFE22B4B)
                                              : Colors.grey[300],
                                          shape: BoxShape.circle,
                                        ),
                                        child: IconButton(
                                          onPressed: () => removeFromCart(index),
                                          icon: Icon(
                                            Icons.remove,
                                            color: originalSweet["quantity"] > 0
                                                ? Colors.white
                                                : Colors.grey,
                                            size: 16,
                                          ),
                                          padding: EdgeInsets.zero,
                                        ),
                                      ),

                                      // Quantity Display
                                      Text(
                                        '${originalSweet["quantity"]}',
                                        style: GoogleFonts.lexend(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      // Add Button
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFE22B4B),
                                          shape: BoxShape.circle,
                                        ),
                                        child: IconButton(
                                          onPressed: () => addToCart(index),
                                          icon: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                          padding: EdgeInsets.zero,
                                        ),
                                      ),
                                    ],
                                  ),

                                  // Add to Cart Button (alternative)
                                  SizedBox(height: 8),
                                  ElevatedButton(
                                    onPressed: () => addToCart(index),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xFFE22B4B),
                                      minimumSize: Size(double.infinity, 36),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.add_shopping_cart, size: 18),
                                        SizedBox(width: 5),
                                        Text(
                                          'Add to Cart',
                                          style: GoogleFonts.lexend(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void showCartSummary() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        final cartItems = sweets.where((item) => item["quantity"] > 0).toList();
        final finalAmount = totalAmount - 20.0;

        return Container(
          padding: EdgeInsets.all(20),
          height: 450,
          child: Column(
            children: [
              Text(
                'Cart Summary',
                style: GoogleFonts.lexend(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE22B4B),
                ),
              ),
              SizedBox(height: 10),
              Divider(),
              
            
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green[200]!),
                ),
                child: Row(
                  children: [
                    Icon(Icons.card_giftcard, color: Colors.green),
                    SizedBox(width: 10),
                    Text(
                      '₹20.00 Bonus Applied',
                      style: GoogleFonts.lexend(
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              
              Expanded(
                child: cartItems.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              size: 60,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Your cart is empty',
                              style: GoogleFonts.lexend(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          var item = cartItems[index];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: AssetImage(item["path"]),
                            ),
                            title: Text(item["title"]),
                            subtitle: Text(
                              'Quantity: ${item["quantity"]} × ₹${item["price"]}',
                            ),
                            trailing: Text(
                              '₹${(item["quantity"] * item["price"]).toStringAsFixed(2)}',
                              style: GoogleFonts.lexend(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
              ),
              if (cartItems.isNotEmpty)
                Column(
                  children: [
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal:',
                          style: GoogleFonts.lexend(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '₹${totalAmount.toStringAsFixed(2)}',
                          style: GoogleFonts.lexend(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.card_giftcard, size: 16, color: Colors.green),
                            SizedBox(width: 5),
                            Text(
                              'Bonus:',
                              style: GoogleFonts.lexend(
                                fontSize: 16,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '-₹20.00',
                          style: GoogleFonts.lexend(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total:',
                          style: GoogleFonts.lexend(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '₹${finalAmount.toStringAsFixed(2)}',
                          style: GoogleFonts.lexend(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFE22B4B),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: navigateToPaymentPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFE22B4B),
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        'Proceed to Payment',
                        style: GoogleFonts.lexend(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }
}