// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

// class YearlyMarksScreen extends StatefulWidget {
//   @override
//   _YearlyMarksScreenState createState() => _YearlyMarksScreenState();
// }

// class _YearlyMarksScreenState extends State<YearlyMarksScreen> {
//   final supabase = Supabase.instance.client;
//   bool _isLoading = true;
//   List<Map<String, dynamic>> _yearlyMarks = [];
//   final int _maxYearlyMarks = 5200; // Set maximum marks for yearly progress.

//   @override
//   void initState() {
//     super.initState();
//     _fetchYearlyMarks();
//   }

//   Future<void> _fetchYearlyMarks() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final today = DateTime.now();
//       final oneYearAgo = today.subtract(Duration(days: 365)); // Fetch data for the last year

//       // Fetch data from Supabase
//       final response = await supabase
//           .from('marks')
//           .select('name, marks, date, profile_picture')
//           .gte('date', oneYearAgo.toIso8601String())
//           .order('date', ascending: false);

//       if (response != null) {
//         setState(() {
//           _yearlyMarks = (response as List<dynamic>)
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
//         title: Text('Yearly Marks'),
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : _yearlyMarks.isEmpty
//               ? Center(
//                   child: Text(
//                     'No marks found for the last year.',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 )
//               : ListView.builder(
//                   itemCount: _yearlyMarks.length,
//                   itemBuilder: (context, index) {
//                     final mark = _yearlyMarks[index];
//                     final name = mark['name'] ?? 'Unknown';
//                     final marks = mark['marks'] as int;
//                     final date = mark['date'] ?? 'Unknown Date';
//                     final profilePictureUrl =
//                         mark['profile_picture'] ?? ''; // Profile picture URL
//                     final percentage = marks / _maxYearlyMarks;

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

// class YearlyMarksScreen extends StatefulWidget {
//   @override
//   _YearlyMarksScreenState createState() => _YearlyMarksScreenState();
// }

// class _YearlyMarksScreenState extends State<YearlyMarksScreen> {
//   final supabase = Supabase.instance.client;
//   bool _isLoading = true;
//   List<Map<String, dynamic>> _yearlyMarks = [];
//   final int _maxYearlyMarks = 5200; // Set maximum marks for yearly progress.
//   final String _uid;// Replace with the actual UID you're working with.

//   @override
//   void initState() {
//     super.initState();
//     _fetchYearlyMarks();
//   }

//   Future<void> _fetchYearlyMarks() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final today = DateTime.now();
//       final oneYearAgo = today.subtract(Duration(days: 365));

//       final response = await supabase
//           .from('marks')
//           .select('id, name, marks, date, profile_picture, uid')
//           .eq('uid', _uid) // Fetch marks for the same UID
//           .gte('date', oneYearAgo.toIso8601String())
//           .order('date', ascending: false);

//       if (response != null) {
//         setState(() {
//           _yearlyMarks = (response as List<dynamic>)
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

//   Future<void> _duplicateMarksForSameUid() async {
//     try {
//       // Duplicating marks for the same UID, with new IDs
//       for (var mark in _yearlyMarks) {
//         final markToInsert = {
//           'uid': mark['uid'],
//           'name': mark['name'],
//           'marks': mark['marks'],
//           'date': mark['date'],
//           'profile_picture': mark['profile_picture'],
//         };

//         final insertResponse = await supabase.from('marks').insert([markToInsert]);

//         if (insertResponse.error != null) {
//           throw Exception('Failed to insert duplicate mark: ${insertResponse.error!.message}');
//         }
//       }

//       // After duplication, you can refetch to get the latest data
//       _fetchYearlyMarks();
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error duplicating marks: ${e.toString()}'),
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
//         value: percentage.clamp(0.0, 1.0),
//         valueColor: AlwaysStoppedAnimation(Colors.blue.shade400),
//         backgroundColor: Colors.grey[200]!,
//         borderColor: Colors.blue.shade700,
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
//         title: Text('Yearly Marks'),
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.blue.shade700, Colors.blue.shade400],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.copy),
//             onPressed: _duplicateMarksForSameUid, // Add duplication functionality here
//           ),
//         ],
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : _yearlyMarks.isEmpty
//               ? Center(
//                   child: Text(
//                     'No marks found for the last year.',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 )
//               : ListView.builder(
//                   itemCount: _yearlyMarks.length,
//                   itemBuilder: (context, index) {
//                     final mark = _yearlyMarks[index];
//                     final name = mark['name'] ?? 'Unknown';
//                     final marks = mark['marks'] as int;
//                     final profilePictureUrl =
//                         mark['profile_picture'] ?? '';
//                     final percentage = marks / _maxYearlyMarks;

