// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:permission_handler/permission_handler.dart';



// class PreHomeScreen extends StatefulWidget {
//   final String uid; // Pass the user's UID after registration
//   const PreHomeScreen({Key? key, required this.uid}) : super(key: key);

//   @override
//   State<PreHomeScreen> createState() => _PreHomeScreenState();
// }

// class _PreHomeScreenState extends State<PreHomeScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _lastNameController = TextEditingController();
//   String? _selectedCenter;
//   String? _selectedRole;
//   File? _profileImage;
//   final ImagePicker _picker = ImagePicker();
//   bool _isLoading = false;

// //   Future<void> _requestStoragePermission() async {
// //   final status = await Permission.storage.request();

// //   if (status.isDenied) {
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       SnackBar(content: Text('Storage permission is required to select an image.')),
// //     );
// //   } else if (status.isPermanentlyDenied) {
// //     openAppSettings(); // Redirects the user to app settings to enable permissions manually.
// //   }
// // }
//   // Upload profile picture to Supabase Storage

// Future<void> _requestStoragePermission() async {
//   final status = await Permission.storage.request();
//   if (!status.isGranted) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Storage permission is required to select an image.')),
//     );
//   }
// }

//   Future<String?> _uploadProfilePicture(File image) async {
//     try {
//       final storage = Supabase.instance.client.storage.from('profile_pictures');
//       final path = '${widget.uid}/profile_${DateTime.now().millisecondsSinceEpoch}.jpg';
//       await storage.upload(path, image);
//       return storage.getPublicUrl(path);
//     } catch (e) {
//       print('Error uploading image: $e');
//       return null;
//     }
//   }

//   // Save data to Supabase
//   Future<void> _saveData() async {
//     if (!_formKey.currentState!.validate() || _selectedCenter == null || _selectedRole == null || _profileImage == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please fill all fields and upload a profile picture')),
//       );
//       return;
//     }

//     setState(() {
//       _isLoading = true;
//     });

//     final imageUrl = await _uploadProfilePicture(_profileImage!);

//     if (imageUrl == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to upload profile picture')),
//       );
//       setState(() {
//         _isLoading = false;
//       });
//       return;
//     }

//     final response = await Supabase.instance.client
//         .from('users')
//         .upsert({
//           'id': widget.uid,
//           'first_name': _firstNameController.text,
//           'last_name': _lastNameController.text,
//           'center': _selectedCenter,
//           'role': _selectedRole,
//           'profile_picture': imageUrl,
//         });

//     if (response.error != null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to save data: ${response.error!.message}')),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Data saved successfully')),
//       );
//       // Navigate to the next screen (Home Screen)
//       Navigator.pushReplacementNamed(context, '/home');
//     }

//     setState(() {
//       _isLoading = false;
//     });
//   }

//   // Pick image from gallery
//   Future<void> _pickImage() async {
//     await _requestStoragePermission();

//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _profileImage = File(pickedFile.path);
//       });
//     }
//   }

// //   Future<void> _pickImage() async {
// //   // Check for permissions
// //   // await _requestStoragePermission();

// //   if (await Permission.storage.isGranted) {
// //     try {
// //       final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

// //       if (pickedFile != null) {
// //         setState(() {
// //           _profileImage = File(pickedFile.path);
// //         });
// //       } else {
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           SnackBar(content: Text('No image selected.')),
// //         );
// //       }
// //     } catch (e) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('Error picking image: $e')),
// //       );
// //     }
// //   } 
  
