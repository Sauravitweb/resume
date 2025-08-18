// import 'package:flutter/material.dart';
// import 'profile_screen.dart';
// import 'settings_screen.dart';
// import 'marks_screen.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Avyakta Murli Exam (Weekly)'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.account_circle),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => ProfileScreen()),
//               );
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.settings),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => SettingsScreen()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: ElevatedCard(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => MarksScreen()),
//             );
//           },
//           child: Text('Marks'),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'profile_screen.dart';
// import 'settings_screen.dart';
// import 'marks_screen.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Avyakta Murli Exam (Weekly)'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.account_circle),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => ProfileScreen()),
//               );
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.settings),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => SettingsScreen()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: Card(
//           elevation: 4.0,  // Set elevation to create an elevated effect
//           margin: EdgeInsets.all(10),
//           child: InkWell(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => MarksScreen()),
//               );
//             },
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 'Marks',
//                 style: TextStyle(fontSize: 20),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'profile_screen.dart';
// import 'settings_screen.dart';
// import 'marks_screen.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Avyakta Murli Exam (Weekly)',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.deepPurple,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.account_circle, size: 28),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => ProfileScreen()),
//               );
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.settings, size: 28),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => SettingsScreen()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             'Welcome to the Weekly Exam Tracker!',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.w600,
//               color: Colors.deepPurple,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           SizedBox(height: 20),
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => MarksScreen()),
//               );
//             },
//             child: Container(
//               margin: EdgeInsets.symmetric(horizontal: 20),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Colors.deepPurple, Colors.purpleAccent],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 borderRadius: BorderRadius.circular(15),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.2),
//                     offset: Offset(0, 5),
//                     blurRadius: 10,
//                   ),
//                 ],
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.bar_chart, color: Colors.white, size: 28),
//                     SizedBox(width: 10),
//                     Text(
//                       'View Marks',
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'profile_screen.dart';
// import 'settings_screen.dart';
// import 'marks_screen.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 58, 116, 183),
//         title: Center(
//           child: Text(
//             'Avyakta Murli Exam (Weekly)',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),
//         leading: IconButton(
//           icon: Icon(Icons.account_circle, size: 28),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ProfileScreen()),
//             );
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.settings, size: 28),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => SettingsScreen()),
//               );
//             },
//           ),
//         ],
//         centerTitle: true,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             'Welcome to the Weekly Exam Tracker!',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.w600,
//               color: Colors.blueAccent,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           SizedBox(height: 20),
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => MarksScreen()),
//               );
//             },
//             child: Container(
//               margin: EdgeInsets.symmetric(horizontal: 20),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [const Color.fromARGB(255, 21, 3, 126), Colors.blueAccent],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 borderRadius: BorderRadius.circular(15),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.2),
//                     offset: Offset(0, 5),
//                     blurRadius: 10,
//                   ),
//                 ],
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.bar_chart, color: Colors.white, size: 28),
//                     SizedBox(width: 10),
//                     Text(
//                       'View Marks',
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'profile_screen.dart';
// import 'settings_screen.dart';
// import 'marks_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   String? profilePictureUrl; // This will store the user's profile picture URL.

//   @override
//   void initState() {
//     super.initState();
//     fetchUserProfile(); // Fetch the user's profile picture from Supabase.
//   }

//   Future<void> fetchUserProfile() async {
//     try {
//       final user = Supabase.instance.client.auth.currentUser;

//       if (user != null) {
//         final response = await Supabase.instance.client
//             .from('users') // Replace with your table name.
//             .select('profile_picture')
//             .eq('id', user.id)
//             .single()
//             ;

//         final data = response;
//         if (data != null && data['profile_picture'] != null) {
//           setState(() {
//             profilePictureUrl = data['profile_picture'];
//           });
//         }
//       }
//     } catch (e) {
//       print('Error fetching profile picture: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 58, 116, 183),
//         title: Center(
//           child: Text(
//             'Avyakta Murli Exam (Weekly)',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),
//         leading: IconButton(
//           icon: profilePictureUrl != null
//               ? CircleAvatar(
//                   backgroundImage: NetworkImage(profilePictureUrl!),
//                   backgroundColor: Colors.grey,
//                 )
//               : Icon(Icons.account_circle, size: 28),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ProfileScreen()),
//             );
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.settings, size: 28),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => SettingsScreen()),
//               );
//             },
//           ),
//         ],
//         centerTitle: true,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             'Welcome to the Weekly Exam Tracker!',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.w600,
//               color: Colors.blueAccent,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           SizedBox(height: 20),
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => MarksScreen()),
//               );
//             },
//             child: Container(
//               margin: EdgeInsets.symmetric(horizontal: 20),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [const Color.fromARGB(255, 21, 3, 126), Colors.blueAccent],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 borderRadius: BorderRadius.circular(15),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.2),
//                     offset: Offset(0, 5),
//                     blurRadius: 10,
//                   ),
//                 ],
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.bar_chart, color: Colors.white, size: 28),
//                     SizedBox(width: 10),
//                     Text(
//                       'View Marks',
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'profile_screen.dart';
// import 'settings_screen.dart';
// import 'marks_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   String? profilePictureUrl;
//   String topNotice = "Top Notice: Important updates will appear here.";
//   String bottomNotice = "Bottom Notice: Stay tuned for more information.";
//   bool isEditing = false;

