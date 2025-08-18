// import 'package:flutter/material.dart';
// import 'marks_display_screen.dart';

// class HalfYearlyMarksScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MarksDisplayScreen(period: 'half_yearly');
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

// class HalfYearlyMarksScreen extends StatefulWidget {
//   @override
//   _HalfYearlyMarksScreenState createState() => _HalfYearlyMarksScreenState();
// }

// class _HalfYearlyMarksScreenState extends State<HalfYearlyMarksScreen> {
//   final supabase = Supabase.instance.client;
//   bool _isLoading = true;
//   List<Map<String, dynamic>> _halfYearlyMarks = [];
//   final int _maxHalfYearlyMarks = 2600; // Set maximum marks for half-yearly progress.

//   @override
//   void initState() {
//     super.initState();
//     _fetchHalfYearlyMarks();
//   }

//   Future<void> _fetchHalfYearlyMarks() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final today = DateTime.now();
//       final sixMonthsAgo = today.subtract(Duration(days: 180)); // Fetch data for the last 6 months

//       // Fetch data from Supabase
//       final response = await supabase
//           .from('marks')
//           .select('name, marks, date, profile_picture')
//           .gte('date', sixMonthsAgo.toIso8601String())
//           .order('date', ascending: false);

//       if (response != null) {
//         setState(() {
//           _halfYearlyMarks = (response as List<dynamic>)
//               .map((e) => e as Map<String, dynamic>)
//               .toList();
//           _isLoading = false;
//         });
//       } else {
//         throw Exception('Unknown error occurred while fetching data.');
//       }
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error fetching marks: ${e.toString()}'),
//           duration: Duration(seconds: 3),
//         ),
//       );
//     }
//   }

//   Widget _buildLiquidProgress(double percentage) {
//     return SizedBox(
//       width: 50,
//       height: 50,
//       child: LiquidCircularProgressIndicator(
//         value: percentage.clamp(0.0, 1.0), // Ensure value is within 0.0 - 1.0
//         valueColor: AlwaysStoppedAnimation(Colors.blue),
//         backgroundColor: Colors.grey[200]!,
//         borderColor: Colors.blue,
//         borderWidth: 2.0,
//         direction: Axis.vertical,
//         center: Text(
//           '${(percentage * 100).toStringAsFixed(1)}%',
//           style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Half-Yearly Marks'),
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : _halfYearlyMarks.isEmpty
//               ? Center(
//                   child: Text(
//                     'No marks found for the last six months.',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 )
//               : ListView.builder(
//                   itemCount: _halfYearlyMarks.length,
//                   itemBuilder: (context, index) {
//                     final mark = _halfYearlyMarks[index];
//                     final name = mark['name'] ?? 'Unknown';
//                     final marks = mark['marks'] as int;
//                     final date = mark['date'] ?? 'Unknown Date';
//                     final profilePictureUrl =
//                         mark['profile_picture'] ?? ''; // Profile picture URL
//                     final percentage = marks / _maxHalfYearlyMarks;

//                     return Card(
//                       elevation: 4,
//                       margin: const EdgeInsets.symmetric(
//                           vertical: 8, horizontal: 16),
//                       child: ListTile(
//                         leading: CircleAvatar(
//                           backgroundImage: profilePictureUrl.isNotEmpty
//                               ? NetworkImage(profilePictureUrl)
//                               : null,
//                           backgroundColor: Colors.grey,
//                           radius: 30, // Increased the radius for a bigger image
//                           child: profilePictureUrl.isEmpty
//                               ? Icon(Icons.person, color: Colors.white)
//                               : null,
//                         ),
//                         title: Text(name),
//                         subtitle: Text(
//                           'Marks: $marks\n',
//                           style: TextStyle(fontSize: 16),
//                         ),
//                         trailing: _buildLiquidProgress(percentage),
//                       ),
//                     );
//                   },
//                 ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

// class HalfYearlyMarksScreen extends StatefulWidget {
//   @override
//   _HalfYearlyMarksScreenState createState() => _HalfYearlyMarksScreenState();
// }

// class _HalfYearlyMarksScreenState extends State<HalfYearlyMarksScreen> {
//   final supabase = Supabase.instance.client;
//   bool _isLoading = true;
//   List<Map<String, dynamic>> _halfYearlyMarks = [];
//   final int _maxHalfYearlyMarks = 2600; // Set maximum marks for half-yearly progress.

//   @override
//   void initState() {
//     super.initState();
//     _fetchHalfYearlyMarks();
//   }

//   Future<void> _fetchHalfYearlyMarks() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final today = DateTime.now();
//       final sixMonthsAgo = today.subtract(Duration(days: 180));

//       final response = await supabase
//           .from('marks')
//           .select('name, marks, date, profile_picture')
//           .gte('date', sixMonthsAgo.toIso8601String())
//           .order('date', ascending: false);

//       if (response != null) {
//         setState(() {
//           _halfYearlyMarks = (response as List<dynamic>)
//               .map((e) => e as Map<String, dynamic>)
//               .toList();
//           _isLoading = false;
//         });
//       } else {
//         throw Exception('Unknown error occurred while fetching data.');
//       }
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error fetching marks: ${e.toString()}'),
//           duration: Duration(seconds: 3),
//         ),
//       );
//     }
//   }

//   Widget _buildLiquidProgress(double percentage) {
//     return Container(
//       width: 60,
//       height: 60,
//       child: LiquidCircularProgressIndicator(
//         value: percentage.clamp(0.0, 1.0),
//         valueColor: AlwaysStoppedAnimation(Colors.lightBlue),
//         backgroundColor: Colors.white,
//         borderColor: Colors.lightBlueAccent,
//         borderWidth: 2.0,
//         center: Text(
//           '${(percentage * 100).toStringAsFixed(1)}%',
//           style: TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.bold,
//             color: Colors.blueGrey,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildMarkCard(Map<String, dynamic> mark) {
//     final name = mark['name'] ?? 'Unknown';
//     final marks = mark['marks'] as int;
//     final date = mark['date'] ?? 'Unknown Date';
//     final profilePictureUrl = mark['profile_picture'] ?? '';
//     final percentage = marks / _maxHalfYearlyMarks;