// // }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Complete Your Profile')),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _firstNameController,
//                 decoration: InputDecoration(labelText: 'First Name'),
//                 validator: (value) => value == null || value.isEmpty ? 'Please enter your first name' : null,
//               ),
//               const SizedBox(height: 10),
//               TextFormField(
//                 controller: _lastNameController,
//                 decoration: InputDecoration(labelText: 'Last Name'),
//                 validator: (value) => value == null || value.isEmpty ? 'Please enter your last name' : null,
//               ),
//               const SizedBox(height: 10),
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(labelText: 'Center'),
//                 items: ['Chandragadi', 'Birtamode']
//                     .map((center) => DropdownMenuItem(value: center, child: Text(center)))
//                     .toList(),
//                 onChanged: (value) => setState(() => _selectedCenter = value),
//                 validator: (value) => value == null ? 'Please select a center' : null,
//               ),
//               const SizedBox(height: 10),
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(labelText: 'Role'),
//                 items: ['Teacher', 'Student']
//                     .map((role) => DropdownMenuItem(value: role, child: Text(role)))
//                     .toList(),
//                 onChanged: (value) => setState(() => _selectedRole = value),
//                 validator: (value) => value == null ? 'Please select a role' : null,
//               ),
//               const SizedBox(height: 10),
//               GestureDetector(
//                 onTap: _pickImage,
//                 child: _profileImage == null
//                     ? Container(
//                         height: 150,
//                         width: 150,
//                         color: Colors.grey[300],
//                         child: Icon(Icons.camera_alt, size: 50),
//                       )
//                     : CircleAvatar(
//                         radius: 75,
//                         backgroundImage: FileImage(_profileImage!),
//                       ),
//               ),
//               const SizedBox(height: 20),
//               _isLoading
//                   ? CircularProgressIndicator()
//                   : ElevatedButton(
//                       onPressed: _saveData,
//                       child: Text('Save and Continue'),
//                     ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:permission_handler/permission_handler.dart';

// class PreHomeScreen extends StatefulWidget {
//   final String uid; // Pass the user's UID after registration
//   const PreHomeScreen({Key? key, required this.uid}) : super(key: key);

//   @override
//   State<PreHomeScreen> createState() => _PreHomeScreenState();
// }

// class _PreHomeScreenState extends State<PreHomeScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _lastNameController = TextEditingController();
//   String? _selectedCenter;
//   String? _selectedRole;
//   File? _profileImage;
//   final ImagePicker _picker = ImagePicker();
//   bool _isLoading = false;

//   // Request storage permission for accessing image gallery
//   Future<void> _requestStoragePermission() async {
//     final status = await Permission.storage.request();
//     if (!status.isGranted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Storage permission is required to select an image.')),
//       );
//     }
//   }

//   // Upload profile picture to Supabase Storage
//   Future<String?> _uploadProfilePicture(File image) async {
//     try {
//       final storage = Supabase.instance.client.storage.from('profile_pictures');
//       final path = '${widget.uid}/profile_${DateTime.now().millisecondsSinceEpoch}.jpg';
//       await storage.upload(path, image);
//       return storage.getPublicUrl(path);
//     } catch (e) {
//       print('Error uploading image: $e');
//       return null;
//     }
//   }

//   // Save data to Supabase
//   // Future<void> _saveData() async {
//   //   if (!_formKey.currentState!.validate() || _selectedCenter == null || _selectedRole == null || _profileImage == null) {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(content: Text('Please fill all fields and upload a profile picture')),
//   //     );
//   //     return;
//   //   }

//   //   setState(() {
//   //     _isLoading = true;
//   //   });

//   //   final imageUrl = await _uploadProfilePicture(_profileImage!);

//   //   if (imageUrl == null) {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(content: Text('Failed to upload profile picture')),
//   //     );
//   //     setState(() {
//   //       _isLoading = false;
//   //     });
//   //     return;
//   //   }

//   //   final response = await Supabase.instance.client
//   //       .from('users')
//   //       .upsert({
//   //         'id': widget.uid,
//   //         'first_name': _firstNameController.text,
//   //         'last_name': _lastNameController.text,
//   //         'center': _selectedCenter,
//   //         'role': _selectedRole,
//   //         'profile_picture': imageUrl,
//   //       });

//   //   if (response.error != null) {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(content: Text('Failed to save data: ${response.error!.message}')),
//   //     );
//   //   } else {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(content: Text('Data saved successfully')),
//   //     );
//   //     // Navigate to the next screen (Home Screen)
//   //     Navigator.pushReplacementNamed(context, '/home');
//   //   }

//   //   setState(() {
//   //     _isLoading = false;
//   //   });
//   // }
// // Future<void> _saveData() async {
// //   if (!_formKey.currentState!.validate() || _selectedCenter == null || _selectedRole == null || _profileImage == null) {
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       SnackBar(content: Text('Please fill all fields and upload a profile picture')),
// //     );
// //     return;
// //   }

// //   setState(() {
// //     _isLoading = true; // Start the loading spinner
// //   });

// //   try {
// //     final imageUrl = await _uploadProfilePicture(_profileImage!);