//   final TextEditingController topNoticeController = TextEditingController();
//   final TextEditingController bottomNoticeController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     fetchUserProfile();
//   }

//   Future<void> fetchUserProfile() async {
//     try {
//       final user = Supabase.instance.client.auth.currentUser;

//       if (user != null) {
//         final response = await Supabase.instance.client
//             .from('users')
//             .select('profile_picture')
//             .eq('id', user.id)
//             .single();

//         final data = response;
//         if (data != null && data['profile_picture'] != null) {
//           setState(() {
//             profilePictureUrl = data['profile_picture'];
//           });
//         }
//       }
//     } catch (e) {
//       print('Error fetching profile picture: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 58, 116, 183),
//         title: Center(
//           child: Text(
//             'Avyakta Murli Exam (Weekly)',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),
//         leading: IconButton(
//           icon: profilePictureUrl != null
//               ? CircleAvatar(
//                   backgroundImage: NetworkImage(profilePictureUrl!),
//                   backgroundColor: Colors.grey,
//                 )
//               : Icon(Icons.account_circle, size: 28),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ProfileScreen()),
//             );
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.settings, size: 28),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => SettingsScreen()),
//               );
//             },
//           ),
//         ],
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Text(
//                 topNotice,
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 20),
//               if (isEditing) ...[
//                 TextField(
//                   controller: topNoticeController,
//                   decoration: InputDecoration(
//                     labelText: "Edit Top Notice",
//                     border: OutlineInputBorder(),
//                   ),
//                   minLines: 1,
//                   maxLines: null, // Allows text field to expand
//                 ),
//                 SizedBox(height: 10),
//               ],
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => MarksScreen()),
//                   );
//                 },
//                 child: Container(
//                   margin: EdgeInsets.symmetric(horizontal: 20),
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [
//                         const Color.fromARGB(255, 21, 3, 126),
//                         Colors.blueAccent,
//                       ],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                     borderRadius: BorderRadius.circular(15),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.2),
//                         offset: Offset(0, 5),
//                         blurRadius: 10,
//                       ),
//                     ],
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.bar_chart, color: Colors.white, size: 28),
//                         SizedBox(width: 10),
//                         Text(
//                           'View Marks',
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 bottomNotice,
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 20),
//               if (isEditing) ...[
//                 TextField(
//                   controller: bottomNoticeController,
//                   decoration: InputDecoration(
//                     labelText: "Edit Bottom Notice",
//                     border: OutlineInputBorder(),
//                   ),
//                   minLines: 1,
//                   maxLines: null, // Allows text field to expand
//                 ),
//                 SizedBox(height: 10),
//               ],
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         isEditing = true;
//                         topNoticeController.text = topNotice;
//                         bottomNoticeController.text = bottomNotice;
//                       });
//                     },
//                     child: Text('Edit Notice'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         if (isEditing) {
//                           topNotice = topNoticeController.text;
//                           bottomNotice = bottomNoticeController.text;
//                           isEditing = false;
//                         }
//                       });
//                     },
//                     child: Text('Save Notice'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart'; 
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'profile_screen.dart';
// import 'settings_screen.dart';
// import 'marks_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   String? profilePictureUrl;
//   String topNotice = "Top Notice: Important updates will appear here.";
//   String bottomNotice = "Bottom Notice: Stay tuned for more information.";
//   bool isEditing = false;

//   final TextEditingController topNoticeController = TextEditingController();
//   final TextEditingController bottomNoticeController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     fetchNotices();
//     fetchUserProfile();
//   }

//   // Fetch top and bottom notices from the 'texts' table in Supabase
//   Future<void> fetchNotices() async {
//     try {
//       final response = await Supabase.instance.client
//           .from('texts') // Adjust the table name if different
//           .select('top_text, bottom_text') // Fetch both text columns
//           .single(); // Assume there is only one row for the notices

//       final data = response;

