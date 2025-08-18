// // import 'package:flutter/material.dart';
// // import 'package:supabase_flutter/supabase_flutter.dart';
// // import 'home_screen.dart';

// // class RegisterScreen extends StatefulWidget {
// //   @override
// //   _RegisterScreenState createState() => _RegisterScreenState();
// // }

// // class _RegisterScreenState extends State<RegisterScreen> {
// //   final _emailController = TextEditingController();
// //   final _passwordController = TextEditingController();
// //   final _firstNameController = TextEditingController();
// //   final _lastNameController = TextEditingController();
// //   final _centerNameController = TextEditingController();
// //   final _roleController = TextEditingController();
// //   final _profilePictureController = TextEditingController();

// //   final supabase = Supabase.instance.client;

// //   _register() async {
// //     final response = await supabase.auth.signUp(
// //       _emailController.text,
// //       _passwordController.text,
// //       userMetadata: {
// //         'first_name': _firstNameController.text,
// //         'last_name': _lastNameController.text,
// //         'center_name': _centerNameController.text,
// //         'role': _roleController.text,
// //         'profile_picture': _profilePictureController.text,
// //       },
// //     );

// //     if (response.error != null) {
// //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //         content: Text('Registration failed: ${response.error?.message}'),
// //       ));
// //     } else {
// //       Navigator.pushReplacement(
// //         context,
// //         MaterialPageRoute(builder: (context) => HomeScreen()),
// //       );
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Register')),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
// //             TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Password')),
// //             TextField(controller: _firstNameController, decoration: InputDecoration(labelText: 'First Name')),
// //             TextField(controller: _lastNameController, decoration: InputDecoration(labelText: 'Last Name')),
// //             TextField(controller: _centerNameController, decoration: InputDecoration(labelText: 'Center Name')),
// //             TextField(controller: _roleController, decoration: InputDecoration(labelText: 'Role (teacher/student)')),
// //             ElevatedButton(
// //               onPressed: _register,
// //               child: Text('Register'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// // import 'package:flutter/material.dart';
// // import 'package:supabase_flutter/supabase_flutter.dart';



// // class RegisterScreen extends StatefulWidget {
// //   @override
// //   _RegisterScreenState createState() => _RegisterScreenState();
// // }

// // class _RegisterScreenState extends State<RegisterScreen> {
// //   final _emailController = TextEditingController();
// //   final _passwordController = TextEditingController();
// //   final _firstNameController = TextEditingController();
// //   final _lastNameController = TextEditingController();
// //   final _centerNameController = TextEditingController();
// //   final _roleController = TextEditingController();
// //   final _profilePictureController = TextEditingController();

// //   // Get the Supabase client instance
// //   final supabase = Supabase.instance.client;

// //   // // Register method
// //   // Future<void> _register() async {
// //   //   try {
// //   //     final response = await supabase.auth.signUp(
// //   //       email: _emailController.text, 
// //   // password: _passwordController.text,
// //   // data: 
// //   //       // Use `data` to store additional user info
// //   //       userMetadata: {
// //   //         'first_name': _firstNameController.text,
// //   //         'last_name': _lastNameController.text,
// //   //         'center_name': _centerNameController.text,
// //   //         'role': _roleController.text,
// //   //         'profile_picture': _profilePictureController.text,
         
// //   //       },  
// //   //     );

// //   //     if (response.error != null) {
// //   //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //   //         content: Text('Registration failed: ${response.error!.message}'),
// //   //       ));
// //   //     } else {
// //   //       Navigator.pushReplacement(
// //   //         context,
// //   //         MaterialPageRoute(builder: (context) => HomeScreen()),
// //   //       );
// //   //     }
// //   //   } catch (e) {
// //   //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //   //       content: Text('An error occurred: $e'),
// //   //     ));
// //   //   }
// //   // }
// // Future<void> _register() async {
// //   if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
// //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //       content: Text('Please fill in all fields'),
// //     ));
// //     return;
// //   }

// //   try {
// //     // Prepare the data map for additional user metadata
// //     Map<String, dynamic> userMetadata = {
// //       'first_name': _firstNameController.text,
// //       'last_name': _lastNameController.text,
// //       'center_name': _centerNameController.text,
// //       'role': _roleController.text,
// //       'profile_picture': _profilePictureController.text, // Ensure this is a valid URL
// //     };

