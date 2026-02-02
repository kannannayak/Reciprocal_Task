// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:task/Helper.dart';
// import 'package:task/Home/home.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
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
//                         "Welcome Back!",
//                         style: GoogleFonts.lexend(
//                           color: AppColors.Titletext,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 25,
//                         ),
//                       ),
//                       shbox30,
//                       Text(
//                         "E-mail/Phone Number",
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
//                         "Password",
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
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           InkWell(
//                             onTap: () {
//                               // Navigator.push(
//                               //   context,
//                               //   MaterialPageRoute(
//                               //     builder: (context) => ForgotStart_page(),
//                               //   ),
//                               // );
//                             },
//                             child: Text(
//                               "Forgot password ?",
//                               style: GoogleFonts.lexend(
//                                 color: AppColors.redcolour,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       shbox20,
//                       Center(
//                         child: ElevatedButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => Home_page(),
//                               ),
//                             );
//                           },
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
//                             "Login",
//                             style: GoogleFonts.lexend(
//                               color: AppColors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                             ),
//                           ),
//                         ),
//                       ),
//                       shbox15,
//                       Center(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               "Don’t have an account ? ",
//                               style: GoogleFonts.lexend(
//                                 color: AppColors.Textcolor,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 13,
//                               ),
//                             ),
//                             InkWell(
//                               onTap: () {
//                                 // Navigator.push(
//                                 //   context,
//                                 //   MaterialPageRoute(
//                                 //     builder: (context) => Step1_page(),
//                                 //   ),
//                                 // );
//                               },
//                               child: Text(
//                                 "Sign Up",
//                                 style: GoogleFonts.lexend(
//                                   color: AppColors.redcolour,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 13,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       shbox5,
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

import 'package:task/Registration%20Page/View/Registration.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _handleLogin() async {
    // Clear keyboard
    FocusScope.of(context).unfocus();
    
    String phone = "+91 ${_phoneController.text}";
    String password = _passwordController.text;
    
    // Validation
    if (_phoneController.text.length != 10) {
      _showSnackBar('Please enter valid 10-digit phone number');
      return;
    }
    
    if (password.isEmpty || password.length < 8) {
      _showSnackBar('Please enter valid password (8 characters)');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Initialize database
      await DatabaseHelper().ensureInitialized();
      
      // Check if user exists in database
      bool userExists = await DatabaseHelper().checkUserExists(phone, password);
      
      if (userExists) {
        _showSnackBar('Login successful!', isError: false);
        
        // Wait 2 seconds then navigate
        await Future.delayed(Duration(seconds: 2));
        
        // Clear form
        _phoneController.clear();
        _passwordController.clear();
        
        // Navigate to home
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home_page(),
          ),
        );
      } else {
        _showSnackBar('User not found. Please register first.');
      }
    } catch (e) {
      _showSnackBar('Login failed. Please try again.');
      print('Login error: $e');
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
          // Background
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

          // Login Form
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
                        "Welcome Back!",
                        style: GoogleFonts.lexend(
                          color: AppColors.Titletext,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(height: 30),
                      
                      // Phone Number
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
                      
                      // Password
                      Text(
                        "Password",
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
                      
                      // Forgot Password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              _showSnackBar('Please register first if you don\'t have an account');
                            },
                            child: Text(
                              "Forgot password?",
                              style: GoogleFonts.lexend(
                                color: AppColors.redcolour,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      
                      // Login Button
                      Center(
                        child: _isLoading
                            ? CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: _handleLogin,
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
                                  "Login",
                                  style: GoogleFonts.lexend(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                      ),
                      SizedBox(height: 15),
                      
                      // Sign Up Link
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
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
                                    builder: (context) => RegistrationPage(),
                                  ),
                                );
                              },
                              child: Text(
                                "Sign Up",
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