// //     if (imageUrl == null) {
// //       throw Exception('Failed to upload profile picture');
// //     }

// //     final response = await Supabase.instance.client
// //         .from('users')
// //         .upsert({
// //           'id': widget.uid,
// //           'first_name': _firstNameController.text,
// //           'last_name': _lastNameController.text,
// //           'center': _selectedCenter,
// //           'role': _selectedRole,
// //           'profile_picture': imageUrl,
// //         });

// //     if (response.error != null) {
// //       throw Exception('Failed to save data: ${response.error!.message}');
// //     }

// //     ScaffoldMessenger.of(context).showSnackBar(
// //       SnackBar(content: Text('Data saved successfully')),
// //     );

// //     Navigator.pushReplacementNamed(context, '/home');
// //   } catch (e) {
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       SnackBar(content: Text('Error: $e')),
// //     );
// //   } finally {
// //     setState(() {
// //       _isLoading = false; // Stop the loading spinner
// //     });
// //   }
// // }
// Future<void> _saveData() async {
//   if (!_formKey.currentState!.validate() || _selectedCenter == null || _selectedRole == null || _profileImage == null) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Please fill all fields and upload a profile picture')),
//     );
//     return;
//   }

//   setState(() {
//     _isLoading = true;
//   });

//   final imageUrl = await _uploadProfilePicture(_profileImage!);

//   if (imageUrl == null) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Failed to upload profile picture')),
//     );
//     setState(() {
//       _isLoading = false;
//     });
//     return;
//   }

//   // try {
//   //   final response = await Supabase.instance.client
//   //       .from('users')
//   //       .upsert({
//   //         'id': widget.uid,
//   //         'first_name': _firstNameController.text,
//   //         'last_name': _lastNameController.text,
//   //         'center': _selectedCenter,
//   //         'role': _selectedRole,
//   //         'profile_picture': imageUrl,
//   //       }); // Explicitly call execute()

//   //   if (response.error != null) {
//   //     throw Exception(response.error!.message); // Handle Supabase error
//   //   }

//   //   ScaffoldMessenger.of(context).showSnackBar(
//   //     SnackBar(content: Text('Data saved successfully')),
//   //   );
//   //   Navigator.pushReplacementNamed(context, '/home');
//   // } catch (e) {
//   //   ScaffoldMessenger.of(context).showSnackBar(
//   //     SnackBar(content: Text('Failed to save data: $e')),
//   //   );
//   // } finally {
//   //   setState(() {
//   //     _isLoading = false;
//   //   });
//   // }
  
//   final response = await Supabase.instance.client
//       .from('users')
//       .upsert({
//         'id': widget.uid,
//         'first_name': _firstNameController.text,
//         'last_name': _lastNameController.text,
//         'center': _selectedCenter,
//         'role': _selectedRole,
//         'profile_picture': imageUrl,
//       });

//   // if (response == null) {
//   //   ScaffoldMessenger.of(context).showSnackBar(
//   //     SnackBar(content: Text('No response from the server. Please try again later.')),
//   //   );
//   //   return;
//   // }

//   // if (response.error != null) {
//   //   ScaffoldMessenger.of(context).showSnackBar(
//   //     SnackBar(content: Text('Failed to save data: ${response.error!.message}')),
//   //   );
//   //   return;
//   // }

//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(content: Text('Data saved successfully')),
//   );
//   Navigator.pushReplacementNamed(context, '/home');


// }

//   // Pick image from gallery
//   Future<void> _pickImage() async {
//     await _requestStoragePermission();