//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       elevation: 8,
//       margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           children: [
//             CircleAvatar(
//               backgroundImage: profilePictureUrl.isNotEmpty
//                   ? NetworkImage(profilePictureUrl)
//                   : null,
//               backgroundColor: Colors.grey[200],
//               radius: 35,
//               child: profilePictureUrl.isEmpty
//                   ? Icon(Icons.person, color: Colors.blueGrey, size: 30)
//                   : null,
//             ),
//             SizedBox(width: 16),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     name,
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     'Marks: $marks',
//                     style: TextStyle(fontSize: 16, color: Colors.blueGrey),
//                   ),
//                   Text(
//                     'Date: $date',
//                     style: TextStyle(fontSize: 14, color: Colors.grey),
//                   ),
//                 ],
//               ),
//             ),
//             _buildLiquidProgress(percentage),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Half-Yearly Marks',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [const Color.fromARGB(255, 221, 221, 221), Colors.white],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: _isLoading
//             ? Center(child: CircularProgressIndicator())
//             : _halfYearlyMarks.isEmpty
//                 ? Center(
//                     child: Text(
//                       'No marks found for the last six months.',
//                       style: TextStyle(fontSize: 18, color: Colors.blueGrey),
//                     ),
//                   )
//                 : ListView.builder(
//                     itemCount: _halfYearlyMarks.length,
//                     itemBuilder: (context, index) =>
//                         _buildMarkCard(_halfYearlyMarks[index]),
//                   ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

// class HalfYearlyMarksScreen extends StatefulWidget {
//   @override
//   _HalfYearlyMarksScreenState createState() => _HalfYearlyMarksScreenState();
// }

// class _HalfYearlyMarksScreenState extends State<HalfYearlyMarksScreen> {
//   final supabase = Supabase.instance.client;
//   bool _isLoading = true;
//   List<Map<String, dynamic>> _halfYearlyMarks = [];
//   final int _maxHalfYearlyMarks = 2600; // Set maximum marks for half-yearly progress.

//   @override
//   void initState() {
//     super.initState();
//     _fetchHalfYearlyMarks();
//   }

//   Future<void> _fetchHalfYearlyMarks() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final today = DateTime.now();
//       final sixMonthsAgo = today.subtract(Duration(days: 180));

//       final response = await supabase
//           .from('marks')
//           .select('name, marks, date, profile_picture')
//           .gte('date', sixMonthsAgo.toIso8601String())
//           .order('date', ascending: false);

//       if (response != null) {
//         setState(() {
//           _halfYearlyMarks = (response as List<dynamic>)
//               .map((e) => e as Map<String, dynamic>)
//               .toList();
//           _isLoading = false;
//         });
//       } else {
//         throw Exception('Unknown error occurred while fetching data.');
//       }
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error fetching marks: ${e.toString()}'),
//           duration: Duration(seconds: 3),
//         ),
//       );
//     }
//   }

