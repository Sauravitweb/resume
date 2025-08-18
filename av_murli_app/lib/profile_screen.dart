// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class ProfileScreen extends StatefulWidget {
//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   final supabase = Supabase.instance.client;

//   String name = '';
//   String email = '';
//   String role = '';

//   @override
//   void initState() {
//     super.initState();
//     _loadProfile();
//   }


//   // Future<void> _loadProfile() async {
//   //   final user = supabase.auth.currentUser;

//   //   if (user != null) {
//   //     final response = await supabase
//   //         .from('users')
//   //         .select()
//   //         .eq('id', user.id)
//   //         .single()
//   //         .execute();

//   //     if (response.error == null) {
//   //       setState(() {
//   //         name = response.data['name'] ?? '';
//   //         email = response.data['email'] ?? '';
//   //         role = response.data['role'] ?? '';
//   //       });
//   //     }
//   //   }
//   // }

// // Future<void> _loadProfile() async {
// //   final user = supabase.auth.currentUser;

// //   if (user != null) {
// //     final response = await supabase
// //         .from('users')
// //         .select()
// //         .eq('id', user.id)
// //         .single()
// //         .execute(); // You can remove the execute() here.

// //     // Instead of checking 'response.error', directly check the status of the query
// //     if (response.error == null) {
// //       setState(() {
// //         name = response.data['name'] ?? '';
// //         email = response.data['email'] ?? '';
// //         role = response.data['role'] ?? '';
// //       });
// //     } else {
// //       // Handle error case
// //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //         content: Text('Error loading profile: ${response.error!.message}'),
// //       ));
// //     }
// //   }
// // }
// Future<void> _loadProfile() async {
//   final user = supabase.auth.currentUser;

//   if (user != null) {
//     final response = await _execute(
//       supabase.from('users').select().eq('id', user.id).single() as PostgrestFilterBuilder,
//     );

//     if (response != null) {
//       setState(() {
//         name = response['name'] ?? '';
//         email = response['email'] ?? '';
//         role = response['role'] ?? '';
//       });
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Error loading profile'),
//       ));
//     }
//   }
// }

// Future<Map<String, dynamic>?> _execute(PostgrestFilterBuilder query) async {
//   try {
//     final response = await query;
//     if (response.error == null) {
//       return response.data;
//     } else {
//       return null; // Return null on error
//     }
//   } catch (e) {
//     // Handle errors such as network or query issues
//     print('Error executing query: $e');
//     return null;
//   }
// }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Profile')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Text('Name: $name', style: TextStyle(fontSize: 18)),
//             Text('Email: $email', style: TextStyle(fontSize: 18)),
//             Text('Role: $role', style: TextStyle(fontSize: 18)),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   final SupabaseClient _supabase = Supabase.instance.client;
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _bioController = TextEditingController();
//   final TextEditingController _websiteController = TextEditingController();
//   String? _profileImageUrl;
//   File? _profileImage;

//   // Details section
//   final TextEditingController _currentTownController = TextEditingController();
//   final TextEditingController _homeTownController = TextEditingController();
//   final TextEditingController _relationshipController = TextEditingController();
//   final TextEditingController _educationController = TextEditingController();
//   final TextEditingController _workplaceController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserProfile();
//   }

//   Future<void> _fetchUserProfile() async {
//     final user = _supabase.auth.currentUser;
//     if (user != null) {
//       final response = await _supabase
//           .from('users')
//           .select()
//           .eq('id', user.id)
//           .single();

//       if (response == null && response != null) {
//         final data = response as Map<String, dynamic>;
//         _nameController.text = data['name'] ?? '';
//         _emailController.text = data['email'] ?? '';
//         _phoneController.text = data['phone'] ?? '';
//         _bioController.text = data['bio'] ?? '';
//         _websiteController.text = data['website'] ?? '';
//         _profileImageUrl = data['profileImageUrl'] ?? '';
//         _currentTownController.text = data['currentTown'] ?? '';
//         _homeTownController.text = data['homeTown'] ?? '';
//         _relationshipController.text = data['relationshipStatus'] ?? '';
//         _educationController.text = data['education'] ?? '';
//         _workplaceController.text = data['workplace'] ?? '';
//         setState(() {});
//       }
//     }
//   }