//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _profileImage = File(pickedFile.path);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Complete Your Profile')),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _firstNameController,
//                 decoration: InputDecoration(labelText: 'First Name'),
//                 validator: (value) => value == null || value.isEmpty ? 'Please enter your first name' : null,
//               ),
//               const SizedBox(height: 10),
//               TextFormField(
//                 controller: _lastNameController,
//                 decoration: InputDecoration(labelText: 'Last Name'),
//                 validator: (value) => value == null || value.isEmpty ? 'Please enter your last name' : null,
//               ),
//               const SizedBox(height: 10),
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(labelText: 'Center'),
//                 items: ['Chandragadi', 'Birtamode']
//                     .map((center) => DropdownMenuItem(value: center, child: Text(center)))
//                     .toList(),
//                 onChanged: (value) => setState(() => _selectedCenter = value),
//                 validator: (value) => value == null ? 'Please select a center' : null,
//               ),
//               const SizedBox(height: 10),
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(labelText: 'Role'),
//                 items: ['Teacher', 'Student']
//                     .map((role) => DropdownMenuItem(value: role, child: Text(role)))
//                     .toList(),
//                 onChanged: (value) => setState(() => _selectedRole = value),
//                 validator: (value) => value == null ? 'Please select a role' : null,
//               ),
//               const SizedBox(height: 10),
//               GestureDetector(
//                 onTap: _pickImage,
//                 child: _profileImage == null
//                     ? Container(
//                         height: 150,
//                         width: 150,
//                         color: Colors.grey[300],
//                         child: Icon(Icons.camera_alt, size: 50),
//                       )
//                     : CircleAvatar(
//                         radius: 75,
//                         backgroundImage: FileImage(_profileImage!),
//                       ),
//               ),
//               const SizedBox(height: 20),
//               _isLoading
//                   ? CircularProgressIndicator()
//                   : ElevatedButton(
//                       onPressed: _saveData,
//                       child: Text('Save and Continue'),
//                     ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:permission_handler/permission_handler.dart';

// class PreHomeScreen extends StatefulWidget {
//   final String uid; // Pass the user's UID after registration
//   const PreHomeScreen({Key? key, required this.uid}) : super(key: key);

//   @override
//   State<PreHomeScreen> createState() => _PreHomeScreenState();
// }

// class _PreHomeScreenState extends State<PreHomeScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _lastNameController = TextEditingController();
//   String? _selectedCenter;
//   String? _selectedRole;
//   File? _profileImage;
//   final ImagePicker _picker = ImagePicker();
//   bool _isLoading = false;

//   // Request storage permission for accessing image gallery
//   Future<void> _requestStoragePermission() async {
//     final status = await Permission.storage.request();
//     if (!status.isGranted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Storage permission is required to select an image.'),
//         ),
//       );
//     }
//   }

//   // Upload profile picture to Supabase Storage
//   Future<String?> _uploadProfilePicture(File image) async {
//     try {
//       final storage = Supabase.instance.client.storage.from('profile_pictures');
//       final path = '${widget.uid}/profile_${DateTime.now().millisecondsSinceEpoch}.jpg';
//       await storage.upload(path, image);
//       return storage.getPublicUrl(path);
//     } catch (e) {
//       print('Error uploading image: $e');
//       return null;
//     }
//   }

//   // Save user data
//   Future<void> _saveData() async {
//     if (!_formKey.currentState!.validate() ||
//         _selectedCenter == null ||
//         _selectedRole == null ||
//         _profileImage == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please complete all fields and upload a profile picture.')),
//       );
//       return;
//     }

//     setState(() {
//       _isLoading = true;
//     });

//     final imageUrl = await _uploadProfilePicture(_profileImage!);

//     if (imageUrl == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Failed to upload profile picture.')),
//       );
//       setState(() {
//         _isLoading = false;
//       });
//       return;
//     }

//     final response = await Supabase.instance.client.from('users').upsert({
//       'id': widget.uid,
//       'first_name': _firstNameController.text,
//       'last_name': _lastNameController.text,
//       'center': _selectedCenter,
//       'role': _selectedRole,
//       'profile_picture': imageUrl,
//     });

//     if (response.error != null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: ${response.error!.message}')),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Profile completed successfully!')),
//       );
//       Navigator.pushReplacementNamed(context, '/home');
//     }

//     setState(() {
//       _isLoading = false;
//     });
//   }