//       if (data != null) {
//         setState(() {
//           topNotice = data['top_text'] ?? "Top Notice: Important updates will appear here.";
//           bottomNotice = data['bottom_text'] ?? "Bottom Notice: Stay tuned for more information.";
//         });
//       }
//     } catch (e) {
//       print('Error fetching notices: $e');
//     }
//   }

//   // Fetch user profile from the 'users' table
//   Future<void> fetchUserProfile() async {
//     try {
//       final user = Supabase.instance.client.auth.currentUser;

//       if (user != null) {
//         final response = await Supabase.instance.client
//             .from('users')
//             .select('profile_picture')
//             .eq('id', user.id)
//             .single();

//         final data = response;
//         if (data != null && data['profile_picture'] != null) {
//           setState(() {
//             profilePictureUrl = data['profile_picture'];
//           });
//         }
//       }
//     } catch (e) {
//       print('Error fetching profile picture: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 58, 116, 183),
//         title: Center(
//           child: Text(
//             'Avyakta Murli Exam (Weekly)',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),
//         leading: IconButton(
//           icon: profilePictureUrl != null
//               ? CircleAvatar(
//                   backgroundImage: NetworkImage(profilePictureUrl!),
//                   backgroundColor: Colors.grey,
//                 )
//               : Icon(Icons.account_circle, size: 28),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ProfileScreen()),
//             );
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.settings, size: 28),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => SettingsScreen()),
//               );
//             },
//           ),
//         ],
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Text(
//                 topNotice,
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 20),
//               if (isEditing) ...[
//                 TextField(
//                   controller: topNoticeController,
//                   decoration: InputDecoration(
//                     labelText: "Edit Top Notice",
//                     border: OutlineInputBorder(),
//                   ),
//                   minLines: 1,
//                   maxLines: null, // Allows text field to expand
//                 ),
//                 SizedBox(height: 10),
//               ],
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => MarksScreen()),
//                   );
//                 },
//                 child: Container(
//                   margin: EdgeInsets.symmetric(horizontal: 20),
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [
//                         const Color.fromARGB(255, 21, 3, 126),
//                         Colors.blueAccent,
//                       ],
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                     ),
//                     borderRadius: BorderRadius.circular(15),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.2),
//                         offset: Offset(0, 5),
//                         blurRadius: 10,
//                       ),
//                     ],
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.bar_chart, color: Colors.white, size: 28),
//                         SizedBox(width: 10),
//                         Text(
//                           'View Marks',
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 bottomNotice,
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 20),
//               if (isEditing) ...[
//                 TextField(
//                   controller: bottomNoticeController,
//                   decoration: InputDecoration(
//                     labelText: "Edit Bottom Notice",
//                     border: OutlineInputBorder(),
//                   ),
//                   minLines: 1,
//                   maxLines: null, // Allows text field to expand
//                 ),
//                 SizedBox(height: 10),
//               ],
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         isEditing = true;
//                         topNoticeController.text = topNotice;
//                         bottomNoticeController.text = bottomNotice;
//                       });
//                     },
//                     child: Text('Edit Notice'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         if (isEditing) {
//                           topNotice = topNoticeController.text;
//                           bottomNotice = bottomNoticeController.text;
//                           isEditing = false;
//                         }
//                       });
//                     },
//                     child: Text('Save Notice'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';
import 'marks_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? profilePictureUrl;
  String topNotice = "ओम् शान्ति, कृपया नोटिस हेर्नको लागि एपलाई पूर्ण रूपमा बन्द गर्नुहोस्।";
  String bottomNotice = "ओम् शान्ति, कृपया नोटिस देखने के लिए ऐप को पूरी तरह से बंद करें।";
  bool isEditing = false;

  final TextEditingController topNoticeController = TextEditingController();
  final TextEditingController bottomNoticeController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   fetchNotices();
  //   fetchUserProfile();
  //   _loadNoticesFromLocal();

  //   Timer.periodic(Duration(seconds: 5), (timer) {
  //   fetchNotices(); // Fetch new notices at regular intervals
  // });
    
  // }
  Timer? _timer;
@override
void initState() {
  super.initState();
  fetchNotices();
  fetchUserProfile();
  _loadNoticesFromLocal();

  Timer.periodic(Duration(seconds: 5), (timer) {
  print("Fetching notices every 5 seconds...");
  fetchNotices(); // Fetch new notices at regular intervals
});
}

@override
void dispose() {
 print('dispose called');
  _timer?.cancel();
  super.dispose();
}



