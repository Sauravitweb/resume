// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'register_screen.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   final supabase = Supabase.instance.client;

//   _login() async {
//     final response = await supabase.auth.signInWithPassword(
//       email: _emailController.text,
//       password: _passwordController.text,
//     );

    
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
//             TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Password')),
//             ElevatedButton(
//               onPressed: _login,
//               child: Text('Login'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => RegisterScreen()),
//                 );
//               },
//               child: Text('Create an account'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // extension AuthResponseExtension on AuthResponse {
// //   // Create a custom getter for 'error'
// //   dynamic get error {
// //     // Return null for this custom getter, or any other custom logic you need
// //     return null;
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'register_screen.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final supabase = Supabase.instance.client;

//   // Loading indicator state
//   bool _isLoading = false;

//   _login() async {
//     setState(() {
//       _isLoading = true; // Show loading indicator
//     });

//     try {
//       // Sign in using Supabase
//       final response = await supabase.auth.signInWithPassword(
//         email: _emailController.text.trim(),
//         password: _passwordController.text.trim(),
//       );

//       // Check for errors or success
//       if (response.session != null) {
//         // Navigate to the next screen upon successful login
//         Navigator.pushReplacementNamed(context, '/home');
//       } else {
//         // Show error message if login failed
//         _showError('Login failed. Please check your credentials.');
//       }
//     } catch (error) {
//       // Catch and handle exceptions
//       _showError('An error occurred: $error');
//     } finally {
//       setState(() {
//         _isLoading = false; // Hide loading indicator
//       });
//     }
//   }

//   void _showError(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true, // To obscure password input
//             ),
//             const SizedBox(height: 16),
//             _isLoading
//                 ? CircularProgressIndicator()
//                 : ElevatedButton(
//                     onPressed: _login,
//                     child: Text('Login'),
                    
//                   ),
//             TextButton(
//               onPressed: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => RegisterScreen()),
//                 );
//               },
//               child: Text('Create an account'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'register_screen.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final supabase = Supabase.instance.client;

//   bool _isLoading = false;

//   _login() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final response = await supabase.auth.signInWithPassword(
//         email: _emailController.text.trim(),
//         password: _passwordController.text.trim(),
//       );

//       if (response.session != null) {
//         Navigator.pushReplacementNamed(context, '/home');
//       } else {
//         _showError('Login failed. Please check your credentials.');
//       }
//     } catch (error) {
//       _showError('An error occurred: $error');
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   void _showError(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;

//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.blue.shade900, Colors.blue.shade400],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Container(
//               width: screenSize.width * 0.9,
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black26,
//                     blurRadius: 10,
//                     offset: Offset(0, 4),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     'Welcome Back!',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blue.shade900,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   TextField(
//                     controller: _emailController,
//                     decoration: InputDecoration(
//                       labelText: 'Email',
//                       prefixIcon: Icon(Icons.email),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   TextField(
//                     controller: _passwordController,
//                     decoration: InputDecoration(
//                       labelText: 'Password',
//                       prefixIcon: Icon(Icons.lock),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     obscureText: true,
//                   ),
//                   const SizedBox(height: 20),
//                   _isLoading
//                       ? CircularProgressIndicator()
//                       : ElevatedButton(
//                           onPressed: _login,
//                           style: ElevatedButton.styleFrom(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 40, vertical: 12),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                           child: Text('Login', style: TextStyle(fontSize: 16)),
//                         ),
//                   const SizedBox(height: 20),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => RegisterScreen()),
//                       );
//                     },
//                     child: Text(
//                       'Create an account',
//                       style: TextStyle(color: Colors.blue.shade900),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final supabase = Supabase.instance.client;

  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await supabase.auth.signInWithPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (response.session != null) {
        // Login successful, navigate to home
        _showSnackBar('Login successful!');
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        _showError('Login failed. Please check your credentials.');
      }
    } catch (error) {
      _showError('An error occurred: $error');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade900, Colors.blue.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: screenSize.width * 0.9,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  _isLoading
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: _login, // Calls the _login method
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text('Login', style: TextStyle(fontSize: 16)),
                        ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()),
                      );
                    },
                    child: Text(
                      'Create an account',
                      style: TextStyle(color: Colors.blue.shade900),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