//   // Pick image from gallery
//   Future<void> _pickImage() async {
//     await _requestStoragePermission();
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _profileImage = File(pickedFile.path);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Complete Your Profile'),
//         centerTitle: true,
//         backgroundColor: Theme.of(context).primaryColor,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Center(
//                 child: GestureDetector(
//                   onTap: _pickImage,
//                   child: _profileImage == null
//                       ? Container(
//                           height: 150,
//                           width: 150,
//                           decoration: BoxDecoration(
//                             color: Colors.grey[300],
//                             shape: BoxShape.circle,
//                           ),
//                           child: const Icon(Icons.camera_alt, size: 50, color: Colors.black54),
//                         )
//                       : CircleAvatar(
//                           radius: 75,
//                           backgroundImage: FileImage(_profileImage!),
//                         ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextFormField(
//                 controller: _firstNameController,
//                 decoration: const InputDecoration(labelText: 'First Name'),
//                 validator: (value) =>
//                     value == null || value.isEmpty ? 'Please enter your first name' : null,
//               ),
//               const SizedBox(height: 15),
//               TextFormField(
//                 controller: _lastNameController,
//                 decoration: const InputDecoration(labelText: 'Last Name'),
//                 validator: (value) =>
//                     value == null || value.isEmpty ? 'Please enter your last name' : null,
//               ),
//               const SizedBox(height: 15),
//               DropdownButtonFormField<String>(
//                 decoration: const InputDecoration(labelText: 'Select Center'),
//                 items: ['Chandragadi', 'Birtamode']
//                     .map((center) => DropdownMenuItem(value: center, child: Text(center)))
//                     .toList(),
//                 onChanged: (value) => setState(() => _selectedCenter = value),
//                 validator: (value) => value == null ? 'Please select a center' : null,
//               ),
//               const SizedBox(height: 15),
//               DropdownButtonFormField<String>(
//                 decoration: const InputDecoration(labelText: 'Select Role'),
//                 items: ['Teacher', 'Student']
//                     .map((role) => DropdownMenuItem(value: role, child: Text(role)))
//                     .toList(),
//                 onChanged: (value) => setState(() => _selectedRole = value),
//                 validator: (value) => value == null ? 'Please select a role' : null,
//               ),
//               const SizedBox(height: 25),
//               _isLoading
//                   ? const Center(child: CircularProgressIndicator())
//                   : ElevatedButton.icon(
//                       onPressed: _saveData,
//                       icon: const Icon(Icons.save),
//                       label: const Text('Save and Continue'),
//                       style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(vertical: 16),
//                       ),
//                     ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:permission_handler/permission_handler.dart';

// class PreHomeScreen extends StatefulWidget {
//   final String uid;

//   const PreHomeScreen({Key? key, required this.uid}) : super(key: key);

//   @override
//   State<PreHomeScreen> createState() => _PreHomeScreenState();
// }

// class _PreHomeScreenState extends State<PreHomeScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _lastNameController = TextEditingController();
//   String? _selectedCenter;
//   String? _selectedRole;
//   File? _profileImage;
//   final ImagePicker _picker = ImagePicker();
//   bool _isLoading = false;

//   Future<void> _requestStoragePermission() async {
//     final status = await Permission.storage.request();
//     if (!status.isGranted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Storage permission is required to select an image.')),
//       );
//     }
//   }

//   Future<String?> _uploadProfilePicture(File image) async {
//     try {
//       final storage = Supabase.instance.client.storage.from('profile_pictures');
//       final path = '${widget.uid}/profile_${DateTime.now().millisecondsSinceEpoch}.jpg';
//       await storage.upload(path, image);
//       return storage.getPublicUrl(path);
//     } catch (e) {
//       print('Error uploading image: $e');
//       return null;
//     }
//   }

//   Future<void> _saveData() async {
//     if (!_formKey.currentState!.validate() ||
//         _selectedCenter == null ||
//         _selectedRole == null ||
//         _profileImage == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please fill all fields and upload a profile picture.')),
//       );
//       return;
//     }

//     setState(() {
//       _isLoading = true;
//     });

//     final imageUrl = await _uploadProfilePicture(_profileImage!);

//     if (imageUrl == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Failed to upload profile picture.')),
//       );
//       setState(() {
//         _isLoading = false;
//       });
//       return;
//     }

//     final response = await Supabase.instance.client.from('users').upsert({
//       'id': widget.uid,
//       'first_name': _firstNameController.text,
//       'last_name': _lastNameController.text,
//       'center': _selectedCenter,
//       'role': _selectedRole,
//       'profile_picture': imageUrl,
//     });

//     if (response.error != null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to save data: ${response.error!.message}')),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Data saved successfully.')),
//       );
//       Navigator.pushReplacementNamed(context, '/home');
//     }

//     setState(() {
//       _isLoading = false;
//     });
//   }