//   Future<void> _pickImage() async {
//     final ImagePicker _picker = ImagePicker();
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       setState(() {
//         _profileImage = File(image.path);
//       });
//     }
//   }

//   Future<String?> _uploadImage(File imageFile) async {
//     try {
//       final fileName = DateTime.now().millisecondsSinceEpoch.toString();
//       final storageResponse = await _supabase.storage
//           .from('profile-images')
//           .upload(fileName, imageFile);
//       if (storageResponse == null) {
//         final fileUrl = await _supabase.storage
//             .from('profile-images')
//             .getPublicUrl(fileName);
//         return fileUrl;
//       } else {
//         print("Error uploading image: ${storageResponse}");
//         return null;
//       }
//     } catch (e) {
//       print("Error uploading image: $e");
//       return null;
//     }
//   }

// //  Future<void> _updateProfile() async {
// //   final user = _supabase.auth.currentUser;
// //   if (user != null) {
// //     try {
// //       String? imageUrl = _profileImage != null
// //           ? await _uploadImage(_profileImage!)
// //           : _profileImageUrl;

// //       final response = await _supabase.from('users').upsert({
// //         'id': user.id,
// //         'name': _nameController.text,
// //         'email': _emailController.text,
// //         'phone': _phoneController.text,
// //         'bio': _bioController.text,
// //         'website': _websiteController.text,
// //         'profileImageUrl': imageUrl,
// //         'currentTown': _currentTownController.text,
// //         'homeTown': _homeTownController.text,
// //         'relationshipStatus': _relationshipController.text,
// //         'education': _educationController.text,
// //         'workplace': _workplaceController.text,
// //       });

// //       if (response.error == null) {
// //         ScaffoldMessenger.of(context)
// //             .showSnackBar(SnackBar(content: Text('Profile Updated')));
// //         _fetchUserProfile(); // Refresh user profile
// //       } else {
// //         // Log response for debugging
// //         print("Error updating profile: ${response.error?.message}");
// //         ScaffoldMessenger.of(context)
// //             .showSnackBar(SnackBar(content: Text('Failed to update profile')));
// //       }
// //     } catch (e) {
// //       // Log the error for debugging
// //       print("Exception while updating profile: $e");
// //       ScaffoldMessenger.of(context)
// //           .showSnackBar(SnackBar(content: Text('Failed to update profile')));
// //     }
// //   }
// // }

// Future<void> _updateProfile() async {
//   final user = _supabase.auth.currentUser;
//   if (user != null) {
//     try {
//       String? imageUrl = _profileImage != null
//           ? await _uploadImage(_profileImage!)
//           : _profileImageUrl;

//       final response = await _supabase.from('users').upsert({
//         'id': user.id,
//         'name': _nameController.text.trim(),
//         'email': _emailController.text.trim(),
//         'phone': _phoneController.text.trim(),
//         'bio': _bioController.text.trim(),
//         'website': _websiteController.text.trim(),
//         'profileImageUrl': imageUrl,
//         'currentTown': _currentTownController.text.trim(),
//         'homeTown': _homeTownController.text.trim(),
//         'relationshipStatus': _relationshipController.text.trim(),
//         'education': _educationController.text.trim(),
//         'workplace': _workplaceController.text.trim(),
//       });

//       if (response.error == null) {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text('Profile Updated')));
//         _fetchUserProfile(); // Refresh user profile
//       } else {
//         // Log response for debugging
//         print("Error updating profile: ${response.error?.message}");
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text('Failed to update profile')));
//       }
//     } catch (e) {
//       // Log the error for debugging
//       print("Exception while updating profile: $e");
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('Failed to update profile')));
//     }
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile'),
//         centerTitle: true,
//         elevation: 4,
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             GestureDetector(
//               onTap: _pickImage,
//               child: CircleAvatar(
//                 radius: 80,
//                 backgroundImage: _profileImage != null
//                     ? FileImage(_profileImage!)
//                     : _profileImageUrl != null && _profileImageUrl!.isNotEmpty
//                         ? NetworkImage(_profileImageUrl!)
//                         : null,
//                 child: _profileImage == null && _profileImageUrl == null
//                     ? const Icon(Icons.camera_alt, size: 80)
//                     : null,
//               ),
//             ),
//             const SizedBox(height: 20),
//             _buildInputCard(controller: _nameController, label: 'Name'),
//             _buildInputCard(controller: _bioController, label: 'Bio'),
//             _buildDetailsSection(),
//             _buildLinksSection(),
//             ElevatedButton(
//               onPressed: _updateProfile,
//               style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                 padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
//                 backgroundColor: Colors.blueAccent,
//               ),
//               child: const Text('Update Profile'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildInputCard({required TextEditingController controller, required String label}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: TextField(
//         controller: controller,
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//         ),
//       ),
//     );
//   }

//   Widget _buildDetailsSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text('Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//         _buildInputCard(controller: _currentTownController, label: 'Current Town/City'),
//         _buildInputCard(controller: _homeTownController, label: 'Home Town'),
//         _buildInputCard(controller: _relationshipController, label: 'Relationship Status'),
//         _buildInputCard(controller: _educationController, label: 'Education'),
//         _buildInputCard(controller: _workplaceController, label: 'Workplace'),
//       ],
//     );
//   }

//   Widget _buildLinksSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text('Links', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//         _buildInputCard(controller: _websiteController, label: 'Website or Social Links'),
//       ],
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   final SupabaseClient _supabase = Supabase.instance.client;

//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _lastNameController = TextEditingController();
//   String? _profileImageUrl;
//   File? _profileImage;

//   // Read-only fields
//   String? _center;
//   String? _name;
//   String? _role;

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserProfile();
//   }

//   Future<void> _fetchUserProfile() async {
//     final user = _supabase.auth.currentUser;
//     if (user != null) {
//       try {
//         final response = await _supabase
//             .from('users')
//             .select('first_name, last_name, profile_picture, center, role')
//             .eq('id', user.id)
//             .maybeSingle();

//         if (response != null) {
//           final data = response as Map<String, dynamic>;
//           _firstNameController.text = data['first_name'] ?? '';
//           _lastNameController.text = data['last_name'] ?? '';
//           _profileImageUrl = data['profile_picture'];
//           _center = data['center'];
//           // _name = data['name'];
//           _role = data['role'];
//           setState(() {});
//         }
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error fetching profile: $e')),
//         );
//       }
//     }
//   }

//   Future<void> _pickImage() async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       setState(() {
//         _profileImage = File(image.path);
//       });
//     }
//   }

//   Future<String?> _uploadImage(File imageFile) async {
//     try {
//       final fileName = DateTime.now().millisecondsSinceEpoch.toString();
//       final response = await _supabase.storage
//           .from('profile-images')
//           .upload(fileName, imageFile);

//       return _supabase.storage.from('profile-images').getPublicUrl(fileName);
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error uploading image: $e')),
//       );
//       return null;
//     }
//   }

//   Future<void> _updateProfile() async {
//     final user = _supabase.auth.currentUser;
//     if (user != null) {
//       try {
//         String? imageUrl = _profileImage != null
//             ? await _uploadImage(_profileImage!)
//             : _profileImageUrl;

//         final updates = {
//           'id': user.id,
//           'first_name': _firstNameController.text.trim(),
//           'last_name': _lastNameController.text.trim(),
//           'profile_picture': imageUrl,
//         };
//                 await _supabase.from('users').upsert(updates);

//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Profile Updated')),
//         );
//         _fetchUserProfile();
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Failed to update profile: $e')),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             GestureDetector(
//               onTap: _pickImage,
//               child: CircleAvatar(
//                 radius: 80,
//                 backgroundImage: _profileImage != null
//                     ? FileImage(_profileImage!)
//                     : _profileImageUrl != null
//                         ? NetworkImage(_profileImageUrl!)
//                         : null,
//                 child: _profileImage == null && _profileImageUrl == null
//                     ? const Icon(Icons.camera_alt, size: 80)
//                     : null,
//               ),
//             ),
//             const SizedBox(height: 20),
//             _buildInputField(
//               controller: _firstNameController,
//               label: 'First Name',
//               isEditable: true,
//             ),
//             _buildInputField(
//               controller: _lastNameController,
//               label: 'Last Name',
//               isEditable: true,
//             ),
//             _buildReadOnlyField(label: 'Center', value: _center),
//             // _buildReadOnlyField(label: 'Name', value: _firstNameController.text  + _lastNameController.text),
//             _buildReadOnlyField(label: 'Role', value: _role),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _updateProfile,
//               child: const Text('Update Profile'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildInputField({
//     required TextEditingController controller,
//     required String label,
//     bool isEditable = false,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: TextField(
//         controller: controller,
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//         ),
//         readOnly: !isEditable,
//       ),
//     );
//   }

//   Widget _buildReadOnlyField({required String label, String? value}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: TextField(
//         controller: TextEditingController(text: value ?? ''),
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//         ),
//         readOnly: true,
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({Key? key}) : super(key: key);

//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   final SupabaseClient _supabase = Supabase.instance.client;

//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _lastNameController = TextEditingController();
//   String? _profileImageUrl;
//   File? _profileImage;

//   String? _center;
//   String? _role;

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserProfile();
//   }

//   Future<void> _fetchUserProfile() async {
//     final user = _supabase.auth.currentUser;
//     if (user != null) {
//       try {
//         final response = await _supabase
//             .from('users')
//             .select('first_name, last_name, profile_picture, center, role')
//             .eq('id', user.id)
//             .maybeSingle();

//         if (response != null) {
//           final data = response as Map<String, dynamic>;
//           _firstNameController.text = data['first_name'] ?? '';
//           _lastNameController.text = data['last_name'] ?? '';
//           _profileImageUrl = data['profile_picture'];
//           _center = data['center'];
//           _role = data['role'];
//           setState(() {});
//         }
//       } catch (e) {
//         _showSnackBar('Error fetching profile: $e');
//       }
//     }
//   }

//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final image = await picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       setState(() {
//         _profileImage = File(image.path);
//       });
//     }
//   }
  

//   Future<String?> _uploadImage(File imageFile) async {
//     try {
//       final fileName = DateTime.now().millisecondsSinceEpoch.toString();
//       await _supabase.storage.from('profile_pictures').upload(fileName, imageFile);
//       return _supabase.storage.from('profile_pictures').getPublicUrl(fileName);
//     } catch (e) {
//       _showSnackBar('Error uploading image: $e');
//       return null;
//     }
//   }

//   Future<void> _updateProfile() async {
//     final user = _supabase.auth.currentUser;
//     if (user != null) {
//       try {
//         String? imageUrl = _profileImage != null
//             ? await _uploadImage(_profileImage!)
//             : _profileImageUrl;

//         final updates = {
//           'id': user.id,
//           'first_name': _firstNameController.text.trim(),
//           'last_name': _lastNameController.text.trim(),
//           'profile_picture': imageUrl,
//         };

//         await _supabase.from('users').upsert(updates);

//         _showSnackBar('Profile updated successfully!');
//         _fetchUserProfile();
//       } catch (e) {
//         _showSnackBar('Failed to update profile: $e');
//       }
//     }
//   }

//   void _showSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Your Profile'),
//         centerTitle: true,
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             GestureDetector(
//               onTap: _pickImage,
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   CircleAvatar(
//                     radius: 80,
//                     backgroundImage: _profileImage != null
//                         ? FileImage(_profileImage!)
//                         : _profileImageUrl != null
//                             ? NetworkImage(_profileImageUrl!)
//                             : null,
//                     child: _profileImage == null && _profileImageUrl == null
//                         ? const Icon(Icons.person, size: 80, color: Colors.white54)
//                         : null,
//                   ),
//                   Positioned(
//                     bottom: 10,
//                     right: 10,
//                     child: CircleAvatar(
//                       backgroundColor: Colors.deepPurple,
//                       child: const Icon(Icons.camera_alt, color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             _buildInputField(
//               controller: _firstNameController,
//               label: 'First Name',
//               isEditable: true,
//             ),
//             _buildInputField(
//               controller: _lastNameController,
//               label: 'Last Name',
//               isEditable: true,
//             ),
//             _buildReadOnlyField(label: 'Center', value: _center),
//             _buildReadOnlyField(label: 'Role', value: _role),
//             const SizedBox(height: 30),
//             ElevatedButton(
//               onPressed: _updateProfile,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.deepPurple,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               child: const Text(
//   'Save Changes',
//   style: TextStyle(
//     fontSize: 16,
//     fontWeight: FontWeight.bold,
//     color: Colors.white, // Change text color to black
//   ),
// ),

//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildInputField({
//     required TextEditingController controller,
//     required String label,
//     bool isEditable = false,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: TextField(
//         controller: controller,
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//         ),
//         readOnly: !isEditable,
//       ),
//     );
//   }

//   Widget _buildReadOnlyField({required String label, String? value}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: TextField(
//         controller: TextEditingController(text: value ?? ''),
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           filled: true,
//           fillColor: Colors.grey.shade200,
//         ),
//         readOnly: true,
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({Key? key}) : super(key: key);

//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   final SupabaseClient _supabase = Supabase.instance.client;

//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _lastNameController = TextEditingController();
//   final TextEditingController _phoneNumberController = TextEditingController(); // New controller for phone number
//   String? _profileImageUrl;
//   File? _profileImage;

//   String? _center;
//   String? _role;

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserProfile();
//   }

//   Future<void> _fetchUserProfile() async {
//     final user = _supabase.auth.currentUser;
//     if (user != null) {
//       try {
//         final response = await _supabase
//             .from('users')
//             .select('first_name, last_name, profile_picture, center, role, phone_number')
//             .eq('id', user.id)
//             .maybeSingle();

//         if (response != null) {
//           final data = response as Map<String, dynamic>;
//           _firstNameController.text = data['first_name'] ?? '';
//           _lastNameController.text = data['last_name'] ?? '';
//           _phoneNumberController.text = data['phone_number'] ?? ''; // Set phone number
//           _profileImageUrl = data['profile_picture'];
//           _center = data['center'];
//           _role = data['role'];
//           setState(() {});
//         }
//       } catch (e) {
//         _showSnackBar('Error fetching profile: $e');
//       }
//     }
//   }

//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final image = await picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       setState(() {
//         _profileImage = File(image.path);
//       });
//     }
//   }

//   Future<String?> _uploadImage(File imageFile) async {
//     try {
//       final fileName = DateTime.now().millisecondsSinceEpoch.toString();
//       await _supabase.storage.from('profile_pictures').upload(fileName, imageFile);
//       return _supabase.storage.from('profile_pictures').getPublicUrl(fileName);
//     } catch (e) {
//       _showSnackBar('Error uploading image: $e');
//       return null;
//     }
//   }

//   Future<void> _updateProfile() async {
//     final user = _supabase.auth.currentUser;
//     if (user != null) {
//       try {
//         String? imageUrl = _profileImage != null
//             ? await _uploadImage(_profileImage!)
//             : _profileImageUrl;

//         final updates = {
//           'id': user.id,
//           'first_name': _firstNameController.text.trim(),
//           'last_name': _lastNameController.text.trim(),
//           'profile_picture': imageUrl,
//           'center': 'Chandragadi, Birtamode', // Update center value
//           'phone_number': _phoneNumberController.text.trim(), // Update phone number
//         };

//         await _supabase.from('users').upsert(updates);

//         _showSnackBar('Profile updated successfully!');
//         _fetchUserProfile();
//       } catch (e) {
//         _showSnackBar('Failed to update profile: $e');
//       }
//     }
//   }

//   void _showSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Your Profile'),
//         centerTitle: true,
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             GestureDetector(
//               onTap: _pickImage,
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   CircleAvatar(
//                     radius: 80,
//                     backgroundImage: _profileImage != null
//                         ? FileImage(_profileImage!)
//                         : _profileImageUrl != null
//                             ? NetworkImage(_profileImageUrl!)
//                             : null,
//                     child: _profileImage == null && _profileImageUrl == null
//                         ? const Icon(Icons.person, size: 80, color: Colors.white54)
//                         : null,
//                   ),
//                   Positioned(
//                     bottom: 10,
//                     right: 10,
//                     child: CircleAvatar(
//                       backgroundColor: Colors.deepPurple,
//                       child: const Icon(Icons.camera_alt, color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             _buildInputField(
//               controller: _firstNameController,
//               label: 'First Name',
//               isEditable: true,
//             ),
//             _buildInputField(
//               controller: _lastNameController,
//               label: 'Last Name',
//               isEditable: true,
//             ),
//             _buildInputField(
//               controller: _phoneNumberController,
//               label: 'Phone Number', // New field for phone number
//               isEditable: true,
//             ),
//             _buildReadOnlyField(label: 'Center', value: _center),
//             _buildReadOnlyField(label: 'Role', value: _role),
//             const SizedBox(height: 30),
//             ElevatedButton(
//               onPressed: _updateProfile,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.deepPurple,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               child: const Text(
//                 'Save Changes',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildInputField({
//     required TextEditingController controller,
//     required String label,
//     bool isEditable = false,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: TextField(
//         controller: controller,
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//         ),
//         readOnly: !isEditable,
//       ),
//     );
//   }

//   Widget _buildReadOnlyField({required String label, String? value}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: TextField(
//         controller: TextEditingController(text: value ?? ''),
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           filled: true,
//           fillColor: Colors.grey.shade200,
//         ),
//         readOnly: true,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart' as img;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final SupabaseClient _supabase = Supabase.instance.client;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  String? _selectedCenter;
  String? _profileImageUrl;
  File? _profileImage;

  // final List<String> _centers = ['Chandragadi', 'Birtamode'];
  final List<String> _centers = [];
//   Future<void> fetchCenters() async {
   
//       final responses = await Supabase.instance.client
//           .from('table_center') // Replace with your table name
//           .select('name')       // Replace 'name' with the column containing center names
//           ;

//       // setState(() {
//       //     _centers.clear();
//       //     _centers.addAll(map((e) => e['name'] as String).toList());
//       //   });
// //       setState(() {
// //   _centers.clear();
// //   _centers.addAll(data.map((e) => e['name'] as String).toSet().toList());
// // });
// _centers.addAll(data.map((e) => e['name'] as String).toList());

//   }
Future<void> fetchCenters() async {
  try {
    final response = await _supabase
        .from('table_center') // Replace with your table name
        .select('name'); // Fetch the 'name' column

    if (response.isEmpty) {
      // Handle the case where no data is returned
      print('No centers found in the database.');
      return;
    }

    // Process and update the `_centers` list
    final Set<String> uniqueCenters = response.map((e) => e['name'] as String).toSet();
    setState(() {
      _centers.clear();
      _centers.addAll(uniqueCenters);
    });

    print('Fetched centers: $_centers'); // Debug log
  } catch (e) {
    print('Error fetching centers: $e');
  }
}

  @override
  void initState() {
    super.initState();
    fetchCenters();
    _fetchUserProfile();
  }

  Future<void> _fetchUserProfile() async {
    final user = _supabase.auth.currentUser;
    if (user != null) {
      try {
        final response = await _supabase
            .from('users')
            .select('first_name, last_name, profile_picture, center, phone_number')
            .eq('id', user.id)
            .maybeSingle();

        if (response != null) {
          final data = response as Map<String, dynamic>;
          _firstNameController.text = data['first_name'] ?? '';
          _lastNameController.text = data['last_name'] ?? '';
          _profileImageUrl = data['profile_picture'];
          _selectedCenter = data['center'];
          _phoneNumberController.text = data['phone_number'] ?? '';
          setState(() {});
        }
      } catch (e) {
        _showSnackBar('Error fetching profile: $e');
      }
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _profileImage = File(image.path);
      });
    }
  }

  // Future<String?> _uploadImage(File imageFile) async {
  //   try {
  //     final fileName = DateTime.now().millisecondsSinceEpoch.toString();
  //     await _supabase.storage.from('profile_pictures').upload(fileName, imageFile);
  //     return _supabase.storage.from('profile_pictures').getPublicUrl(fileName);
  //   } catch (e) {
  //     _showSnackBar('Error uploading image: $e');
  //     return null;
  //   }
  // }
// Future<String?> _uploadImage(File imageFile) async {
//   try {
//     // Get the current user's auth ID
//     final user = _supabase.auth.currentUser;
//     if (user == null) {
//       _showSnackBar('User is not authenticated');
//       return null;
//     }
//     final userId = user.id;

//     // Define the folder path using the user's auth ID
//     final folderPath = '$userId';

//     // List files in the folder to check if there are any existing images
//     final existingFiles = await _supabase.storage
//         .from('profile_pictures')
//         .list(path: folderPath);

//     // If files exist, delete all previous images
//     if (existingFiles.isNotEmpty) {
//       final fileNames = existingFiles.map((file) => file.name).toList();
//       await _supabase.storage.from('profile_pictures').remove(fileNames);
//     }

//     // Upload the new image to the folder
//     final uploadResponse = await _supabase.storage.from('profile_pictures').upload(
//       '$folderPath/${imageFile.uri.pathSegments.last}',
//       imageFile,
//     );

//     if (uploadResponse != null) {
//       _showSnackBar('Error uploading image: ${uploadResponse}');
//       return null;
//     }

//     // Get the public URL of the newly uploaded image
//     final imageUrl = _supabase.storage.from('profile_pictures')
//         .getPublicUrl('$folderPath/${imageFile.uri.pathSegments.last}');

//     return imageUrl;
//   } catch (e) {
//     _showSnackBar('Error uploading image: $e');
//     return null;
//   }
// }
// Future<String?> _uploadImage(File imageFile) async {
//   try {
//     // Get the current authenticated user
//     final user = _supabase.auth.currentUser;
//     if (user == null) {
//       throw Exception('User is not authenticated');
//     }
//     final userId = user.id;

//     // Define the folder path in the storage bucket
//     final folderPath = '$userId';

//     // List all files in the user's folder
//     final existingFiles = await _supabase.storage
//         .from('profile_pictures')
//         .list(path: folderPath);

//     // If there are existing files, delete them
//     if (existingFiles.isNotEmpty) {
//       final fileNames = existingFiles.map((file) => '$folderPath/${file.name}').toList();
//       final deleteResponse = await _supabase.storage.from('profile_pictures').remove(fileNames);

//       // if (deleteResponse != null) {
//       //   throw Exception('Error deleting existing files: ${deleteResponse}');
//       // }
//     }

//     // Upload the new image file
//     final fileName = '${DateTime.now().millisecondsSinceEpoch}_${imageFile.uri.pathSegments.last}';
//     final uploadResponse = await _supabase.storage.from('profile_pictures').upload(
//       '$folderPath/$fileName',
//       imageFile,
//     );

//     // if (uploadResponse != null) {
//     //   throw Exception('Error uploading image: ${uploadResponse}');
//     // }

//     // Get the public URL of the uploaded file
//     final imageUrl = _supabase.storage.from('profile_pictures').getPublicUrl('$folderPath/$fileName');

//     return imageUrl;
//   } catch (e) {
//     _showSnackBar('Error: $e');
//     return null;
//   }
// }

Future<String?> _uploadImage(File imageFile) async {
  
    // Get the current authenticated user
    final user = _supabase.auth.currentUser;
    if (user == null) {
      throw Exception('User is not authenticated');
    }
    final userId = user.id;

    // Define the folder path in the storage bucket
    final folderPath = '$userId';

    // List all files in the user's folder
    final existingFiles = await _supabase.storage
        .from('profile_pictures')
        .list(path: folderPath);

    // If there are existing files, delete them
    if (existingFiles.isNotEmpty) {
      final fileNames = existingFiles.map((file) => '$folderPath/${file.name}').toList();
      final deleteResponse = await _supabase.storage.from('profile_pictures').remove(fileNames);

      
    }

    // Resize and compress the image
    final originalBytes = await imageFile.readAsBytes();
    final decodedImage = img.decodeImage(originalBytes);

    if (decodedImage == null) {
      throw Exception('Unable to decode image');
    }

    // Resize the image to a smaller size (e.g., 300x300) while maintaining aspect ratio
    final resizedImage = img.copyResize(decodedImage, width: 300);

    // Convert the resized image back to a compressed format (JPEG, quality 80%)
    final compressedImageBytes = img.encodeJpg(resizedImage, quality: 80);

    // Create a temporary file for the compressed image
    final compressedFile = File('${imageFile.parent.path}/compressed_${imageFile.uri.pathSegments.last}');
    await compressedFile.writeAsBytes(Uint8List.fromList(compressedImageBytes));

    // Upload the compressed image
    final fileName = '${DateTime.now().millisecondsSinceEpoch}_${imageFile.uri.pathSegments.last}';
    final uploadResponse = await _supabase.storage.from('profile_pictures').upload(
      '$folderPath/$fileName',
      compressedFile,
    );

    // Delete the temporary compressed file
    await compressedFile.delete();

    

    // Get the public URL of the uploaded file
    final imageUrl = _supabase.storage.from('profile_pictures').getPublicUrl('$folderPath/$fileName');

    return imageUrl;
   
}

  Future<void> _updateProfile() async {
    final user = _supabase.auth.currentUser;
    if (user != null) {
      
        String? imageUrl = _profileImage != null
            ? await _uploadImage(_profileImage!)
            : _profileImageUrl;

        final updates = {
          'id': user.id,
          'first_name': _firstNameController.text.trim(),
          'last_name': _lastNameController.text.trim(),
          'profile_picture': imageUrl,
          'center': _selectedCenter,
          'phone_number': _phoneNumberController.text.trim(),
        };

        await _supabase.from('users').upsert(updates);

        _showSnackBar('Profile updated successfully!');
        _fetchUserProfile();
      }// } catch (e) {
      //   _showSnackBar('Failed to update profile: $e');
      // }
    
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Profile'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : _profileImageUrl != null
                            ? NetworkImage(_profileImageUrl!)
                            : null,
                    child: _profileImage == null && _profileImageUrl == null
                        ? const Icon(Icons.person, size: 80, color: Colors.white54)
                        : null,
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.deepPurple,
                      child: const Icon(Icons.camera_alt, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildInputField(
              controller: _firstNameController,
              label: 'First Name',
              isEditable: true,
            ),
            _buildInputField(
              controller: _lastNameController,
              label: 'Last Name',
              isEditable: true,
            ),
            _buildDropdownField(
              label: 'Center',
              value: _selectedCenter,
              items: _centers,
              onChanged: (value) {
                setState(() {
                  _selectedCenter = value;
                });
              },
            ),
            _buildInputField(
              controller: _phoneNumberController,
              label: 'Phone Number',
              isEditable: true,
              inputType: TextInputType.number,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _updateProfile,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Save Changes',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    bool isEditable = false,
    TextInputType inputType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        readOnly: !isEditable,
        keyboardType: inputType,
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DropdownButtonFormField<String>(
        value: value,
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