//                     return Container(
//                       margin:
//                           const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                       child: Card(
//                         elevation: 8,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                               colors: [Colors.blue.shade50, Colors.blue.shade100],
//                               begin: Alignment.topLeft,
//                               end: Alignment.bottomRight,
//                             ),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           padding: const EdgeInsets.all(12),
//                           child: Row(
//                             children: [
//                               CircleAvatar(
//                                 backgroundImage: profilePictureUrl.isNotEmpty
//                                     ? NetworkImage(profilePictureUrl)
//                                     : null,
//                                 backgroundColor: Colors.grey,
//                                 radius: 30,
//                                 child: profilePictureUrl.isEmpty
//                                     ? Icon(Icons.person, color: Colors.white)
//                                     : null,
//                               ),
//                               SizedBox(width: 12),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       name,
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     SizedBox(height: 4),
//                                     Text(
//                                       'Marks: $marks',
//                                       style: TextStyle(
//                                         fontSize: 14,
//                                         color: Colors.grey[600],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               _buildLiquidProgress(percentage),
//                             ],
//                           ),
//                         ),
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

// class YearlyMarksScreen extends StatefulWidget {
//   final String _uid; // UID to fetch data for a specific user

//   YearlyMarksScreen(this._uid);

//   @override
//   _YearlyMarksScreenState createState() => _YearlyMarksScreenState();
// }

// class _YearlyMarksScreenState extends State<YearlyMarksScreen> {
//   final supabase = Supabase.instance.client;
//   bool _isLoading = true;
//   List<Map<String, dynamic>> _yearlyMarks = [];
//   final int _maxYearlyMarks = 5200; // Set maximum marks for yearly progress.

//   @override
//   void initState() {
//     super.initState();
//     _fetchYearlyMarks();
//   }

//   Future<void> _fetchYearlyMarks() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final today = DateTime.now();
//       final oneYearAgo = today.subtract(Duration(days: 365));

//       // Fetch data from Supabase where the user ID matches the provided _uid
//       final response = await supabase
//           .from('marks')
//           .select('name, marks, date, profile_picture')
//           .eq('user_id', widget._uid) // Querying by UID
//           .gte('date', oneYearAgo.toIso8601String())
//           .order('date', ascending: false);

//       if (response != null) {
//         setState(() {
//           _yearlyMarks = (response as List<dynamic>)
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
//         value: percentage.clamp(0.0, 1.0),
//         valueColor: AlwaysStoppedAnimation(Colors.blue.shade400),
//         backgroundColor: Colors.grey[200]!,
//         borderColor: Colors.blue.shade700,
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
//         title: Text('Yearly Marks'),
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.blue.shade700, Colors.blue.shade400],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : _yearlyMarks.isEmpty
//               ? Center(
//                   child: Text(
//                     'No marks found for the last year.',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 )
//               : ListView.builder(
//                   itemCount: _yearlyMarks.length,
//                   itemBuilder: (context, index) {
//                     final mark = _yearlyMarks[index];
//                     final name = mark['name'] ?? 'Unknown';
//                     final marks = mark['marks'] as int;
//                     final profilePictureUrl =
//                         mark['profile_picture'] ?? '';
//                     final percentage = marks / _maxYearlyMarks;

//                     return Container(
//                       margin:
//                           const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                       child: Card(
//                         elevation: 8,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                               colors: [Colors.blue.shade50, Colors.blue.shade100],
//                               begin: Alignment.topLeft,
//                               end: Alignment.bottomRight,
//                             ),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           padding: const EdgeInsets.all(12),
//                           child: Row(
//                             children: [
//                               CircleAvatar(
//                                 backgroundImage: profilePictureUrl.isNotEmpty
//                                     ? NetworkImage(profilePictureUrl)
//                                     : null,
//                                 backgroundColor: Colors.grey,
//                                 radius: 30,
//                                 child: profilePictureUrl.isEmpty
//                                     ? Icon(Icons.person, color: Colors.white)
//                                     : null,
//                               ),
//                               SizedBox(width: 12),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       name,
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     SizedBox(height: 4),
//                                     Text(
//                                       'Marks: $marks',
//                                       style: TextStyle(
//                                         fontSize: 14,
//                                         color: Colors.grey[600],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               _buildLiquidProgress(percentage),
//                             ],
//                           ),
//                         ),
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