//   Future<void> _pickImage() async {
//     await _requestStoragePermission();
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _profileImage = File(pickedFile.path);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Complete Your Profile', style: TextStyle(fontWeight: FontWeight.bold)),
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xFF6A1B9A), Color(0xFFAB47BC)],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//         elevation: 10,
//       ),
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             padding: const EdgeInsets.all(16.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   GestureDetector(
//                     onTap: _pickImage,
//                     child: _profileImage == null
//                         ? Container(
//                             height: 150,
//                             width: 150,
//                             decoration: BoxDecoration(
//                               color: Colors.grey[300],
//                               shape: BoxShape.circle,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey.withOpacity(0.5),
//                                   blurRadius: 10,
//                                   offset: const Offset(0, 5),
//                                 ),
//                               ],
//                             ),
//                             child: const Icon(Icons.camera_alt, size: 50, color: Colors.grey),
//                           )
//                         : CircleAvatar(
//                             radius: 75,
//                             backgroundImage: FileImage(_profileImage!),
//                           ),
//                   ),
//                   const SizedBox(height: 20),
//                   TextFormField(
//                     controller: _firstNameController,
//                     decoration: const InputDecoration(
//                       labelText: 'First Name',
//                       prefixIcon: Icon(Icons.person),
//                       border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
//                     ),
//                     validator: (value) => value == null || value.isEmpty ? 'Enter your first name' : null,
//                   ),
//                   const SizedBox(height: 10),
//                   TextFormField(
//                     controller: _lastNameController,
//                     decoration: const InputDecoration(
//                       labelText: 'Last Name',
//                       prefixIcon: Icon(Icons.person_outline),
//                       border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
//                     ),
//                     validator: (value) => value == null || value.isEmpty ? 'Enter your last name' : null,
//                   ),
//                   const SizedBox(height: 10),
//                   DropdownButtonFormField<String>(
//                     decoration: const InputDecoration(
//                       labelText: 'Center',
//                       prefixIcon: Icon(Icons.location_on),
//                       border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
//                     ),
//                     items: ['Chandragadi', 'Birtamode']
//                         .map((center) => DropdownMenuItem(value: center, child: Text(center)))
//                         .toList(),
//                     onChanged: (value) => setState(() => _selectedCenter = value),
//                     validator: (value) => value == null ? 'Select a center' : null,
//                   ),
//                   const SizedBox(height: 10),
//                   DropdownButtonFormField<String>(
//                     decoration: const InputDecoration(
//                       labelText: 'Role',
//                       prefixIcon: Icon(Icons.assignment_ind),
//                       border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
//                     ),
//                     items: ['Teacher', 'Student']
//                         .map((role) => DropdownMenuItem(value: role, child: Text(role)))
//                         .toList(),
//                     onChanged: (value) => setState(() => _selectedRole = value),
//                     validator: (value) => value == null ? 'Select a role' : null,
//                   ),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: _saveData,
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                       elevation: 5,
//                       backgroundColor: Colors.purple,
//                       foregroundColor: Colors.white,
//                     ),
//                     child: const Text(
//                       'Save and Continue',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           if (_isLoading)
//             Container(
//               color: Colors.black.withOpacity(0.5),
//               child: const Center(
//                 child: CircularProgressIndicator(color: Colors.white),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:permission_handler/permission_handler.dart';

// class PreHomeScreen extends StatefulWidget {
//   final String uid;

//   const PreHomeScreen({Key? key, required this.uid}) : super(key: key);

//   @override
//   State<PreHomeScreen> createState() => _PreHomeScreenState();
// }

// class _PreHomeScreenState extends State<PreHomeScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _lastNameController = TextEditingController();
//   final TextEditingController _phoneNumberController = TextEditingController();
//   String? _selectedCenter;
//   String? _selectedRole;
//   File? _profileImage;
//   final ImagePicker _picker = ImagePicker();
//   bool _isLoading = false;

//   Future<void> _requestStoragePermission() async {
//     final status = await Permission.storage.request();
//     if (!status.isGranted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Storage permission is required to select an image.')),
//       );
//     }
//   }

//   Future<String?> _uploadProfilePicture(File image) async {
//     try {
//       final storage = Supabase.instance.client.storage.from('profile_pictures');
//       final path = '${widget.uid}/profile_${DateTime.now().millisecondsSinceEpoch}.jpg';
//       await storage.upload(path, image);
//       return storage.getPublicUrl(path);
//     } catch (e) {
//       print('Error uploading image: $e');
//       return null;
//     }
//   }

//   Future<void> _saveData() async {
//     if (!_formKey.currentState!.validate() ||
//         _selectedCenter == null ||
//         _selectedRole == null ||
//         _profileImage == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please fill all fields and upload a profile picture.')),
//       );
//       return;
//     }

//     setState(() {
//       _isLoading = true;
//     });

//     final imageUrl = await _uploadProfilePicture(_profileImage!);

//     if (imageUrl == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Failed to upload profile picture.')),
//       );
//       setState(() {
//         _isLoading = false;
//       });
//       return;
//     }

//     final response = await Supabase.instance.client.from('users').upsert({
//       'id': widget.uid,
//       'first_name': _firstNameController.text,
//       'last_name': _lastNameController.text,
//       'phone_number': _phoneNumberController.text,
//       'center': _selectedCenter,
//       'role': _selectedRole,
//       'profile_picture': imageUrl,
//     });

//     if (response.error != null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to save data: ${response.error!.message}')),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Data saved successfully.')),
//       );
//       Navigator.pushReplacementNamed(context, '/home');
//     }

//     setState(() {
//       _isLoading = false;
//     });
//   }

//   Future<void> _pickImage() async {
//     await _requestStoragePermission();
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _profileImage = File(pickedFile.path);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Complete Your Profile', style: TextStyle(fontWeight: FontWeight.bold)),
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xFF6A1B9A), Color(0xFFAB47BC)],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//         elevation: 10,
//       ),
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             padding: const EdgeInsets.all(16.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   GestureDetector(
//                     onTap: _pickImage,
//                     child: _profileImage == null
//                         ? Container(
//                             height: 150,
//                             width: 150,
//                             decoration: BoxDecoration(
//                               color: Colors.grey[300],
//                               shape: BoxShape.circle,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey.withOpacity(0.5),
//                                   blurRadius: 10,
//                                   offset: const Offset(0, 5),
//                                 ),
//                               ],
//                             ),
//                             child: const Icon(Icons.camera_alt, size: 50, color: Colors.grey),
//                           )
//                         : CircleAvatar(
//                             radius: 75,
//                             backgroundImage: FileImage(_profileImage!),
//                           ),
//                   ),
//                   const SizedBox(height: 20),
//                   TextFormField(
//                     controller: _firstNameController,
//                     decoration: const InputDecoration(
//                       labelText: 'First Name',
//                       prefixIcon: Icon(Icons.person),
//                       border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
//                     ),
//                     validator: (value) => value == null || value.isEmpty ? 'Enter your first name' : null,
//                   ),
//                   const SizedBox(height: 10),
//                   TextFormField(
//                     controller: _lastNameController,
//                     decoration: const InputDecoration(
//                       labelText: 'Last Name',
//                       prefixIcon: Icon(Icons.person_outline),
//                       border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
//                     ),
//                     validator: (value) => value == null || value.isEmpty ? 'Enter your last name' : null,
//                   ),
//                   const SizedBox(height: 10),
//                   TextFormField(
//                     controller: _phoneNumberController,
//                     decoration: const InputDecoration(
//                       labelText: 'Phone Number',
//                       prefixIcon: Icon(Icons.phone),
//                       border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
//                     ),
//                     keyboardType: TextInputType.phone,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Enter your phone number';
//                       }
//                       final phoneRegExp = RegExp(r'^\+?[0-9]{7,15}$');
//                       if (!phoneRegExp.hasMatch(value)) {
//                         return 'Enter a valid phone number';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 10),
//                   DropdownButtonFormField<String>(
//                     decoration: const InputDecoration(
//                       labelText: 'Center',
//                       prefixIcon: Icon(Icons.location_on),
//                       border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
//                     ),
//                     items: ['Chandragadi', 'Birtamode']
//                         .map((center) => DropdownMenuItem(value: center, child: Text(center)))
//                         .toList(),
//                     onChanged: (value) => setState(() => _selectedCenter = value),
//                     validator: (value) => value == null ? 'Select a center' : null,
//                   ),
//                   const SizedBox(height: 10),
//                   DropdownButtonFormField<String>(
//                     decoration: const InputDecoration(
//                       labelText: 'Role',
//                       prefixIcon: Icon(Icons.assignment_ind),
//                       border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
//                     ),
//                     items: ['Teacher', 'Student']
//                         .map((role) => DropdownMenuItem(value: role, child: Text(role)))
//                         .toList(),
//                     onChanged: (value) => setState(() => _selectedRole = value),
//                     validator: (value) => value == null ? 'Select a role' : null,
//                   ),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: _saveData,
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                       elevation: 5,
//                       backgroundColor: Colors.purple,
//                       foregroundColor: Colors.white,
//                     ),
//                     child: const Text(
//                       'Save and Continue',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           if (_isLoading)
//             Container(
//               color: Colors.black.withOpacity(0.5),
//               child: const Center(
//                 child: CircularProgressIndicator(color: Colors.white),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class PreHomeScreen extends StatefulWidget {
  final String uid;

  const PreHomeScreen({Key? key, required this.uid}) : super(key: key);

  @override
  State<PreHomeScreen> createState() => _PreHomeScreenState();
}

class _PreHomeScreenState extends State<PreHomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  String? _selectedCenter;
  String? _selectedRole;
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;

  Future<void> _requestStoragePermission() async {
    final status = await Permission.storage.request();
    if (!status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Storage permission is required to select an image.')),
      );
    }
  }

  Future<String?> _uploadProfilePicture(File image) async {
    try {
      final startTime = DateTime.now();  // Start time
      final storage = Supabase.instance.client.storage.from('profile_pictures');
      final path = '${widget.uid}/profile_${DateTime.now().millisecondsSinceEpoch}.jpg';
      await storage.upload(path, image);
      final endTime = DateTime.now();  // End time
      print('Upload duration: ${endTime.difference(startTime).inSeconds} seconds');
      return storage.getPublicUrl(path);
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  Future<void> _saveData() async {
    if (!_formKey.currentState!.validate() ||
        _selectedCenter == null ||
        _selectedRole == null ||
        _profileImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields and upload a profile picture.')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final imageUrl = await _uploadProfilePicture(_profileImage!);

    if (imageUrl == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to upload profile picture.')),
      );
      setState(() {
        _isLoading = false;
      });
      return;
    }

    final response = await Supabase.instance.client.from('users').upsert({
      'id': widget.uid,
      'first_name': _firstNameController.text,
      'last_name': _lastNameController.text,
      'phone_number': _phoneNumberController.text,
      'center': _selectedCenter,
      'role': _selectedRole,
      'profile_picture': imageUrl,
    });

    if (response.error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save data: ${response.error!.message}')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data saved successfully.')),
      );
      Navigator.pushReplacementNamed(context, '/home');
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _pickImage() async {
    await _requestStoragePermission();
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complete Your Profile', style: TextStyle(fontWeight: FontWeight.bold)),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6A1B9A), Color(0xFFAB47BC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 10,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: _profileImage == null
                        ? Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: const Icon(Icons.camera_alt, size: 50, color: Colors.grey),
                          )
                        : CircleAvatar(
                            radius: 75,
                            backgroundImage: FileImage(_profileImage!),
                          ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _firstNameController,
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                    validator: (value) => value == null || value.isEmpty ? 'Enter your first name' : null,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _lastNameController,
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                      prefixIcon: Icon(Icons.person_outline),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                    validator: (value) => value == null || value.isEmpty ? 'Enter your last name' : null,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _phoneNumberController,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your phone number';
                      }
                      final phoneRegExp = RegExp(r'^\+?[0-9]{7,15}$');
                      if (!phoneRegExp.hasMatch(value)) {
                        return 'Enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Center',
                      prefixIcon: Icon(Icons.location_on),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                    items: ['Chandragadi', 'Birtamode']
                        .map((center) => DropdownMenuItem(value: center, child: Text(center)))
                        .toList(),
                    onChanged: (value) => setState(() => _selectedCenter = value),
                    validator: (value) => value == null ? 'Select a center' : null,
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Role',
                      prefixIcon: Icon(Icons.assignment_ind),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                    items: ['Teacher', 'Student']
                        .map((role) => DropdownMenuItem(value: role, child: Text(role)))
                        .toList(),
                    onChanged: (value) => setState(() => _selectedRole = value),
                    validator: (value) => value == null ? 'Select a role' : null,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _saveData,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      elevation: 5,
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Save and Continue',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}