Future<void> fetchNotices() async {
  try {
    final response = await Supabase.instance.client
        .from('texts') // Adjust the table name if different
        .select('top_text, bottom_text')
        .order('created_at', ascending: false) // Order by created_at in descending order
        .limit(1) // Limit to the most recent row
        .single(); // Expect a single row

    final data = response; // Make sure to access 'data'

    
      setState(() {
        topNotice = data['top_text'] ?? "ओम् शान्ति, कृपया नोटिस हेर्नको लागि एपलाई पूर्ण रूपमा बन्द गर्नुहोस्।";
        bottomNotice = data['bottom_text'] ?? "ओम् शान्ति, कृपया नोटिस देखने के लिए ऐप को पूरी तरह से बंद करें।";
      });

      // Save fetched notices in SharedPreferences
      _saveNoticesLocally(topNotice, bottomNotice);
    
  } catch (e) {
    print('Error fetching notices: $e');
    // If an error occurs or no notices are fetched, load saved notices
    _loadNoticesFromLocal();
  }
}

Future<void> _saveNoticesLocally(String topText, String bottomText) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('topNotice', topText);
  await prefs.setString('bottomNotice', bottomText);
}

Future<void> _loadNoticesFromLocal() async {
  final prefs = await SharedPreferences.getInstance();
  final savedTopNotice = prefs.getString('topNotice');
  final savedBottomNotice = prefs.getString('bottomNotice');

  setState(() {
    topNotice = savedTopNotice ?? "ओम् शान्ति, कृपया नोटिस हेर्नको लागि एपलाई पूर्ण रूपमा बन्द गर्नुहोस्।";
    bottomNotice = savedBottomNotice ?? "ओम् शान्ति, कृपया नोटिस देखने के लिए ऐप को पूरी तरह से बंद करें।";
  });
}



Future<void> updateNotices() async {
  try {
    final response = await Supabase.instance.client
        .from('texts') // Adjust the table name if different
        .upsert({
          'top_text': topNotice,
          'bottom_text': bottomNotice,
          'user_id': user?.id,
        });

    if (response != null && response.error != null) {
      print('Error updating notices: ${response.error?.message}');
    } else {
      print('Notices updated successfully');
    }
  } catch (e) {
    print('Error updating notices: $e');
  }
}


  // Fetch user profile from the 'users' table
  Future<void> fetchUserProfile() async {
    try {
      final user = Supabase.instance.client.auth.currentUser;

      if (user != null) {
        final response = await Supabase.instance.client
            .from('users')
            .select('profile_picture')
            .eq('id', user.id)
            .single();

        final data = response;
        if (data != null && data['profile_picture'] != null) {
          setState(() {
            profilePictureUrl = data['profile_picture'];
          });
        }
      }
    } catch (e) {
      print('Error fetching profile picture: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 58, 116, 183),
        title: Center(
          child: Text(
            'Avyakta Murli Exam (Weekly)',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        leading: IconButton(
          icon: profilePictureUrl != null
              ? CircleAvatar(
                  backgroundImage: NetworkImage(profilePictureUrl!),
                  backgroundColor: Colors.grey,
                )
              : Icon(Icons.account_circle, size: 28),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, size: 28),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                topNotice,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              if (isEditing) ...[
                TextField(
                  controller: topNoticeController,
                  decoration: InputDecoration(
                    labelText: "Edit Top Notice",
                    border: OutlineInputBorder(),
                  ),
                  minLines: 1,
                  maxLines: null, // Allows text field to expand
                ),
                SizedBox(height: 10),
              ],
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MarksScreen()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color.fromARGB(255, 21, 3, 126),
                        Colors.blueAccent,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(0, 5),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.bar_chart, color: Colors.white, size: 28),
                        SizedBox(width: 10),
                        Text(
                          'View Marks',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                bottomNotice,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              if (isEditing) ...[
                TextField(
                  controller: bottomNoticeController,
                  decoration: InputDecoration(
                    labelText: "Edit Bottom Notice",
                    border: OutlineInputBorder(),
                  ),
                  minLines: 1,
                  maxLines: null, // Allows text field to expand
                ),
                SizedBox(height: 10),
              ],
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // children: [
                //   ElevatedButton(
                //     onPressed: () {
                //       setState(() {
                //         isEditing = true;
                //         topNoticeController.text = topNotice;
                //         bottomNoticeController.text = bottomNotice;
                //       });
                //     },
                //     child: Text('Edit Notice'),
                //   ),
                //   ElevatedButton(
                //     onPressed: () async {
                //       setState(() {
                //         if (isEditing) {
                //           topNotice = topNoticeController.text;
                //           bottomNotice = bottomNoticeController.text;
                //           isEditing = false;
                //         }
                //       });

                //       // Upload the updated notices to the database
                //       await updateNotices();
                //     },
                //     child: Text('Save Notice'),
                //   ),
                // ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