// //     // Register the user with email and password (using named parameters)
// //     final response = await supabase.auth.signUp(
// //       email: _emailController.text, // Named parameter
// //       password: _passwordController.text, // Named parameter
// //       data: userMetadata, // Correct way to pass additional metadata
// //     );

// //     if (response.error != null) {
// //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //         content: Text('Registration failed: ${response.error!.message}'),
// //       ));
// //       return;
// //     }

// //     // On successful registration, navigate to the home screen
// //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //       content: Text('Registration successful! Redirecting...'),
// //     ));

// //     Navigator.pushReplacement(
// //       context,
// //       MaterialPageRoute(builder: (context) => HomeScreen()),
// //     );
// //   } catch (e) {
// //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //       content: Text('An error occurred: $e'),
// //     ));
// //   }
// // }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("Register")),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.stretch,
// //           children: [
// //             TextField(
// //               controller: _emailController,
// //               decoration: InputDecoration(labelText: 'Email'),
// //             ),
// //             TextField(
// //               controller: _passwordController,
// //               obscureText: true,
// //               decoration: InputDecoration(labelText: 'Password'),
// //             ),
// //             TextField(
// //               controller: _firstNameController,
// //               decoration: InputDecoration(labelText: 'First Name'),
// //             ),
// //             TextField(
// //               controller: _lastNameController,
// //               decoration: InputDecoration(labelText: 'Last Name'),
// //             ),
// //             TextField(
// //               controller: _centerNameController,
// //               decoration: InputDecoration(labelText: 'Center Name'),
// //             ),
// //             TextField(
// //               controller: _roleController,
// //               decoration: InputDecoration(labelText: 'Role'),
// //             ),
// //             TextField(
// //               controller: _profilePictureController,
// //               decoration: InputDecoration(labelText: 'Profile Picture URL'),
// //             ),
// //             SizedBox(height: 20),
// //             ElevatedButton(
// //               onPressed: _register,
// //               child: Text('Register'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class HomeScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Home Screen')),
// //       body: Center(child: Text('Welcome to Home Screen!')),
// //     );
// //   }
// // }
// // extension AuthResponseExtension on AuthResponse {
// //   // Create a custom getter for 'error'
// //   dynamic get error {
// //     // Return null for this custom getter, or any other custom logic you need
// //     return null;
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class RegisterScreen extends StatefulWidget {
//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _firstNameController = TextEditingController();
//   final _lastNameController = TextEditingController();
//   final _centerNameController = TextEditingController();
//   final _roleController = TextEditingController();
//   final _profilePictureController = TextEditingController();

//   // Get the Supabase client instance
//   final supabase = Supabase.instance.client;

//   // Register method
//   Future<void> _register() async {
//     // Validate input fields
//     if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Please fill in all fields'),
//       ));
//       return;
//     }

//     try {
//       // Prepare the data map for additional user metadata
//       Map<String, dynamic> userMetadata = {
//         'first_name': _firstNameController.text,
//         'last_name': _lastNameController.text,
//         'center_name': _centerNameController.text,
//         'role': _roleController.text,
//         'profile_picture': _profilePictureController.text, // Ensure this is a valid URL
//       };

//       // Register the user with email and password
//       final response = await supabase.auth.signUp(
//         _emailController.text,
//         _passwordController.text,
//         data: userMetadata, // Passing additional user data
//       );

//       // Check if there's an error
//       if (response.error != null) {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('Registration failed: ${response.error!.message}'),
//         ));
//         return;
//       }

//       // On successful registration, navigate to the home screen
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Registration successful! Redirecting...'),
//       ));

//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => HomeScreen()),
//       );
//     } catch (e) {
//       // Handle any exceptions or errors
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('An error occurred: $e'),
//       ));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Register")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: _passwordController,
//               obscureText: true,
//               decoration: InputDecoration(labelText: 'Password'),
//             ),
//             TextField(
//               controller: _firstNameController,
//               decoration: InputDecoration(labelText: 'First Name'),
//             ),
//             TextField(
//               controller: _lastNameController,
//               decoration: InputDecoration(labelText: 'Last Name'),
//             ),
//             TextField(
//               controller: _centerNameController,
//               decoration: InputDecoration(labelText: 'Center Name'),
//             ),
//             TextField(
//               controller: _roleController,
//               decoration: InputDecoration(labelText: 'Role'),
//             ),
//             TextField(
//               controller: _profilePictureController,
//               decoration: InputDecoration(labelText: 'Profile Picture URL'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _register,
//               child: Text('Register'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Home Screen')),
//       body: Center(child: Text('Welcome to Home Screen!')),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class RegisterScreen extends StatefulWidget {
//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _firstNameController = TextEditingController();
//   final _lastNameController = TextEditingController();
//   final _centerNameController = TextEditingController();
//   final _roleController = TextEditingController();
//   final _profilePictureController = TextEditingController();

//   // Get the Supabase client instance
//   final supabase = Supabase.instance.client;

//   // Register method
//   Future<void> _register() async {
//     // Validate input fields
//     if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Please fill in all fields'),
//       ));
//       return;
//     }

//     try {
//       // Prepare the data map for additional user metadata
//       Map<String, dynamic> userMetadata = {
//         'first_name': _firstNameController.text,
//         'last_name': _lastNameController.text,
//         'center_name': _centerNameController.text,
//         'role': _roleController.text,
//         'profile_picture': _profilePictureController.text, // Ensure this is a valid URL
//       };

//       // Register the user with email and password
//       final response = await supabase.auth.signUp(
//         email: _emailController.text,
//         password: _passwordController.text,
//         data: userMetadata, // Passing additional user data
//       );

//       // Check if there's an error
//       if (response.error != null) {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('Registration failed: ${response.error!.message}'),
//         ));
//         return;
//       }

//       // On successful registration, navigate to the home screen
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Registration successful! Redirecting...'),
//       ));

//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => HomeScreen()),
//       );
//     } catch (e) {
//       // Handle any exceptions or errors
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('An error occurred: $e'),
//       ));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Register")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: _passwordController,
//               obscureText: true,
//               decoration: InputDecoration(labelText: 'Password'),
//             ),
//             TextField(
//               controller: _firstNameController,
//               decoration: InputDecoration(labelText: 'First Name'),
//             ),
//             TextField(
//               controller: _lastNameController,
//               decoration: InputDecoration(labelText: 'Last Name'),
//             ),
//             TextField(
//               controller: _centerNameController,
//               decoration: InputDecoration(labelText: 'Center Name'),
//             ),
//             TextField(
//               controller: _roleController,
//               decoration: InputDecoration(labelText: 'Role'),
//             ),
//             TextField(
//               controller: _profilePictureController,
//               decoration: InputDecoration(labelText: 'Profile Picture URL'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _register,
//               child: Text('Register'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Home Screen')),
//       body: Center(child: Text('Welcome to Home Screen!')),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class RegisterScreen extends StatefulWidget {
//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _firstNameController = TextEditingController();
//   final _lastNameController = TextEditingController();
//   final _centerNameController = TextEditingController();
//   final _roleController = TextEditingController();
//   final _profilePictureController = TextEditingController();

//   // Get the Supabase client instance
//   final supabase = Supabase.instance.client;

//   // Register method
//   // Future<void> _register() async {
//   //   // Validate input fields
//   //   if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
//   //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//   //       content: Text('Please fill in all fields'),
//   //     ));
//   //     return;
//   //   }

//   //   try {
//   //     // Prepare the data map for additional user metadata
//   //     Map<String, dynamic> userMetadata = {
//   //       'first_name': _firstNameController.text,
//   //       'last_name': _lastNameController.text,
//   //       'center_name': _centerNameController.text,
//   //       'role': _roleController.text,
//   //       'profile_picture': _profilePictureController.text, // Ensure this is a valid URL
//   //     };

//   //     // Register the user with email and password
//   //     final response = await supabase.auth.signUp(
//   //       email: _emailController.text,
//   //       password: _passwordController.text,
//   //       data: userMetadata, // Passing additional user data
//   //     );

//   //     // Check if the response contains an error
      

//   //     // On successful registration, navigate to the home screen
//   //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//   //       content: Text('Registration successful! Redirecting...'),
//   //     ));

//   //     Navigator.pushReplacement(
//   //       context,
//   //       MaterialPageRoute(builder: (context) => HomeScreen()),
//   //     );
//   //   } catch (e) {
//   //     // Handle any exceptions or errors
//   //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//   //       content: Text('An error occurred: $e'),
//   //     ));
//   //   }
//   // }
//   Future<void> _register() async {
//   if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text('Please fill in all fields'),
//     ));
//     return;
//   }

//   try {
//     // Register the user with email and password
//     final response = await supabase.auth.signUp(
//       email: _emailController.text,
//       password: _passwordController.text,
//     );

//     final user = response.user;

//     // Check if the user was successfully created
//     if (user != null) {
//       // Prepare the user data
//       final userData = {
//         'id': user.id, // UID generated by Supabase
//         'email': _emailController.text,
//         'first_name': _firstNameController.text,
//         'last_name': _lastNameController.text,
//         'center_name': _centerNameController.text,
//         'role': _roleController.text,
//         'profile_picture': _profilePictureController.text,
//       };

//       // Insert the user data into the "users" table
//       final insertResponse = await supabase.from('users').insert(userData);

//       if (insertResponse.error != null) {
//         throw insertResponse.error!;
//       }

//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Registration successful! Redirecting...'),
//       ));

//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => HomeScreen()),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Registration failed. Please try again.'),
//       ));
//     }
//   } catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text('An error occurred: $e'),
//     ));
//   }
// }




//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Register")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: _passwordController,
//               obscureText: true,
//               decoration: InputDecoration(labelText: 'Password'),
//             ),
//             TextField(
//               controller: _firstNameController,
//               decoration: InputDecoration(labelText: 'First Name'),
//             ),
//             TextField(
//               controller: _lastNameController,
//               decoration: InputDecoration(labelText: 'Last Name'),
//             ),
//             TextField(
//               controller: _centerNameController,
//               decoration: InputDecoration(labelText: 'Center Name'),
//             ),
//             TextField(
//               controller: _roleController,
//               decoration: InputDecoration(labelText: 'Role'),
//             ),
//             TextField(
//               controller: _profilePictureController,
//               decoration: InputDecoration(labelText: 'Profile Picture URL'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _register,
//               child: Text('Register'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Home Screen')),
//       body: Center(child: Text('Welcome to Home Screen!')),
//     );
//   }
// }
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:image_picker/image_picker.dart';

// class RegisterScreen extends StatefulWidget {
//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _firstNameController = TextEditingController();
//   final _lastNameController = TextEditingController();
//   String? _selectedCenter;
//   String? _selectedRole;
//   String? _profilePictureUrl;

//   final supabase = Supabase.instance.client;

//   final List<String> _centers = ['Chandragadi', 'Birtamode'];
//   final List<String> _roles = ['Teacher', 'Student'];

//   // Future<void> _pickProfilePicture() async {
//   //   final picker = ImagePicker();
//   //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//   //   if (pickedFile != null) {
      
//   //       final fileBytes = await pickedFile.readAsBytes();
//   //       final fileName = pickedFile.name;

//   //       final response = await supabase.storage
//   //           .from('profile_pictures')
//   //           .upload(fileName, fileBytes as File);

        
    
//   //   }
//   // }
// Future<void> _pickProfilePicture() async {
//   final picker = ImagePicker();
//   final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//   if (pickedFile != null) {
//     final file = File(pickedFile.path); // Create a File object from the picked file.
//     final fileBytes = await file.readAsBytes(); // Read the file as bytes
//     final fileName = pickedFile.name;

//     // Upload the profile picture to Supabase storage
//     final response = await supabase.storage
//         .from('profile_pictures')
//         .upload(fileName, fileBytes as File);

//     if (response == null) {
//       // Successfully uploaded the image
//       final profilePictureUrl = supabase.storage
//           .from('profile_pictures')
//           .getPublicUrl(fileName); // Get public URL for the uploaded image

//       setState(() {
//         _profilePictureUrl = profilePictureUrl;
//       });
//     } else {
//       // Handle error while uploading
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Error uploading profile picture: ${response}'),
//       ));
//     }
//   }
// }



//   // Future<void> _register() async {
//   //   if (_emailController.text.isEmpty ||
//   //       _passwordController.text.isEmpty ||
//   //       _firstNameController.text.isEmpty ||
//   //       _lastNameController.text.isEmpty ||
//   //       _selectedCenter == null ||
//   //       _selectedRole == null 
//   //       // ||
//   //       // _profilePictureUrl == null
//   //       ) {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //         SnackBar(content: Text('Please fill in all fields')));
//   //     return;
//   //   }

//   //   try {
//   //     final response = await supabase.auth.signUp(
//   //       email: _emailController.text,
//   //       password: _passwordController.text,
//   //     );

//   //     final user = response.user;

//   //     if (user != null) {
//   //       final existingTeacher = await supabase
//   //           .from('users')
//   //           .select('id')
//   //           .eq('role', 'Teacher')
//   //           .eq('center_name', _selectedCenter as Object)
//   //           .select();

//   //       if (_selectedRole == 'Teacher' &&
//   //           existingTeacher.isNotEmpty) {
//   //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//   //             content: Text('A teacher is already assigned to this center.')));
//   //         return;
//   //       }

//   //       final userData = {
//   //         'id': user.id,
//   //         'email': _emailController.text,
//   //         'first_name': _firstNameController.text,
//   //         'last_name': _lastNameController.text,
//   //         'center_name': _selectedCenter,
//   //         'role': _selectedRole,
//   //         'profile_picture': _profilePictureUrl,
//   //       };

//   //       final insertResponse = await supabase.from('users').insert(userData);

//   //       if (insertResponse.error == null) {
//   //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//   //             content: Text('Registration successful! Redirecting...')));

//   //         Navigator.pushReplacement(
//   //           context,
//   //           MaterialPageRoute(builder: (context) => HomeScreen()),
//   //         );
//   //       } else {
//   //         throw insertResponse.error!;
//   //       }
//   //     }
//   //   } catch (e) {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //         SnackBar(content: Text('An error occurred: $e')));
//   //   }
//   // }
// Future<void> _register() async {
//   if (_emailController.text.isEmpty ||
//       _passwordController.text.isEmpty ||
//       _firstNameController.text.isEmpty ||
//       _lastNameController.text.isEmpty ||
//       _selectedCenter == null ||
//       _selectedRole == null) {
//     ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please fill in all fields')));
//     return;
//   }

//   try {
//     final response = await supabase.auth.signUp(
//       email: _emailController.text,
//       password: _passwordController.text,
//     );

//     final user = response.user;

//     if (user != null) {
//       final existingTeacher = await supabase
//           .from('users')
//           .select('id')
//           .eq('role', 'Teacher')
//           .eq('center_name', _selectedCenter as Object)
//           .select();

//       if (_selectedRole == 'Teacher' && existingTeacher.isNotEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             content: Text('A teacher is already assigned to this center.')));
//         return;
//       }

//       final userData = {
//         'id': user.id,
//         'email': _emailController.text,
//         'first_name': _firstNameController.text,
//         'last_name': _lastNameController.text,
//         'center_name': _selectedCenter,
//         'role': _selectedRole,
//         'profile_picture': _profilePictureUrl, // Ensure this is not null
//       };

//       final insertResponse = await supabase.from('users').insert(userData);

//       if (insertResponse.error == null) {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             content: Text('Registration successful! Redirecting...')));

//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => HomeScreen()),
//         );
//       } else {
//         throw insertResponse.error!;
//       }
//     }
//   } catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('An error occurred: $e')));
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Register")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               GestureDetector(
//                 onTap: _pickProfilePicture,
//                 child: CircleAvatar(
//                   radius: 50,
//                   backgroundImage: _profilePictureUrl != null
//                       ? NetworkImage(_profilePictureUrl!)
//                       : null,
//                   child: _profilePictureUrl == null
//                       ? Icon(Icons.camera_alt, size: 50)
//                       : null,
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 controller: _firstNameController,
//                 decoration: InputDecoration(labelText: 'First Name'),
//               ),
//               TextField(
//                 controller: _lastNameController,
//                 decoration: InputDecoration(labelText: 'Last Name'),
//               ),
//               DropdownButtonFormField<String>(
//                 value: _selectedCenter,
//                 onChanged: (value) => setState(() => _selectedCenter = value),
//                 items: _centers.map((center) {
//                   return DropdownMenuItem(
//                     value: center,
//                     child: Text(center),
//                   );
//                 }).toList(),
//                 decoration: InputDecoration(labelText: 'Select Center'),
//               ),
//               DropdownButtonFormField<String>(
//                 value: _selectedRole,
//                 onChanged: (value) => setState(() => _selectedRole = value),
//                 items: _roles.map((role) {
//                   return DropdownMenuItem(
//                     value: role,
//                     child: Text(role),
//                   );
//                 }).toList(),
//                 decoration: InputDecoration(labelText: 'Select Role'),
//               ),
//               TextField(
//                 controller: _emailController,
//                 decoration: InputDecoration(labelText: 'Email'),
//               ),
//               TextField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(labelText: 'Password'),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _register,
//                 child: Text('Register'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Home Screen')),
//       body: Center(child: Text('Welcome to Home Screen!')),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class RegisterScreen extends StatefulWidget {
//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isLoading = false;

// //   Future<void> _register() async {
// //     final email = _emailController.text;
// //     final password = _passwordController.text;

// //     if (email.isEmpty || password.isEmpty) {
// //       _showError("Please enter email and password.");
// //       return;
// //     }

// //     setState(() {
// //       _isLoading = true;
// //     });

// //     try {
// //       final response = await Supabase.instance.client.auth.signUp(
// //   email: email, 
// //   password: password
// // );

// //       if (response != null) {
// //         _showError(response as String);
// //       } else {
// //         // Handle successful registration
// //         Navigator.pushReplacementNamed(context, '/home'); // Navigate to the home screen
// //       }
// //     } catch (e) {
// //       _showError("An error occurred: $e");
// //     } finally {
// //       setState(() {
// //         _isLoading = false;
// //       });
// //     }
// //   }
// Future<void> _register() async {
//   final email = _emailController.text.trim();
//   final password = _passwordController.text.trim();

//   if (email.isEmpty || password.isEmpty) {
//     _showError("Please enter both email and password.");
//     return;
//   }

//   setState(() {
//     _isLoading = true;
//   });

//   try {
//     final response = await Supabase.instance.client.auth.signUp(
//       email: email,
//       password: password,
//     );

    
//       // Registration was successful
//       Navigator.pushReplacementNamed(context, '/prehome');
    
//   } catch (e) {
//     _showError("An unexpected error occurred: $e");
//   } finally {
//     setState(() {
//       _isLoading = false;
//     });
//   }
// }

//   void _showError(String message) {
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: Text("Error"),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: Text("OK"),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Register")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: "Email"),
//               keyboardType: TextInputType.emailAddress,
//             ),
//             SizedBox(height: 16),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(labelText: "Password"),
//               obscureText: true,
//             ),
//             SizedBox(height: 32),
//             _isLoading
//                 ? CircularProgressIndicator()
//                 : ElevatedButton(
//                     onPressed: _register,
//                     child: Text("Register"),
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'prehome_screen.dart';

// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({Key? key}) : super(key: key);

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isLoading = false;

//   Future<void> _registerUser() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final response = await Supabase.instance.client.auth.signUp(
//         email: _emailController.text,
//         password: _passwordController.text,
//       );

//       if (response.user == null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(response.toString() ?? 'Registration failed')),
//         );
//       } else {
//         final uid = response.user!.id;

//         // Navigate to PreHomeScreen and pass UID
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => PreHomeScreen(uid: uid),
//           ),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('An error occurred: $e')),
//       );
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Register')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//               keyboardType: TextInputType.emailAddress,
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             const SizedBox(height: 20),
//             _isLoading
//                 ? CircularProgressIndicator()
//                 : ElevatedButton(
//                     onPressed: _registerUser,
//                     child: Text('Register'),
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'home_screen.dart';
import 'prehome_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  // Future<void> _registerUser() async {
  //   setState(() {
  //     _isLoading = true;
  //   });

  //   try {
  //     final response = await Supabase.instance.client.auth.signUp(
  //       email: _emailController.text,
  //       password: _passwordController.text,

  //     );

  //     if (response.user == null) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text(response.toString() ?? 'Registration failed')),
  //       );
  //     } else {
  //       final uid = response.user!.id;

  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => HomeScreen(),
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('An error occurred: $e')),
  //     );
  //   } finally {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }
Future<void> _registerUser() async {
  setState(() {
    _isLoading = true;
  });

  try {
    // Sign up user with Supabase
    final response = await Supabase.instance.client.auth.signUp(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (response.user != null) {
      final uid = response.user!.id;

      // Save additional details in the 'users' table
      final insertResponse = await Supabase.instance.client
          .from('users')
          .insert({
        'email': _emailController.text,
        'password': _passwordController.text, // Save raw password if needed (not recommended in production).
      });

      // if (insertResponse.error != null) {
      //   throw insertResponse.error!;
      // }

      // Navigate to home screen on success
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response.toString() ?? 'Registration failed')),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('An error occurred: $e')),
    );
  } finally {
    setState(() {
      _isLoading = false;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Create Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email, color: Colors.white70),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.white70),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 30),
                _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                        onPressed: _registerUser,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.blueAccent, backgroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                const SizedBox(height: 15),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Already have an account? Login',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