// class YearlyMarksScreen extends StatefulWidget {
//   @override
//   _YearlyMarksScreenState createState() => _YearlyMarksScreenState();
// }

// class _YearlyMarksScreenState extends State<YearlyMarksScreen> {
//   final supabase = Supabase.instance.client;
//   bool _isLoading = true;
//   List<Map<String, dynamic>> _yearlyMarks = [];
//   final int _maxYearlyMarks = 5200; // Set maximum marks for yearly progress.

//   @override
//   void initState() {
//     super.initState();
//     _fetchYearlyMarks();
//   }

//   Future<void> _fetchYearlyMarks() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final today = DateTime.now();
//       final oneYearAgo = today.subtract(Duration(days: 365));

//       final response = await supabase
//           .from('marks')
//           .select('name, marks, date, profile_picture,uid')
//           .gte('date', oneYearAgo.toIso8601String())
//           .order('date', ascending: false);

//       if (response != null) {
//         setState(() {
//           _yearlyMarks = (response as List<dynamic>)
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
//         value: percentage.clamp(0.0, 1.0),
//         valueColor: AlwaysStoppedAnimation(Colors.blue.shade400),
//         backgroundColor: Colors.grey[200]!,
//         borderColor: Colors.blue.shade700,
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
//   //       title: Text('Yearly Marks'),
//   //       flexibleSpace: Container(
//   //         decoration: BoxDecoration(
//   //           gradient: LinearGradient(
//   //             colors: [Colors.blue.shade700, Colors.blue.shade400],
//   //             begin: Alignment.topLeft,
//   //             end: Alignment.bottomRight,
//   //           ),
//   //         ),
//   //       ),
//   //     ),
//   //     body: _isLoading
//   //         ? Center(child: CircularProgressIndicator())
//   //         : _yearlyMarks.isEmpty
//   //             ? Center(
//   //                 child: Text(
//   //                   'No marks found for the last year.',
//   //                   style: TextStyle(fontSize: 16),
//   //                 ),
//   //               )
//   //             : ListView.builder(
//   //                 itemCount: _yearlyMarks.length,
//   //                 itemBuilder: (context, index) {
//   //                   final mark = _yearlyMarks[index];
//   //                   final name = mark['name'] ?? 'Unknown';
//   //                   final uid = mark['uid'] ?? '';
//   //                   final marks = mark['marks'] as int;
//   //                   final profilePictureUrl =
//   //                       mark['profile_picture'] ?? '';
//   //                   final percentage = marks / _maxYearlyMarks;

//   //                   return Container(
//   //                     margin:
//   //                         const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//   //                     child: Card(
//   //                       elevation: 8,
//   //                       shape: RoundedRectangleBorder(
//   //                         borderRadius: BorderRadius.circular(15),
//   //                       ),
//   //                       child: Container(
//   //                         decoration: BoxDecoration(
//   //                           gradient: LinearGradient(
//   //                             colors: [Colors.blue.shade50, Colors.blue.shade100],
//   //                             begin: Alignment.topLeft,
//   //                             end: Alignment.bottomRight,
//   //                           ),
//   //                           borderRadius: BorderRadius.circular(15),
//   //                         ),
//   //                         padding: const EdgeInsets.all(12),
//   //                         child: Row(
//   //                           children: [
//   //                             CircleAvatar(
//   //                               backgroundImage: profilePictureUrl.isNotEmpty
//   //                                   ? NetworkImage(profilePictureUrl)
//   //                                   : null,
//   //                               backgroundColor: Colors.grey,
//   //                               radius: 30,
//   //                               child: profilePictureUrl.isEmpty
//   //                                   ? Icon(Icons.person, color: Colors.white)
//   //                                   : null,
//   //                             ),
//   //                             SizedBox(width: 12),
//   //                             Expanded(
//   //                               child: Column(
//   //                                 crossAxisAlignment: CrossAxisAlignment.start,
//   //                                 children: [
//   //                                   Text(
//   //                                     name,
//   //                                     style: TextStyle(
//   //                                       fontSize: 16,
//   //                                       fontWeight: FontWeight.bold,
//   //                                     ),
//   //                                   ),
//   //                                   SizedBox(height: 4),
//   //                                   Text(
//   //                                     'Marks: $marks',
//   //                                     style: TextStyle(
//   //                                       fontSize: 14,
//   //                                       color: Colors.grey[600],
//   //                                     ),
//   //                                   ),
//   //                                 ],
//   //                               ),
//   //                             ),
//   //                             _buildLiquidProgress(percentage),
//   //                           ],
//   //                         ),
//   //                       ),
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
//   for (var mark in _yearlyMarks) {
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
//     var userMarks = _yearlyMarks.where((mark) => mark['uid'] == uid).toList();
//     var name = userMarks.isNotEmpty ? userMarks[0]['name'] : 'Unknown';
//     var profilePictureUrl = userMarks.isNotEmpty ? userMarks[0]['profile_picture'] : '';
//     var totalMarks = summedMarks[uid]!;
//     var percentage = totalMarks / _maxYearlyMarks;

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
//       title: Text('Yearly Marks'),
//       flexibleSpace: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.blue.shade700, Colors.blue.shade400],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//       ),
//     ),
//     body: _isLoading
//         ? Center(child: CircularProgressIndicator())
//         : groupedMarks.isEmpty
//             ? Center(
//                 child: Text(
//                   'No marks found for the last year.',
//                   style: TextStyle(fontSize: 16),
//                 ),
//               )
//             : ListView.builder(
//                 itemCount: groupedMarks.length,
//                 itemBuilder: (context, index) {
//                   final mark = groupedMarks[index];
//                   final name = mark['name'] ?? 'Unknown';
//                   final uid = mark['uid'] ?? '';
//                   final totalMarks = mark['totalMarks'] as int;
//                   final profilePictureUrl = mark['profile_picture'] ?? '';
//                   final percentage = mark['percentage'];

