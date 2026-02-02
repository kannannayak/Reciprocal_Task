// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:task/Helper.dart';
// import 'package:task/Home/home.dart';

// class RegistrationPage extends StatefulWidget {
//   const RegistrationPage({Key? key}) : super(key: key);

//   @override
//   State<RegistrationPage> createState() => _RegistrationPageState();
// }

// class _RegistrationPageState extends State<RegistrationPage> {
//   bool _isPasswordVisible = false;
//   @override
//   Widget build(BuildContext context) {
//     setScreenSize(context);
//     return Scaffold(
//       body: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           Column(
//             children: [
//               Container(
//                 height: screenHeight * 0.59,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   borderRadius: const BorderRadius.only(
//                     bottomLeft: Radius.circular(50),
//                     bottomRight: Radius.circular(50),
//                   ),
//                   color: Colors.blue[800],
//                   image: DecorationImage(
//                     image: AssetImage("assets/images/Anhet.png"),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ],
//           ),

//           Positioned(
//             bottom: 0,
//             child: Container(
//               height: screenHeight * 0.58,
//               width: screenWidth,
//               decoration: BoxDecoration(
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(50),
//                   topRight: Radius.circular(50),
//                 ),
//                 color: AppColors.fillcolour,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 50, right: 30),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       shbox20,
//                       Text(
//                         "Create Account!",
//                         style: GoogleFonts.lexend(
//                           color: AppColors.Titletext,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 25,
//                         ),
//                       ),
//                       shbox30,
//                       Text(
//                         "Phone Number",
//                         style: GoogleFonts.lexend(
//                           color: AppColors.Textcolor,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15,
//                         ),
//                       ),
//                       shbox5,
//                       TextField(
//                         maxLength: 10,
//                         decoration: InputDecoration(
//                           prefix: Text(
//                             "+91 ",
//                             style: GoogleFonts.lexend(
//                               color: AppColors.Black,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         keyboardType: TextInputType.number,
//                         // inputFormatters: <TextInputFormatter>[
//                         //   FilteringTextInputFormatter.digitsOnly
//                         // ],
//                       ),
//                       shbox20,
//                       Text(
//                         "Password Pin",
//                         style: GoogleFonts.lexend(
//                           color: AppColors.Textcolor,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15,
//                         ),
//                       ),
//                       shbox5,
//                       TextField(
//                         maxLength: 8,
//                         obscureText: !_isPasswordVisible,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                           suffix: IconButton(
//                             icon: Icon(
//                               _isPasswordVisible
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                               color: AppColors.Textcolor,
//                             ),
//                             onPressed: () {
//                               setState(() {
//                                 _isPasswordVisible = !_isPasswordVisible;
//                               });
//                             },
//                           ),
//                         ),
//                       ),
//                       shbox20,
//                       Text(
//                         "Confirm Pin",
//                         style: GoogleFonts.lexend(
//                           color: AppColors.Textcolor,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15,
//                         ),
//                       ),
//                       shbox5,
//                       TextField(
//                         maxLength: 8,
//                         obscureText: !_isPasswordVisible,
//                         keyboardType: TextInputType.number,
//                         decoration: InputDecoration(
//                           suffix: IconButton(
//                             icon: Icon(
//                               _isPasswordVisible
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                               color: AppColors.Textcolor,
//                             ),
//                             onPressed: () {
//                               setState(() {
//                                 _isPasswordVisible = !_isPasswordVisible;
//                               });
//                             },
//                           ),
//                         ),
//                       ),
//                       shbox20,

//                       Center(
//                         child: ElevatedButton(
//                           onPressed: () {},
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: AppColors.redcolour,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 75,
//                               vertical: 20,
//                             ), // width, height
//                           ),
//                           child: Text(
//                             "Submit",
//                             style: GoogleFonts.lexend(
//                               color: AppColors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                             ),
//                           ),
//                         ),
//                       ),
//                       shbox15,
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }






import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/DB/Db.dart';
import 'package:task/Helper.dart';
import 'package:task/Home/home.dart';

import 'package:task/Login/View/Login.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _handleRegistration() async {
    // Clear previous errors
    FocusScope.of(context).unfocus();
    
    String phone = "+91 ${_phoneController.text}";
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;
    
    // Validation
    if (_phoneController.text.length != 10) {
      _showSnackBar('Please enter valid 10-digit phone number');
      return;
    }
    
    if (password.length < 8) {
      _showSnackBar('Password must be at least 8 characters');
      return;
    }
    
    if (password != confirmPassword) {
      _showSnackBar('Passwords do not match');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Initialize database if needed
      await DatabaseHelper().ensureInitialized();
      
      // Register user
      bool success = await DatabaseHelper().registerUser(phone, password);
      
      if (success) {
        _showSnackBar('Registration successful!', isError: false);
        
        // Show success message for 2 seconds then navigate
        await Future.delayed(Duration(seconds: 2));
        
        // Clear form
        _phoneController.clear();
        _passwordController.clear();
        _confirmPasswordController.clear();
        
        // Navigate to home page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      } else {
        _showSnackBar('This phone number is already registered');
      }
    } catch (e) {
      _showSnackBar('Registration failed. Please try again.');
      print('Registration error: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showSnackBar(String message, {bool isError = true}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    setScreenSize(context);
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // Background image
          Column(
            children: [
              Container(
                height: screenHeight * 0.59,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  // color: Colors.blue[800],
                  image: DecorationImage(
                    image: AssetImage("assets/images/Reciprocal-log.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),

          // Registration form
          Positioned(
            bottom: 0,
            child: Container(
              height: screenHeight * 0.58,
              width: screenWidth,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                color: AppColors.fillcolour,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 30),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "Create Account!",
                        style: GoogleFonts.lexend(
                          color: AppColors.Titletext,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(height: 30),
                      
                      // Phone Number Field
                      Text(
                        "Phone Number",
                        style: GoogleFonts.lexend(
                          color: AppColors.Textcolor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 5),
                      TextField(
                        controller: _phoneController,
                        maxLength: 10,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          prefix: Text(
                            "+91 ",
                            style: GoogleFonts.lexend(
                              color: AppColors.Black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      
                      // Password Field
                      Text(
                        "Password Pin",
                        style: GoogleFonts.lexend(
                          color: AppColors.Textcolor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 5),
                      TextField(
                        controller: _passwordController,
                        maxLength: 8,
                        obscureText: !_isPasswordVisible,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppColors.Textcolor,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      
                      // Confirm Password Field
                      Text(
                        "Confirm Pin",
                        style: GoogleFonts.lexend(
                          color: AppColors.Textcolor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 5),
                      TextField(
                        controller: _confirmPasswordController,
                        maxLength: 8,
                        obscureText: !_isConfirmPasswordVisible,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isConfirmPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppColors.Textcolor,
                            ),
                            onPressed: () {
                              setState(() {
                                _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      // Submit Button
                      Center(
                        child: _isLoading
                            ? CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: _handleRegistration,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.redcolour,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 75,
                                    vertical: 20,
                                  ),
                                ),
                                child: Text(
                                  "Submit",
                                  style: GoogleFonts.lexend(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                      ),
                      SizedBox(height: 15),
                      
                      // Already have account link
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: GoogleFonts.lexend(
                                color: AppColors.Textcolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ),
                                );
                              },
                              child: Text(
                                "Login",
                                style: GoogleFonts.lexend(
                                  color: AppColors.redcolour,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}