//   Widget _buildLiquidProgress(double percentage) {
//     return Container(
//       width: 60,
//       height: 60,
//       child: LiquidCircularProgressIndicator(
//         value: percentage.clamp(0.0, 1.0),
//         valueColor: AlwaysStoppedAnimation(Color(0xFFFFD700)), // Golden color
//         backgroundColor: Colors.white,
//         borderColor: Color(0xFFB22222), // Firebrick red
//         borderWidth: 2.0,
//         center: Text(
//           '${(percentage * 100).toStringAsFixed(1)}%',
//           style: TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.bold,
//             color: Color(0xFFB22222), // Firebrick red for text
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildMarkCard(Map<String, dynamic> mark) {
//     final name = mark['name'] ?? 'Unknown';
//     final marks = mark['marks'] as int;
//     final date = mark['date'] ?? 'Unknown Date';
//     final profilePictureUrl = mark['profile_picture'] ?? '';
//     final percentage = marks / _maxHalfYearlyMarks;

//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       elevation: 8,
//       margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           children: [
//             CircleAvatar(
//               backgroundImage: profilePictureUrl.isNotEmpty
//                   ? NetworkImage(profilePictureUrl)
//                   : null,
//               backgroundColor: Color.fromARGB(131, 255, 217, 2), // Golden background
//               radius: 35,
//               child: profilePictureUrl.isEmpty
//                   ? Icon(Icons.person, color: Color.fromARGB(255, 252, 0, 0), size: 30) // Red icon
//                   : null,
//             ),
//             SizedBox(width: 16),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     name,
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Color.fromARGB(255, 0, 0, 0), // Firebrick red
//                     ),
//                   ),
//                   Text(
//                     'Marks: $marks',
//                     style: TextStyle(fontSize: 16, color: Colors.black),
//                   ),
//                   Text(
//                     'Date: $date',
//                     style: TextStyle(fontSize: 14, color: Colors.grey),
//                   ),
//                 ],
//               ),
//             ),
//             _buildLiquidProgress(percentage),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Half-Yearly Marks',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         backgroundColor: Color.fromARGB(255, 255, 255, 255), // Firebrick red
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [ Color.fromARGB(122, 121, 121, 121),Color.fromARGB(88, 255, 218, 8)], // Golden to red
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: _isLoading
//             ? Center(child: CircularProgressIndicator())
//             : _halfYearlyMarks.isEmpty
//                 ? Center(
//                     child: Text(
//                       'No marks found for the last six months.',
//                       style: TextStyle(fontSize: 18, color: Colors.white),
//                     ),
//                   )
//                 : ListView.builder(
//                     itemCount: _halfYearlyMarks.length,
//                     itemBuilder: (context, index) =>
//                         _buildMarkCard(_halfYearlyMarks[index]),
//                   ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

// class HalfYearlyMarksScreen extends StatefulWidget {
//   @override
//   _HalfYearlyMarksScreenState createState() => _HalfYearlyMarksScreenState();
// }

// class _HalfYearlyMarksScreenState extends State<HalfYearlyMarksScreen> {
//   final supabase = Supabase.instance.client;
//   bool _isLoading = true;
//   List<Map<String, dynamic>> _halfYearlyMarks = [];
//   final int _maxHalfYearlyMarks = 2600; // Set maximum marks for half-yearly progress.

//   @override
//   void initState() {
//     super.initState();
//     _fetchHalfYearlyMarks();
//   }

//   Future<void> _fetchHalfYearlyMarks() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final today = DateTime.now();
//       final sixMonthsAgo = today.subtract(Duration(days: 180));

//       final response = await supabase
//           .from('marks')
//           .select('name, marks, date, profile_picture')
//           .gte('date', sixMonthsAgo.toIso8601String())
//           .order('date', ascending: false);

//       if (response != null) {
//         setState(() {
//           _halfYearlyMarks = (response as List<dynamic>)
//               .map((e) => e as Map<String, dynamic>)
//               .toList();
//           _isLoading = false;
//         });
//       } else {
//         throw Exception('Unknown error occurred while fetching data.');
//       }
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error fetching marks: ${e.toString()}'),
//           duration: Duration(seconds: 3),
//         ),
//       );
//     }
//   }

//   Widget _buildLiquidProgress(double percentage) {
//     return SizedBox(
//       width: 60,
//       height: 60,
//       child: LiquidCircularProgressIndicator(
//         value: percentage.clamp(0.0, 1.0),
//         valueColor: AlwaysStoppedAnimation(Color(0xFFFFD700)), // Yellow
//         backgroundColor: Colors.white,
//         borderColor: const Color.fromARGB(255, 6, 1, 53),
//         borderWidth: 2.0,
//         center: Text(
//           '${(percentage * 100).toStringAsFixed(1)}%',
//           style: TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.bold,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildMarkCard(Map<String, dynamic> mark) {
//     final name = mark['name'] ?? 'Unknown';
//     final marks = mark['marks'] as int;
//     final date = mark['date'] ?? 'Unknown Date';
//     final profilePictureUrl = mark['profile_picture'] ?? '';
//     final percentage = marks / _maxHalfYearlyMarks;

//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       elevation: 4,
//       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//       child: Container(
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(15),
//           border: Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 2.0), // Yellow border
//         ),
//         child: Row(
//           children: [
//             CircleAvatar(
//               backgroundImage: profilePictureUrl.isNotEmpty
//                   ? NetworkImage(profilePictureUrl)
//                   : null,
//               backgroundColor: Color.fromARGB(255, 163, 157, 157), // Yellow background
//               radius: 30,
//               child: profilePictureUrl.isEmpty
//                   ? Icon(Icons.person, color: const Color.fromARGB(255, 255, 255, 255), size: 30)
//                   : null,
//             ),
//             SizedBox(width: 16),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     name,
//                     style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                       color: const Color.fromARGB(255, 24, 1, 6),
//                     ),
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     'Marks: $marks',
//                     style: TextStyle(
//                       fontSize: 16,
                      
//                       color: Colors.black87,
//                     ),
//                   ),
//                   // Text(
//                   //   'Date: $date',
//                   //   style: TextStyle(fontSize: 14, color: Colors.grey),
//                   // ),
//                 ],
//               ),
//             ),
//             _buildLiquidProgress(percentage),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Half-Yearly Marks',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white, // Red app bar
//       ),
//       body: Container(
//         color: const Color.fromARGB(255, 255, 250, 250), // 60% white background
//         child: _isLoading
//             ? Center(child: CircularProgressIndicator(color: Colors.red))
//             : _halfYearlyMarks.isEmpty
//                 ? Center(
//                     child: Text(
//                       'No marks found for the last six months.',
//                       style: TextStyle(fontSize: 18, color: Colors.black),
//                     ),
//                   )
//                 : ListView.builder(
//                     itemCount: _halfYearlyMarks.length,
//                     itemBuilder: (context, index) =>
//                         _buildMarkCard(_halfYearlyMarks[index]),
//                   ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

// class HalfYearlyMarksScreen extends StatefulWidget {
//   @override
//   _HalfYearlyMarksScreenState createState() => _HalfYearlyMarksScreenState();
// }

// class _HalfYearlyMarksScreenState extends State<HalfYearlyMarksScreen> {
//   final supabase = Supabase.instance.client;
//   bool _isLoading = true;
//   List<Map<String, dynamic>> _halfYearlyMarks = [];
//   final int _maxHalfYearlyMarks = 2600;

//   @override
//   void initState() {
//     super.initState();
//     _fetchHalfYearlyMarks();
//   }

//   Future<void> _fetchHalfYearlyMarks() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final today = DateTime.now();
//       final sixMonthsAgo = today.subtract(Duration(days: 180));

//       final response = await supabase
//           .from('marks')
//           .select('name, marks, date, profile_picture')
//           .gte('date', sixMonthsAgo.toIso8601String())
//           .order('date', ascending: false);

//       if (response != null) {
//         setState(() {
//           _halfYearlyMarks = (response as List<dynamic>)
//               .map((e) => e as Map<String, dynamic>)
//               .toList();
//           _isLoading = false;
//         });
//       } else {
//         throw Exception('Unknown error occurred while fetching data.');
//       }
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error fetching marks: ${e.toString()}'),
//           duration: Duration(seconds: 3),
//         ),
//       );
//     }
//   }

//   Widget _buildLiquidProgress(double percentage) {
//     return Container(
//       width: 60,
//       height: 60,
//       child: LiquidCircularProgressIndicator(
//         value: percentage.clamp(0.0, 1.0),
//         valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
//         backgroundColor: Colors.white,
//         borderColor: Colors.blue,
//         borderWidth: 2.0,
//         center: Text(
//           '${(percentage * 100).toStringAsFixed(1)}%',
//           style: TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.bold,
//             color: Colors.blue,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildMarkCard(Map<String, dynamic> mark) {
//     final name = mark['name'] ?? 'Unknown';
//     final marks = mark['marks'] as int;
//     final date = mark['date'] ?? 'Unknown Date';
//     final profilePictureUrl = mark['profile_picture'] ?? '';
//     final percentage = marks / _maxHalfYearlyMarks;

//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       elevation: 5,
//       margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Row(
//           children: [
//             CircleAvatar(
//               backgroundImage: profilePictureUrl.isNotEmpty
//                   ? NetworkImage(profilePictureUrl)
//                   : null,
//               backgroundColor: Colors.blue[50],
//               radius: 35,
//               child: profilePictureUrl.isEmpty
//                   ? Icon(Icons.person, color: Colors.blue, size: 30)
//                   : null,
//             ),
//             SizedBox(width: 16),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     name,
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: const Color.fromARGB(255, 0, 0, 0),
//                     ),
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     'Marks: $marks',
//                     style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                    

//                   ),
//                   // Text(
//                   //   'Date: $date',
//                   //   style: TextStyle(fontSize: 14, color: Colors.grey),
//                   // ),
//                 ],
//               ),
//             ),
//             _buildLiquidProgress(percentage),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Half-Yearly Marks',
//           style: TextStyle(fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 3, 3, 3)),
//         ),
//         centerTitle: true,
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [const Color.fromARGB(255, 255, 255, 255), const Color.fromARGB(255, 255, 255, 255)],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [const Color.fromARGB(255, 255, 255, 255), Colors.blue[50]!],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: _isLoading
//             ? Center(child: CircularProgressIndicator(color: const Color.fromARGB(255, 172, 177, 182)))
//             : _halfYearlyMarks.isEmpty
//                 ? Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.school, color: Colors.blue, size: 64),
//                         SizedBox(height: 10),
//                         Text(
//                           'No marks found for the last six months.',
//                           style: TextStyle(
//                               fontSize: 18, color: Colors.blueGrey),
//                         ),
//                       ],
//                     ),
//                   )
//                 : ListView.builder(
//                     itemCount: _halfYearlyMarks.length,
//                     itemBuilder: (context, index) =>
//                         _buildMarkCard(_halfYearlyMarks[index]),
//                   ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

// class HalfYearlyMarksScreen extends StatefulWidget {
//   @override
//   _HalfYearlyMarksScreenState createState() => _HalfYearlyMarksScreenState();
// }

// class _HalfYearlyMarksScreenState extends State<HalfYearlyMarksScreen> {
//   final supabase = Supabase.instance.client;
//   bool _isLoading = true;
//   List<Map<String, dynamic>> _halfYearlyMarks = [];
//   final int _maxHalfYearlyMarks = 2600;

//   @override
//   void initState() {
//     super.initState();
//     _fetchHalfYearlyMarks();
//   }

//   Future<void> _fetchHalfYearlyMarks() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final today = DateTime.now();
//       final sixMonthsAgo = today.subtract(Duration(days: 180));

//       final response = await supabase
//           .from('marks')
//           .select('name, marks, date, profile_picture')
//           .gte('date', sixMonthsAgo.toIso8601String())
//           .order('date', ascending: false);

//       if (response != null && response.isNotEmpty) {
//         setState(() {
//           _halfYearlyMarks = (response as List<dynamic>)
//               .map((e) => e as Map<String, dynamic>)
//               .toList();
//         });
//       } else {
//         _showSnackBar('No data found for the last six months.');
//       }
//     } catch (e) {
//       _showSnackBar('Error fetching marks: ${e.toString()}');
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   void _showSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         duration: Duration(seconds: 3),
//       ),
//     );
//   }

//   Widget _buildLiquidProgress(double percentage) {
//     return SizedBox(
//       width: 60,
//       height: 60,
//       child: LiquidCircularProgressIndicator(
//         value: percentage.clamp(0.0, 1.0),
//         valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
//         backgroundColor: Colors.white,
//         borderColor: Colors.blue,
//         borderWidth: 2.0,
//         center: Text(
//           '${(percentage * 100).toStringAsFixed(1)}%',
//           style: TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.bold,
//             color: Colors.blue,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildMarkCard(Map<String, dynamic> mark) {
//     final name = mark['name'] ?? 'Unknown';
//     final marks = mark['marks'] as int? ?? 0;
//     final date = mark['date'] ?? 'Unknown Date';
//     final profilePictureUrl = mark['profile_picture'] ?? '';
//     final percentage = marks / _maxHalfYearlyMarks;

//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       elevation: 5,
//       margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Row(
//           children: [
//             CircleAvatar(
//               backgroundImage: profilePictureUrl.isNotEmpty
//                   ? NetworkImage(profilePictureUrl)
//                   : null,
//               backgroundColor: Colors.blue[50],
//               radius: 35,
//               child: profilePictureUrl.isEmpty
//                   ? Icon(Icons.person, color: Colors.blue, size: 30)
//                   : null,
//             ),
//             SizedBox(width: 16),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     name,
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     'Marks: $marks',
//                     style: TextStyle(fontSize: 16, color: Colors.blueGrey),
//                   ),
//                   SizedBox(height: 4),
//                   // Text(
//                   //   'Date: $date',
//                   //   style: TextStyle(fontSize: 14, color: Colors.grey),
//                   // ),
//                 ],
//               ),
//             ),
//             _buildLiquidProgress(percentage),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Half-Yearly Marks',
//           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
//         ),
//         centerTitle: true,
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.white, Colors.blue[100]!],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.white, Colors.blue[50]!],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: _isLoading
//             ? Center(
//                 child: CircularProgressIndicator(
//                   color: Colors.blueAccent,
//                 ),
//               )
//             : _halfYearlyMarks.isEmpty
//                 ? Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.school, color: Colors.blue, size: 64),
//                         SizedBox(height: 10),
//                         Text(
//                           'No marks found for the last six months.',
//                           style: TextStyle(
//                             fontSize: 18,
//                             color: Colors.blueGrey,
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 : ListView.builder(
//                     itemCount: _halfYearlyMarks.length,
//                     itemBuilder: (context, index) =>
//                         _buildMarkCard(_halfYearlyMarks[index]),
//                   ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

// class HalfYearlyMarksScreen extends StatefulWidget {
//   @override
//   _HalfYearlyMarksScreenState createState() => _HalfYearlyMarksScreenState();
// }

// class _HalfYearlyMarksScreenState extends State<HalfYearlyMarksScreen> {
//   final supabase = Supabase.instance.client;
//   bool _isLoading = true;
//   List<Map<String, dynamic>> _halfYearlyMarks = [];
//   final int _maxHalfYearlyMarks = 2600; // Max marks for half-yearly progress.

//   @override
//   void initState() {
//     super.initState();
//     _fetchHalfYearlyMarks();
//   }

//   Future<void> _fetchHalfYearlyMarks() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final today = DateTime.now();
//       final sixMonthsAgo = today.subtract(Duration(days: 180));

//       final response = await supabase
//           .from('marks')
//           .select('name, marks, date, profile_picture')
//           .gte('date', sixMonthsAgo.toIso8601String())
//           .order('date', ascending: false);

//       if (response != null) {
//         setState(() {
//           _halfYearlyMarks = (response as List<dynamic>)
//               .map((e) => e as Map<String, dynamic>)
//               .toList();
//           _isLoading = false;
//         });
//       } else {
//         throw Exception('Unknown error occurred while fetching data.');
//       }
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error fetching marks: ${e.toString()}'),
//           duration: Duration(seconds: 3),
//         ),
//       );
//     }
//   }

//   Widget _buildLiquidProgress(double percentage) {
//     return SizedBox(
//       width: 50,
//       height: 50,
//       child: LiquidCircularProgressIndicator(
//         value: percentage.clamp(0.0, 1.0), // Ensure value is within 0.0 - 1.0
//         valueColor: AlwaysStoppedAnimation(Colors.blue),
//         backgroundColor: Colors.grey[200]!,
//         borderColor: Colors.blue,
//         borderWidth: 2.0,
//         direction: Axis.vertical,
//         center: Text(
//           '${(percentage * 100).toStringAsFixed(1)}%',
//           style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Half-Yearly Marks'),
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : _halfYearlyMarks.isEmpty
//               ? Center(
//                   child: Text(
//                     'No marks found for the last six months.',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 )
//               : ListView.builder(
//                   itemCount: _halfYearlyMarks.length,
//                   itemBuilder: (context, index) {
//                     final mark = _halfYearlyMarks[index];
//                     final name = mark['name'] ?? 'Unknown';
//                     final marks = mark['marks'] as int;
//                     final profilePictureUrl =
//                         mark['profile_picture'] ?? ''; // Profile picture URL
//                     final percentage = marks / _maxHalfYearlyMarks;

//                     return Card(
//                       elevation: 4,
//                       margin: const EdgeInsets.symmetric(
//                           vertical: 8, horizontal: 16),
//                       child: ListTile(
//                         leading: CircleAvatar(
//                           backgroundImage: profilePictureUrl.isNotEmpty
//                               ? NetworkImage(profilePictureUrl)
//                               : null,
//                           backgroundColor: Colors.grey,
//                           radius: 30,
//                           child: profilePictureUrl.isEmpty
//                               ? Icon(Icons.person, color: Colors.white)
//                               : null,
//                         ),
//                         title: Text(name),
//                         subtitle: Text(
//                           'Marks: $marks\n',
//                           style: TextStyle(fontSize: 16),
//                         ),
//                         trailing: _buildLiquidProgress(percentage),
//                       ),
//                     );
//                   },
//                 ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';

// class HalfYearlyMarksScreen extends StatefulWidget {
//   @override
//   _HalfYearlyMarksScreenState createState() => _HalfYearlyMarksScreenState();
// }

// class _HalfYearlyMarksScreenState extends State<HalfYearlyMarksScreen> {
//   final supabase = Supabase.instance.client;
//   bool _isLoading = true;
//   List<Map<String, dynamic>> _halfYearlyMarks = [];
//   final int _maxHalfYearlyMarks = 2600; // Max marks for half-yearly progress.

//   @override
//   void initState() {
//     super.initState();
//     _fetchHalfYearlyMarks();
//   }

//   Future<void> _fetchHalfYearlyMarks() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final today = DateTime.now();
//       final sixMonthsAgo = today.subtract(Duration(days: 180));

//       final response = await supabase
//           .from('marks')
//           .select('name, marks, date, uid,profile_picture')
//           .gte('date', sixMonthsAgo.toIso8601String())
//           .order('date', ascending: false);

//       if (response != null) {
//         setState(() {
//           _halfYearlyMarks = (response as List<dynamic>)
//               .map((e) => e as Map<String, dynamic>)
//               .toList();
//           _isLoading = false;
//         });
//       } else {
//         throw Exception('Unknown error occurred while fetching data.');
//       }
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error fetching marks: ${e.toString()}'),
//           duration: Duration(seconds: 3),
//         ),
//       );
//     }
//   }

//   Future<void> _downloadPDF() async {
//     final pdf = pw.Document();

//     // Add content to the PDF
//     pdf.addPage(
//       pw.Page(
//         build: (context) => pw.Column(
//           crossAxisAlignment: pw.CrossAxisAlignment.start,
//           children: [
//             pw.Text(
//               'Half-Yearly Marks',
//               style: pw.TextStyle(
//                 fontSize: 24,
//                 fontWeight: pw.FontWeight.bold,
//               ),
//             ),
//             pw.SizedBox(height: 16),
//             pw.Table.fromTextArray(
//               headers: ['Name', 'Marks Obtained / Total Marks'],
//               data: _halfYearlyMarks.map((mark) {
//                 final name = mark['name'] ?? 'Unknown';
//                 final marks = mark['marks'] ?? 0;
//                 return [name, '$marks / $_maxHalfYearlyMarks'];
//               }).toList(),
//             ),
//           ],
//         ),
//       ),
//     );

//     try {
//       // Save the PDF
//       final tempDir = await getTemporaryDirectory();
//       final file = File('${tempDir.path}/HalfYearlyMarks.pdf');
//       await file.writeAsBytes(await pdf.save());

//       // Open the PDF
//       await Printing.sharePdf(bytes: await pdf.save(), filename: 'HalfYearlyMarks.pdf');
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to generate PDF: $e')),
//       );
//     }
//   }

//   Widget _buildLiquidProgress(double percentage) {
//     return SizedBox(
//       width: 50,
//       height: 50,
//       child: LiquidCircularProgressIndicator(
//         value: percentage.clamp(0.0, 1.0), // Ensure value is within 0.0 - 1.0
//         valueColor: AlwaysStoppedAnimation(Colors.blue),
//         backgroundColor: Colors.grey[200]!,
//         borderColor: Colors.blue,
//         borderWidth: 2.0,
//         direction: Axis.vertical,
//         center: Text(
//           '${(percentage * 100).toStringAsFixed(1)}%',
//           style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       title: Text('Half-Yearly Marks'),
//   //       actions: [
//   //         IconButton(
//   //           icon: Icon(Icons.download),
//   //           onPressed: _halfYearlyMarks.isNotEmpty ? _downloadPDF : null,
//   //         ),
//   //       ],
//   //     ),
//   //     body: _isLoading
//   //         ? Center(child: CircularProgressIndicator())
//   //         : _halfYearlyMarks.isEmpty
//   //             ? Center(
//   //                 child: Text(
//   //                   'No marks found for the last six months.',
//   //                   style: TextStyle(fontSize: 16),
//   //                 ),
//   //               )
//   //             : ListView.builder(
//   //                 itemCount: _halfYearlyMarks.length,
//   //                 itemBuilder: (context, index) {
//   //                   final mark = _halfYearlyMarks[index];
//   //                   final name = mark['name'] ?? 'Unknown';
//   //                   final marks = mark['marks'] as int;
//   //                   final profilePictureUrl =
//   //                       mark['profile_picture'] ?? ''; // Profile picture URL
//   //                   final percentage = marks / _maxHalfYearlyMarks;

//   //                   return Card(
//   //                     elevation: 4,
//   //                     margin: const EdgeInsets.symmetric(
//   //                         vertical: 8, horizontal: 16),
//   //                     child: ListTile(
//   //                       leading: CircleAvatar(
//   //                         backgroundImage: profilePictureUrl.isNotEmpty
//   //                             ? NetworkImage(profilePictureUrl)
//   //                             : null,
//   //                         backgroundColor: Colors.grey,
//   //                         radius: 30,
//   //                         child: profilePictureUrl.isEmpty
//   //                             ? Icon(Icons.person, color: Colors.white)
//   //                             : null,
//   //                       ),
//   //                       title: Text(name),
//   //                       subtitle: Text(
//   //                         'Marks: $marks\n',
//   //                         style: TextStyle(fontSize: 16),
//   //                       ),
//   //                       trailing: _buildLiquidProgress(percentage),
//   //                     ),
//   //                   );
//   //                 },
//   //               ),
//   //   );
//   // }
// @override
// Widget build(BuildContext context) {
//   // Group marks by UID and sum them
//   Map<String, int> summedMarks = {};
//   for (var mark in _halfYearlyMarks) {
//     final uid = mark['uid'] ?? '';
//     final marks = mark['marks'] as int;

//     if (summedMarks.containsKey(uid)) {
//       summedMarks[uid] = summedMarks[uid]! + marks; // Add marks if UID is the same
//     } else {
//       summedMarks[uid] = marks; // Initialize with the first marks entry
//     }
//   }

//   // Prepare the data for display
//   List<Map<String, dynamic>> groupedMarks = [];
//   for (var uid in summedMarks.keys) {
//     // Filter all marks with the same UID
//     var userMarks = _halfYearlyMarks.where((mark) => mark['uid'] == uid).toList();
//     var name = userMarks.isNotEmpty ? userMarks[0]['name'] : 'Unknown';
//     var profilePictureUrl = userMarks.isNotEmpty ? userMarks[0]['profile_picture'] : '';
//     var totalMarks = summedMarks[uid]!;
//     var percentage = totalMarks / _maxHalfYearlyMarks;

//     groupedMarks.add({
//       'uid': uid,
//       'name': name,
//       'profile_picture': profilePictureUrl,
//       'totalMarks': totalMarks,
//       'percentage': percentage,
//     });
//   }

//   return Scaffold(
//     appBar: AppBar(
//       title: Text('Half-Yearly Marks'),
//       actions: [
//         IconButton(
//           icon: Icon(Icons.download),
//           onPressed: _halfYearlyMarks.isNotEmpty ? _downloadPDF : null,
//         ),
//       ],
//     ),
//     body: _isLoading
//         ? Center(child: CircularProgressIndicator())
//         : groupedMarks.isEmpty
//             ? Center(
//                 child: Text(
//                   'No marks found for the last six months.',
//                   style: TextStyle(fontSize: 16),
//                 ),
//               )
//             : ListView.builder(
//                 itemCount: groupedMarks.length,
//                 itemBuilder: (context, index) {
//                   final mark = groupedMarks[index];
//                   final name = mark['name'] ?? 'Unknown';
//                   final totalMarks = mark['totalMarks'] as int;
//                   final profilePictureUrl = mark['profile_picture'] ?? '';
//                   final percentage = mark['percentage'];

//                   return Card(
//                     elevation: 4,
//                     margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                     child: ListTile(
//                       leading: CircleAvatar(
//                         backgroundImage: profilePictureUrl.isNotEmpty
//                             ? NetworkImage(profilePictureUrl)
//                             : null,
//                         backgroundColor: Colors.grey,
//                         radius: 30,
//                         child: profilePictureUrl.isEmpty
//                             ? Icon(Icons.person, color: Colors.white)
//                             : null,
//                       ),
//                       title: Text(name),
//                       subtitle: Text(
//                         'Marks: $totalMarks\n',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       trailing: _buildLiquidProgress(percentage),
//                     ),
//                   );
//                 },
//               ),
//   );
// }

// }
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class HalfYearlyMarksScreen extends StatefulWidget {
  @override
  _HalfYearlyMarksScreenState createState() => _HalfYearlyMarksScreenState();
}

class _HalfYearlyMarksScreenState extends State<HalfYearlyMarksScreen> {
  final supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<Map<String, dynamic>> _halfYearlyMarks = [];
  final int _maxHalfYearlyMarks = 2600; // Max marks for half-yearly progress.

  @override
  void initState() {
    super.initState();
    _fetchHalfYearlyMarks();
  }

  Future<void> _fetchHalfYearlyMarks() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final today = DateTime.now();
      final sixMonthsAgo = today.subtract(Duration(days: 180));

      final response = await supabase
          .from('marks')
          .select('name, marks, date, uid,profile_picture')
          .gte('date', sixMonthsAgo.toIso8601String())
          .order('date', ascending: false);

      if (response != null) {
        setState(() {
          _halfYearlyMarks = (response as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList();
          _isLoading = false;
        });
      } else {
        throw Exception('Unknown error occurred while fetching data.');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error fetching marks: ${e.toString()}'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  // Future<void> _downloadPDF() async {
  //   final pdf = pw.Document();

  //   // Group marks by UID and sum them
  //   Map<String, int> summedMarks = {};
  //   for (var mark in _halfYearlyMarks) {
  //     final uid = mark['uid'] ?? '';
  //     final marks = mark['marks'] as int;

  //     if (summedMarks.containsKey(uid)) {
  //       summedMarks[uid] = summedMarks[uid]! + marks; // Add marks if UID is the same
  //     } else {
  //       summedMarks[uid] = marks; // Initialize with the first marks entry
  //     }
  //   }

  //   // Prepare the data for display in PDF
  //   List<Map<String, dynamic>> groupedMarks = [];
  //   for (var uid in summedMarks.keys) {
  //     // Filter all marks with the same UID
  //     var userMarks = _halfYearlyMarks.where((mark) => mark['uid'] == uid).toList();
  //     var name = userMarks.isNotEmpty ? userMarks[0]['name'] : 'Unknown';
  //     var profilePictureUrl = userMarks.isNotEmpty ? userMarks[0]['profile_picture'] : '';
  //     var totalMarks = summedMarks[uid]!;
  //     var percentage = totalMarks / _maxHalfYearlyMarks;

  //     groupedMarks.add({
  //       'uid': uid,
  //       'name': name,
  //       'profile_picture': profilePictureUrl,
  //       'totalMarks': totalMarks,
  //       'percentage': percentage,
  //     });
  //   }

  //   // Add content to the PDF
  //   pdf.addPage(
  //     pw.Page(
  //       build: (context) => pw.Column(
  //         crossAxisAlignment: pw.CrossAxisAlignment.start,
  //         children: [
  //           pw.Text(
  //             'Half-Yearly Marks',
  //             style: pw.TextStyle(
  //               fontSize: 24,
  //               fontWeight: pw.FontWeight.bold,
  //             ),
  //           ),
  //           pw.SizedBox(height: 16),
  //           pw.Table.fromTextArray(
  //             headers: ['Name', 'Marks Obtained / Total Marks'],
  //             data: groupedMarks.map((mark) {
  //               final name = mark['name'] ?? 'Unknown';
  //               final marks = mark['totalMarks'] ?? 0;
  //               return [name, '$marks / $_maxHalfYearlyMarks'];
  //             }).toList(),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );

  //   try {
  //     // Save the PDF
  //     final tempDir = await getTemporaryDirectory();
  //     final file = File('${tempDir.path}/HalfYearlyMarks.pdf');
  //     await file.writeAsBytes(await pdf.save());

  //     // Open the PDF
  //     await Printing.sharePdf(bytes: await pdf.save(), filename: 'HalfYearlyMarks.pdf');
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Failed to generate PDF: $e')),
  //     );
  //   }
  // }

Future<void> _downloadPDF() async {
  final pdf = pw.Document();

  // Group marks by UID and sum them
  Map<String, int> summedMarks = {};
  for (var mark in _halfYearlyMarks) {
    final uid = mark['uid'] ?? '';
    final marks = mark['marks'] as int;

    if (summedMarks.containsKey(uid)) {
      summedMarks[uid] = summedMarks[uid]! + marks; // Add marks if UID is the same
    } else {
      summedMarks[uid] = marks; // Initialize with the first marks entry
    }
  }

  // Prepare the data for display in PDF
  List<Map<String, dynamic>> groupedMarks = [];
  for (var uid in summedMarks.keys) {
    // Filter all marks with the same UID
    var userMarks = _halfYearlyMarks.where((mark) => mark['uid'] == uid).toList();
    var name = userMarks.isNotEmpty ? userMarks[0]['name'] : 'Unknown';
    var profilePictureUrl = userMarks.isNotEmpty ? userMarks[0]['profile_picture'] : '';
    var totalMarks = summedMarks[uid]!;
    var percentage = totalMarks / _maxHalfYearlyMarks;

    groupedMarks.add({
      'uid': uid,
      'name': name,
      'profile_picture': profilePictureUrl,
      'totalMarks': totalMarks,
      'percentage': percentage,
    });
  }

  // Sort grouped marks by totalMarks in descending order
  groupedMarks.sort((a, b) => b['totalMarks'].compareTo(a['totalMarks']));

  // Add content to the PDF
  pdf.addPage(
    pw.Page(
      build: (context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'Half-Yearly Marks',
            style: pw.TextStyle(
              fontSize: 24,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 16),
          pw.Table.fromTextArray(
            headers: ['SN', 'Name', 'Total Marks'],
            data: List.generate(groupedMarks.length, (index) {
              final mark = groupedMarks[index];
              final sn = index + 1;  // Serial Number
              final name = mark['name'] ?? 'Unknown';
              final marks = mark['totalMarks'] ?? 0;
              return [sn.toString(), name, '$marks / $_maxHalfYearlyMarks'];
            }),
          ),
        ],
      ),
    ),
  );

  try {
    // Save the PDF
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/HalfYearlyMarks.pdf');
    await file.writeAsBytes(await pdf.save());

    // Open the PDF
    await Printing.sharePdf(bytes: await pdf.save(), filename: 'HalfYearlyMarks.pdf');
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to generate PDF: $e')),
    );
  }
}


  Widget _buildLiquidProgress(double percentage) {
    return SizedBox(
      width: 50,
      height: 50,
      child: LiquidCircularProgressIndicator(
        value: percentage.clamp(0.0, 1.0), // Ensure value is within 0.0 - 1.0
        valueColor: AlwaysStoppedAnimation(Colors.blue),
        backgroundColor: Colors.grey[200]!,
        borderColor: Colors.blue,
        borderWidth: 2.0,
        direction: Axis.vertical,
        center: Text(
          '${(percentage * 100).toStringAsFixed(1)}%',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   // Group marks by UID and sum them
  //   Map<String, int> summedMarks = {};
  //   for (var mark in _halfYearlyMarks) {
  //     final uid = mark['uid'] ?? '';
  //     final marks = mark['marks'] as int;

  //     if (summedMarks.containsKey(uid)) {
  //       summedMarks[uid] = summedMarks[uid]! + marks; // Add marks if UID is the same
  //     } else {
  //       summedMarks[uid] = marks; // Initialize with the first marks entry
  //     }
  //   }

  //   // Prepare the data for display
  //   List<Map<String, dynamic>> groupedMarks = [];
  //   for (var uid in summedMarks.keys) {
  //     // Filter all marks with the same UID
  //     var userMarks = _halfYearlyMarks.where((mark) => mark['uid'] == uid).toList();
  //     var name = userMarks.isNotEmpty ? userMarks[0]['name'] : 'Unknown';
  //     var profilePictureUrl = userMarks.isNotEmpty ? userMarks[0]['profile_picture'] : '';
  //     var totalMarks = summedMarks[uid]!;
  //     var percentage = totalMarks / _maxHalfYearlyMarks;

  //     groupedMarks.add({
  //       'uid': uid,
  //       'name': name,
  //       'profile_picture': profilePictureUrl,
  //       'totalMarks': totalMarks,
  //       'percentage': percentage,
  //     });
  //   }

  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Half-Yearly Marks'),
  //       actions: [
  //         IconButton(
  //           icon: Icon(Icons.download),
  //           onPressed: _halfYearlyMarks.isNotEmpty ? _downloadPDF : null,
  //         ),
  //       ],
  //     ),
  //     body: _isLoading
  //         ? Center(child: CircularProgressIndicator())
  //         : groupedMarks.isEmpty
  //             ? Center(
  //                 child: Text(
  //                   'No marks found for the last six months.',
  //                   style: TextStyle(fontSize: 16),
  //                 ),
  //               )
  //             : ListView.builder(
  //                 itemCount: groupedMarks.length,
  //                 itemBuilder: (context, index) {
  //                   final mark = groupedMarks[index];
  //                   final name = mark['name'] ?? 'Unknown';
  //                   final totalMarks = mark['totalMarks'] as int;
  //                   final profilePictureUrl = mark['profile_picture'] ?? '';
  //                   final percentage = mark['percentage'];

  //                   return Card(
  //                     elevation: 4,
  //                     margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
  //                     child: ListTile(
  //                       leading: CircleAvatar(
  //                         backgroundImage: profilePictureUrl.isNotEmpty
  //                             ? NetworkImage(profilePictureUrl)
  //                             : null,
  //                         backgroundColor: Colors.grey,
  //                         radius: 30,
  //                         child: profilePictureUrl.isEmpty
  //                             ? Icon(Icons.person, color: Colors.white)
  //                             : null,
  //                       ),
  //                       title: Text(name),
  //                       subtitle: Text(
  //                         'Marks: $totalMarks\n',
  //                         style: TextStyle(fontSize: 16),
  //                       ),
  //                       trailing: _buildLiquidProgress(percentage),
  //                     ),
  //                   );
  //                 },
  //               ),
  //   );
  // }
@override
Widget build(BuildContext context) {
  // Group marks by UID and sum them
  Map<String, int> summedMarks = {};
  for (var mark in _halfYearlyMarks) {
    final uid = mark['uid'] ?? '';
    final marks = mark['marks'] as int;

    if (summedMarks.containsKey(uid)) {
      summedMarks[uid] = summedMarks[uid]! + marks; // Add marks if UID is the same
    } else {
      summedMarks[uid] = marks; // Initialize with the first marks entry
    }
  }

  // Prepare the data for display
  List<Map<String, dynamic>> groupedMarks = [];
  for (var uid in summedMarks.keys) {
    // Filter all marks with the same UID
    var userMarks = _halfYearlyMarks.where((mark) => mark['uid'] == uid).toList();
    var name = userMarks.isNotEmpty ? userMarks[0]['name'] : 'Unknown';
    var profilePictureUrl = userMarks.isNotEmpty ? userMarks[0]['profile_picture'] : '';
    var totalMarks = summedMarks[uid]!;
    var percentage = totalMarks / _maxHalfYearlyMarks;

    groupedMarks.add({
      'uid': uid,
      'name': name,
      'profile_picture': profilePictureUrl,
      'totalMarks': totalMarks,
      'percentage': percentage,
    });
  }

  return Scaffold(
    appBar: AppBar(
      title: Text('Half-Yearly Marks'),
      backgroundColor: Colors.blue, // Set AppBar color to blue
      actions: [
        IconButton(
          icon: Icon(Icons.download),
          onPressed: _halfYearlyMarks.isNotEmpty ? _downloadPDF : null,
        ),
      ],
    ),
    body: _isLoading
        ? Center(child: CircularProgressIndicator())
        : groupedMarks.isEmpty
            ? Center(
                child: Text(
                  'No marks found for the last six months.',
                  style: TextStyle(fontSize: 16),
                ),
              )
            : ListView.builder(
                itemCount: groupedMarks.length,
                itemBuilder: (context, index) {
                  final mark = groupedMarks[index];
                  final name = mark['name'] ?? 'Unknown';
                  final totalMarks = mark['totalMarks'] as int;
                  final profilePictureUrl = mark['profile_picture'] ?? '';
                  final percentage = mark['percentage'];

                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: profilePictureUrl.isNotEmpty
                            ? NetworkImage(profilePictureUrl)
                            : null,
                        backgroundColor: Colors.grey,
                        radius: 30,
                        child: profilePictureUrl.isEmpty
                            ? Icon(Icons.person, color: Colors.white)
                            : null,
                      ),
                      title: Text(name),
                      subtitle: Text(
                        'Marks: $totalMarks\n',
                        style: TextStyle(fontSize: 16),
                      ),
                      trailing: _buildLiquidProgress(percentage),
                    ),
                  );
                },
              ),
  );
}


}