//                   return Container(
//                     margin:
//                         const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                     child: Card(
//                       elevation: 8,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: [Colors.blue.shade50, Colors.blue.shade100],
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                           ),
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         padding: const EdgeInsets.all(12),
//                         child: Row(
//                           children: [
//                             CircleAvatar(
//                               backgroundImage: profilePictureUrl.isNotEmpty
//                                   ? NetworkImage(profilePictureUrl)
//                                   : null,
//                               backgroundColor: Colors.grey,
//                               radius: 30,
//                               child: profilePictureUrl.isEmpty
//                                   ? Icon(Icons.person, color: Colors.white)
//                                   : null,
//                             ),
//                             SizedBox(width: 12),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     name,
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   SizedBox(height: 4),
//                                   Text(
//                                     'Marks: $totalMarks',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       color: Colors.grey[600],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             _buildLiquidProgress(percentage),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//   );
// }

// }
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class YearlyMarksScreen extends StatefulWidget {
  @override
  _YearlyMarksScreenState createState() => _YearlyMarksScreenState();
}

class _YearlyMarksScreenState extends State<YearlyMarksScreen> {
  final supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<Map<String, dynamic>> _yearlyMarks = [];
  final int _maxYearlyMarks = 5200;

  @override
  void initState() {
    super.initState();
    _fetchYearlyMarks();
  }

  Future<void> _fetchYearlyMarks() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final today = DateTime.now();
      final oneYearAgo = today.subtract(Duration(days: 365));

      final response = await supabase
          .from('marks')
          .select('name, marks, date, profile_picture,uid')
          .gte('date', oneYearAgo.toIso8601String())
          .order('date', ascending: false);

      if (response != null) {
        setState(() {
          _yearlyMarks = (response as List<dynamic>)
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

  // Future<void> _generateAndPrintPdf() async {
  //   final pdf = pw.Document();
  //   pdf.addPage(
  //     pw.Page(
  //       build: (pw.Context context) => pw.Column(
  //         children: [
  //           pw.Text('Yearly Marks', style: pw.TextStyle(fontSize: 24)),
  //           pw.Divider(),
  //           pw.Table.fromTextArray(
  //             context: context,
  //             data: [
  //               ['Name', 'Marks Obtained', 'Total Marks'],
  //               ..._yearlyMarks.map((mark) {
  //                 final name = mark['name'] ?? 'Unknown';
  //                 final marks = mark['marks'] as int;
  //                 return [name, marks.toString(), _maxYearlyMarks.toString()];
  //               }).toList(),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );

  //   // Save and download the PDF
  //   await Printing.sharePdf(
  //     bytes: await pdf.save(),
  //     filename: 'YearlyMarks.pdf',
  //   );
  // }
// Future<void> _generateAndPrintPdf() async {
//   final pdf = pw.Document();

//   // Group marks by UID and sum them
//   Map<String, int> summedMarks = {};
//   for (var mark in _yearlyMarks) {
//     final uid = mark['uid'] ?? '';
//     final marks = mark['marks'] as int;

//     if (summedMarks.containsKey(uid)) {
//       summedMarks[uid] = summedMarks[uid]! + marks;
//     } else {
//       summedMarks[uid] = marks;
//     }
//   }

//   // Prepare the data for the PDF
//   List<Map<String, dynamic>> groupedMarks = [];
//   for (var uid in summedMarks.keys) {
//     var userMarks = _yearlyMarks.where((mark) => mark['uid'] == uid).toList();
//     var name = userMarks.isNotEmpty ? userMarks[0]['name'] : 'Unknown';
//     var totalMarks = summedMarks[uid]!;

//     groupedMarks.add({'name': name, 'totalMarks': totalMarks});
//   }

//   pdf.addPage(
//     pw.Page(
//       build: (context) => pw.Column(
//         crossAxisAlignment: pw.CrossAxisAlignment.start,
//         children: [
//           pw.Text('Yearly Marks', style: pw.TextStyle(fontSize: 24)),
//           pw.Divider(),
//           pw.Table.fromTextArray(
//             headers: ['Name', 'Marks Obtained / Total Marks'],
//             data: groupedMarks.map((mark) {
//               return [
//                 mark['name'],
//                 '${mark['totalMarks']} / $_maxYearlyMarks'
//               ];
//             }).toList(),
//           ),
//         ],
//       ),
//     ),
//   );

//   try {
//     await Printing.sharePdf(
//       bytes: await pdf.save(),
//       filename: 'YearlyMarks.pdf',
//     );
//   } catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Failed to generate PDF: $e')),
//     );
//   }
// }
Future<void> _generateAndPrintPdf() async {
  final pdf = pw.Document();

  // Group marks by UID and sum them
  Map<String, int> summedMarks = {};
  for (var mark in _yearlyMarks) {
    final uid = mark['uid'] ?? '';
    final marks = mark['marks'] as int;

    if (summedMarks.containsKey(uid)) {
      summedMarks[uid] = summedMarks[uid]! + marks;
    } else {
      summedMarks[uid] = marks;
    }
  }

  // Prepare the data for the PDF
  List<Map<String, dynamic>> groupedMarks = [];
  for (var uid in summedMarks.keys) {
    var userMarks = _yearlyMarks.where((mark) => mark['uid'] == uid).toList();
    var name = userMarks.isNotEmpty ? userMarks[0]['name'] : 'Unknown';
    var totalMarks = summedMarks[uid]!;

    groupedMarks.add({'name': name, 'totalMarks': totalMarks});
  }

  // Sort the marks in descending order based on totalMarks
  groupedMarks.sort((a, b) => b['totalMarks'].compareTo(a['totalMarks']));

  // Add content to the PDF
  pdf.addPage(
    pw.Page(
      build: (context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'Yearly Marks',
            style: pw.TextStyle(
              fontSize: 24,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.Divider(),
          pw.Table.fromTextArray(
            headers: ['SN', 'Name', 'Total Marks'],
            data: List.generate(groupedMarks.length, (index) {
              final mark = groupedMarks[index];
              final sn = index + 1;  // Serial Number
              final name = mark['name'] ?? 'Unknown';
              final marks = mark['totalMarks'] ?? 0;
              return [sn.toString(), name, '$marks / $_maxYearlyMarks'];
            }),
          ),
        ],
      ),
    ),
  );

  try {
    await Printing.sharePdf(
      bytes: await pdf.save(),
      filename: 'YearlyMarks.pdf',
    );
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
        value: percentage.clamp(0.0, 1.0),
        valueColor: AlwaysStoppedAnimation(Colors.blue.shade400),
        backgroundColor: Colors.grey[200]!,
        borderColor: Colors.blue.shade700,
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
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Yearly Marks'),
  //       actions: [
  //         IconButton(
  //           icon: Icon(Icons.download),
  //           onPressed: _generateAndPrintPdf,
  //         ),
  //       ],
  //       flexibleSpace: Container(
  //         decoration: BoxDecoration(
  //           gradient: LinearGradient(
  //             colors: [Colors.blue.shade700, Colors.blue.shade400],
  //             begin: Alignment.topLeft,
  //             end: Alignment.bottomRight,
  //           ),
  //         ),
  //       ),
  //     ),
  //     body: _isLoading
  //         ? Center(child: CircularProgressIndicator())
  //         : _yearlyMarks.isEmpty
  //             ? Center(
  //                 child: Text(
  //                   'No marks found for the last year.',
  //                   style: TextStyle(fontSize: 16),
  //                 ),
  //               )
  //             : ListView.builder(
  //                 itemCount: _yearlyMarks.length,
  //                 itemBuilder: (context, index) {
  //                   final mark = _yearlyMarks[index];
  //                   final name = mark['name'] ?? 'Unknown';
  //                   final marks = mark['marks'] as int;
  //                   final profilePictureUrl =
  //                       mark['profile_picture'] ?? '';
  //                   final percentage = marks / _maxYearlyMarks;

  //                   return Container(
  //                     margin: const EdgeInsets.symmetric(
  //                         vertical: 8, horizontal: 16),
  //                     child: Card(
  //                       elevation: 8,
  //                       shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(15),
  //                       ),
  //                       child: Container(
  //                         decoration: BoxDecoration(
  //                           gradient: LinearGradient(
  //                             colors: [
  //                               Colors.blue.shade50,
  //                               Colors.blue.shade100
  //                             ],
  //                             begin: Alignment.topLeft,
  //                             end: Alignment.bottomRight,
  //                           ),
  //                           borderRadius: BorderRadius.circular(15),
  //                         ),
  //                         padding: const EdgeInsets.all(12),
  //                         child: Row(
  //                           children: [
  //                             CircleAvatar(
  //                               backgroundImage: profilePictureUrl.isNotEmpty
  //                                   ? NetworkImage(profilePictureUrl)
  //                                   : null,
  //                               backgroundColor: Colors.grey,
  //                               radius: 30,
  //                               child: profilePictureUrl.isEmpty
  //                                   ? Icon(Icons.person, color: Colors.white)
  //                                   : null,
  //                             ),
  //                             SizedBox(width: 12),
  //                             Expanded(
  //                               child: Column(
  //                                 crossAxisAlignment: CrossAxisAlignment.start,
  //                                 children: [
  //                                   Text(
  //                                     name,
  //                                     style: TextStyle(
  //                                       fontSize: 16,
  //                                       fontWeight: FontWeight.bold,
  //                                     ),
  //                                   ),
  //                                   SizedBox(height: 4),
  //                                   Text(
  //                                     'Marks: $marks',
  //                                     style: TextStyle(
  //                                       fontSize: 14,
  //                                       color: Colors.grey[600],
  //                                     ),
  //                                   ),
  //                                 ],
  //                               ),
  //                             ),
  //                             _buildLiquidProgress(percentage),
  //                           ],
  //                         ),
  //                       ),
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
  for (var mark in _yearlyMarks) {
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
    var userMarks = _yearlyMarks.where((mark) => mark['uid'] == uid).toList();
    var name = userMarks.isNotEmpty ? userMarks[0]['name'] : 'Unknown';
    var profilePictureUrl = userMarks.isNotEmpty ? userMarks[0]['profile_picture'] : '';
    var totalMarks = summedMarks[uid]!;
    var percentage = totalMarks / _maxYearlyMarks;

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
      title: Text('Yearly Marks'),
      backgroundColor: Colors.blueAccent,
      actions: [
        IconButton(
          icon: Icon(Icons.download),
          onPressed: _generateAndPrintPdf,
        ),
      ],
    ),
    body: _isLoading
        ? Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
            ),
          )
        : groupedMarks.isEmpty
            ? Center(
                child: Text(
                  'No marks found for the year.',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              )
            : ListView.builder(
                itemCount: groupedMarks.length,
                padding: const EdgeInsets.all(8.0),
                itemBuilder: (context, index) {
                  final mark = groupedMarks[index];
                  final name = mark['name'] ?? 'Unknown';
                  final totalMarks = mark['totalMarks'] as int;
                  final profilePictureUrl = mark['profile_picture'] ?? '';
                  final percentage = mark['percentage'];

                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: profilePictureUrl.isNotEmpty
                            ? NetworkImage(profilePictureUrl)
                            : null,
                        backgroundColor: Colors.blue.shade100,
                        radius: 30,
                        child: profilePictureUrl.isEmpty
                            ? Icon(Icons.person, color: Colors.blue)
                            : null,
                      ),
                      title: Text(
                        name,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        'Marks: $totalMarks',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      trailing: _buildLiquidProgress(percentage),
                    ),
                  );
                },
              ),
  );
}
}
