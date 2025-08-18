// import 'package:flutter/material.dart';
// import 'marks_display_screen.dart';

// class WeeklyMarksScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MarksDisplayScreen(period: 'weekly');
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class WeeklyMarksScreen extends StatefulWidget {
//   @override
//   _WeeklyMarksScreenState createState() => _WeeklyMarksScreenState();
// }

// class _WeeklyMarksScreenState extends State<WeeklyMarksScreen> {
//   final supabase = Supabase.instance.client;
//   bool _isLoading = true;
//   List<Map<String, dynamic>> _weeklyMarks = [];

//   @override
//   void initState() {
//     super.initState();
//     _fetchWeeklyMarks();
//   }

//   Future<void> _fetchWeeklyMarks() async {
//     setState(() {
//       _isLoading = true;
//     });

//           final today = DateTime.now();
//       final oneWeekAgo = today.subtract(Duration(days: 7)).toIso8601String();

//       final response = await supabase
//           .from('marks')
//           .select('marks, date, users(profile_picture, name)')
//           .gte('date', oneWeekAgo) // Get marks from the last 7 days
// ;

    

      
//         setState(() {
//           _weeklyMarks = List<Map<String, dynamic>>.from(response);
//           _isLoading = false;
//         });
      
    
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Weekly Marks'),
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : _weeklyMarks.isEmpty
//               ? Center(
//                   child: Text(
//                     'No marks found for this week.',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 )
//               : ListView.builder(
//                   itemCount: _weeklyMarks.length,
//                   itemBuilder: (context, index) {
//                     final mark = _weeklyMarks[index];
//                     final user = mark['users'];

//                     return ListTile(
//                       leading: CircleAvatar(
//                         backgroundImage: NetworkImage(user['profile_picture']),
//                       ),
//                       title: Text(user['name']),
//                       trailing: Text(
//                         '${mark['marks']}',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.blue,
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

// class WeeklyMarksScreen extends StatefulWidget {
//   @override
//   _WeeklyMarksScreenState createState() => _WeeklyMarksScreenState();
// }

// class _WeeklyMarksScreenState extends State<WeeklyMarksScreen> {
//   final supabase = Supabase.instance.client;
//   bool _isLoading = true;
//   List<Map<String, dynamic>> _weeklyMarks = [];
//   final int _maxWeeklyMarks = 700; // Set maximum marks for weekly progress.

//   @override
//   void initState() {
//     super.initState();
//     _fetchWeeklyMarks();
//   }

//   Future<void> _fetchWeeklyMarks() async {
//     setState(() {
//       _isLoading = false;
//     });

 
//       final today = DateTime.now();
//       final oneWeekAgo = today.subtract(Duration(days: 7)).toIso8601String();

//       final response = await supabase
//           .from('marks')
//           .select('marks, date, users(profile_picture, name)')
//           .gte('date', oneWeekAgo) // Get marks from the last 7 days
//           ;

   
//         setState(() {
//           _weeklyMarks = List<Map<String, dynamic>>.from(response);
//           _isLoading = false;
//         });
//       }
    
  

//   Widget _buildLiquidProgress(double percentage) {
//     return SizedBox(
//       width: 50,
//       height: 50,
//       child: LiquidCircularProgressIndicator(
//         value: percentage.clamp(0.0, 1.0), // Ensure the value is within 0.0 - 1.0
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
//         title: Text('Weekly Marks'),
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : _weeklyMarks.isEmpty
//               ? Center(
//                   child: Text(
//                     'No marks found for this week.',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 )
//               : ListView.builder(
//                   itemCount: _weeklyMarks.length,
//                   itemBuilder: (context, index) {
//                     final mark = _weeklyMarks[index];
//                     final user = mark['users'];
//                     final marks = mark['marks'] as int;
//                     final percentage = marks / _maxWeeklyMarks;

//                     return Card(
//                       elevation: 4,
//                       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                       child: ListTile(
//                         leading: CircleAvatar(
//                           backgroundImage: NetworkImage(user['profile_picture']),
//                         ),
//                         title: Text(user['name']),
//                         subtitle: Text(
//                           'Marks: $marks',
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

// class WeeklyMarksScreen extends StatefulWidget {
//   @override
//   _WeeklyMarksScreenState createState() => _WeeklyMarksScreenState();
// }

// class _WeeklyMarksScreenState extends State<WeeklyMarksScreen> {
//   final supabase = Supabase.instance.client;
//   bool _isLoading = true;
//   List<Map<String, dynamic>> _weeklyMarks = [];
//   final int _maxWeeklyMarks = 700; // Set maximum marks for weekly progress.

//   @override
//   void initState() {
//     super.initState();
//     _fetchWeeklyMarks();
//   }

// //   Future<void> _fetchWeeklyMarks() async {
// //     setState(() {
// //       _isLoading = true;
// //     });

// //     try {
// //       final today = DateTime.now();
// //       final oneWeekAgo = today.subtract(Duration(days: 7));

// //       // Fetching data using updated supabase methods
// //       // final response = await supabase
// //       //     .from('marks')
// //       //     .select('marks, date, users(profile_picture, name)')
// //       //     .gte('date', oneWeekAgo.toIso8601String())
// //       //     .order('date', ascending: false); // Ensure data is ordered by date
// // final response = await supabase
// //     .from('marks')
// //     .select('marks, date, users!inner(profile_picture, name)')
// //     .gte('date', oneWeekAgo.toIso8601String())
// //     .order('date', ascending: false)
// //    ;

// //       // Check if the response is successful
// //       if (response is PostgrestResponse && response == 200) {
// //         final List<dynamic> data = response as List<dynamic>;

// //         setState(() {
// //           _weeklyMarks = data.map((e) => e as Map<String, dynamic>).toList();
// //           _isLoading = false;
// //         });
// //       } else {
// //         throw Exception('Error fetching marks: ${response ?? 'Unknown error'}');
// //       }
// //     } catch (e) {
// //       setState(() {
// //         _isLoading = false;
// //       });
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('Error fetching marks: ${e.toString()}')),
// //       );
// //     }
// //   }
// Future<void> _fetchWeeklyMarks() async {
//   setState(() {
//     _isLoading = true;
//   });

//   try {
//     final today = DateTime.now();
//     final oneWeekAgo = today.subtract(Duration(days: 7));

//     // Fetching data using Supabase methods
//     final response = await supabase
//         .from('marks')
//         .select('marks, date, users(profile_picture, name)')
//         .eq('marks.uid', 'users.id') // Explicitly match uid with id
//         .gte('date', oneWeekAgo.toIso8601String())
//         .order('date', ascending: false)
//        ;

//     if (response != null) {
//       throw Exception('Error fetching marks: ${response}');
//     }

//     final List<dynamic> data = response;

//     setState(() {
//       _weeklyMarks = data.map((e) => e as Map<String, dynamic>).toList();
//       _isLoading = false;
//     });
//   } catch (e) {
//     setState(() {
//       _isLoading = false;
//     });
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Error fetching marks: ${e.toString()}')),
//     );
//   }
// }

//   Widget _buildLiquidProgress(double percentage) {
//     return SizedBox(
//       width: 50,
//       height: 50,
//       child: LiquidCircularProgressIndicator(
//         value: percentage.clamp(0.0, 1.0), // Ensure the value is within 0.0 - 1.0
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
//         title: Text('Weekly Marks'),
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : _weeklyMarks.isEmpty
//               ? Center(
//                   child: Text(
//                     'No marks found for this week.',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 )
//               : ListView.builder(
//                   itemCount: _weeklyMarks.length,
//                   itemBuilder: (context, index) {
//                     final mark = _weeklyMarks[index];
//                     final user = mark['users'];
//                     final marks = mark['marks'] as int;
//                     final percentage = marks / _maxWeeklyMarks;

//                     return Card(
//                       elevation: 4,
//                       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                       child: ListTile(
//                         leading: CircleAvatar(
//                           backgroundImage: NetworkImage(user['profile_picture']),
//                         ),
//                         title: Text(user['name']),
//                         subtitle: Text(
//                           'Marks: $marks',
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

// class WeeklyMarksScreen extends StatefulWidget {
//   @override
//   _WeeklyMarksScreenState createState() => _WeeklyMarksScreenState();
// }

// class _WeeklyMarksScreenState extends State<WeeklyMarksScreen> {
//   final supabase = Supabase.instance.client;
//   bool _isLoading = true;
//   List<Map<String, dynamic>> _weeklyMarks = [];
//   final int _maxWeeklyMarks = 700; // Set maximum marks for weekly progress.

//   @override
//   void initState() {
//     super.initState();
//     _fetchWeeklyMarks();
//   }

//   Future<void> _fetchWeeklyMarks() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final today = DateTime.now();
//       final oneWeekAgo = today.subtract(Duration(days: 7));

//       // Fetching data using Supabase methods with inner join between marks and users
//       final response = await supabase
//           .from('marks')
//           .select('marks, date, users!inner(profile_picture, name)')
//           .gte('date', oneWeekAgo.toIso8601String())
//           .order('date', ascending: false);

//       // Check if response contains data
//       if (response is PostgrestResponse && response == 200) {
//         final List<dynamic> data = response;
        
//         setState(() {
//           _weeklyMarks = data.map((e) => e as Map<String, dynamic>).toList();
//           _isLoading = false;
//         });
//       } else {
//         throw Exception('Error fetching marks: ${response ?? 'Unknown error'}');
//       }
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error fetching marks: ${e.toString()}')),
//       );
//     }
//   }

//   Widget _buildLiquidProgress(double percentage) {
//     return SizedBox(
//       width: 50,
//       height: 50,
//       child: LiquidCircularProgressIndicator(
//         value: percentage.clamp(0.0, 1.0), // Ensure the value is within 0.0 - 1.0
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
//         title: Text('Weekly Marks'),
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : _weeklyMarks.isEmpty
//               ? Center(
//                   child: Text(
//                     'No marks found for this week.',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 )
//               : ListView.builder(
//                   itemCount: _weeklyMarks.length,
//                   itemBuilder: (context, index) {
//                     final mark = _weeklyMarks[index];
//                     final user = mark['users'];
//                     final marks = mark['marks'] as int;
//                     final percentage = marks / _maxWeeklyMarks;

//                     return Card(
//                       elevation: 4,
//                       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                       child: ListTile(
//                         leading: CircleAvatar(
//                           backgroundImage: NetworkImage(user['profile_picture']),
//                         ),
//                         title: Text(user['name']),
//                         subtitle: Text(
//                           'Marks: $marks',
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

// class WeeklyMarksScreen extends StatefulWidget {
//   @override
//   _WeeklyMarksScreenState createState() => _WeeklyMarksScreenState();
// }

// class _WeeklyMarksScreenState extends State<WeeklyMarksScreen> {
//   final supabase = Supabase.instance.client;
//   bool _isLoading = true;
//   List<Map<String, dynamic>> _weeklyMarks = [];
//   final int _maxWeeklyMarks = 700; // Set maximum marks for weekly progress.

//   @override
//   void initState() {
//     super.initState();
//     _fetchWeeklyMarks();
//   }

//   Future<void> _fetchWeeklyMarks() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final today = DateTime.now();
//       final oneWeekAgo = today.subtract(Duration(days: 7));

//       // Fetching data using Supabase methods with inner join between marks and users
//       final response = await supabase
//           .from('marks')
//           .select('marks, date, users(profile_picture, first_name, last_name)') // Fetch first_name and last_name
//           .gte('date', oneWeekAgo.toIso8601String())
//           .order('date', ascending: false);

//       // Check if response contains data
//       if (response is PostgrestResponse && response == 200) {
//         final List<dynamic> data = response;

//         setState(() {
//           _weeklyMarks = data.map((e) => e as Map<String, dynamic>).toList();
//           _isLoading = false;
//         });
//       } else {
//         throw Exception('Error fetching marks: ${response ?? 'Unknown error'}');
//       }
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error fetching marks: ${e.toString()}')),
//       );
//     }
//   }

//   Widget _buildLiquidProgress(double percentage) {
//     return SizedBox(
//       width: 50,
//       height: 50,
//       child: LiquidCircularProgressIndicator(
//         value: percentage.clamp(0.0, 1.0), // Ensure the value is within 0.0 - 1.0
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
//         title: Text('Weekly Marks'),
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : _weeklyMarks.isEmpty
//               ? Center(
//                   child: Text(
//                     'No marks found for this week.',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 )
//               : ListView.builder(
//                   itemCount: _weeklyMarks.length,
//                   itemBuilder: (context, index) {
//                     final mark = _weeklyMarks[index];
//                     final user = mark['users'];
//                     final marks = mark['marks'] as int;
//                     final percentage = marks / _maxWeeklyMarks;

//                     // Check if user data is available
//                     final fullName = user != null
//                         ? '${user['first_name']} ${user['last_name']}'
//                         : 'No user data';
//                     final profilePictureUrl =
//                         user?['profile_picture'] ?? '';

//                     return Card(
//                       elevation: 4,
//                       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                       child: ListTile(
//                         leading: CircleAvatar(
//                           backgroundImage: profilePictureUrl.isNotEmpty
//                               ? NetworkImage(profilePictureUrl)
//                               : AssetImage('assets/default_profile_picture.png') as ImageProvider,
//                         ),
//                         title: Text(fullName), // Display full name or default text
//                         subtitle: Text(
//                           'Marks: $marks',
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

// class WeeklyMarksScreen extends StatefulWidget {
//   @override
//   _WeeklyMarksScreenState createState() => _WeeklyMarksScreenState();
// }

// class _WeeklyMarksScreenState extends State<WeeklyMarksScreen> {
//   final supabase = Supabase.instance.client;
//   bool _isLoading = true;
//   List<Map<String, dynamic>> _weeklyMarks = [];
//   final int _maxWeeklyMarks = 700; // Set maximum marks for weekly progress.

//   @override
//   void initState() {
//     super.initState();
//     _fetchWeeklyMarks();
//   }

//   Future<void> _fetchWeeklyMarks() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final today = DateTime.now();
//       final oneWeekAgo = today.subtract(Duration(days: 7));

//       // Fetch data using Supabase with inner join
//       final response = await supabase
//           .from('marks')
//           .select('marks, date, users(profile_picture, first_name, last_name)')
//           .gte('date', oneWeekAgo.toIso8601String())
//           .order('date', ascending: false)
//        ;

//       if (response == null && response != null) {
//         final List<dynamic> data = response;
//         setState(() {
//           _weeklyMarks = data.map((e) => e as Map<String, dynamic>).toList();
//           _isLoading = false;
//         });
//       } else {
//         throw Exception(response);
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
//         title: Text('Weekly Marks'),
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : _weeklyMarks.isEmpty
//               ? Center(
//                   child: Text(
//                     'No marks found for this week.',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 )
//               : ListView.builder(
//                   itemCount: _weeklyMarks.length,
//                   itemBuilder: (context, index) {
//                     final mark = _weeklyMarks[index];
//                     final user = mark['users'];
//                     final marks = mark['marks'] as int;
//                     final percentage = marks / _maxWeeklyMarks;

//                     // Check if user data is available
//                     final fullName = user != null
//                         ? '${user['first_name'] ?? 'Unknown'} ${user['last_name'] ?? 'Unknown'}'
//                         : 'No user data';
//                     final profilePictureUrl =
//                         user?['profile_picture'] ?? '';

//                     return Card(
//                       elevation: 4,
//                       margin: const EdgeInsets.symmetric(
//                           vertical: 8, horizontal: 16),
//                       child: ListTile(
//                         leading: CircleAvatar(
//                           backgroundImage: profilePictureUrl.isNotEmpty
//                               ? NetworkImage(profilePictureUrl)
//                               : AssetImage(
//                                   'assets/default_profile_picture.png') as ImageProvider,
//                         ),
//                         title: Text(fullName), // Display full name or default text
//                         subtitle: Text(
//                           'Marks: $marks',
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

// class WeeklyMarksScreen extends StatefulWidget {
//   @override
//   _WeeklyMarksScreenState createState() => _WeeklyMarksScreenState();
// }

// class _WeeklyMarksScreenState extends State<WeeklyMarksScreen> {
//   final supabase = Supabase.instance.client;
//   bool _isLoading = true;
//   List<Map<String, dynamic>> _weeklyMarks = [];
//   final int _maxWeeklyMarks = 700; // Set maximum marks for weekly progress.

//   @override
//   void initState() {
//     super.initState();
//     _fetchWeeklyMarks();
//   }

//   Future<void> _fetchWeeklyMarks() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final today = DateTime.now();
//       final oneWeekAgo = today.subtract(Duration(days: 7));

//       // Fetch data using Supabase with inner join
//       final response = await supabase
//           .from('marks')
//           .select('marks, date, users(profile_picture, first_name, last_name)')
//           .gte('date', oneWeekAgo.toIso8601String())
//           .order('date', ascending: false)
//           ;

//       if (response == null && response!= null) {
//         setState(() {
//           _weeklyMarks = (response as List<dynamic>)
//               .map((e) => e as Map<String, dynamic>)
//               .toList();
//           _isLoading = false;
//         });
//       } else {
//         throw Exception(response?? 'Unknown error occurred');
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
//         title: Text('Weekly Marks'),
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : _weeklyMarks.isEmpty
//               ? Center(
//                   child: Text(
//                     'No marks found for this week.',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 )
//               : ListView.builder(
//                   itemCount: _weeklyMarks.length,
//                   itemBuilder: (context, index) {
//                     final mark = _weeklyMarks[index];
//                     final user = mark['users'];
//                     final marks = mark['marks'] as int;
//                     final percentage = marks / _maxWeeklyMarks;

//                     // Check if user data is available
//                     final fullName = user != null
//                         ? '${user['first_name'] ?? 'Unknown'} ${user['last_name'] ?? 'Unknown'}'
//                         : 'No user data';
//                     final profilePictureUrl =
//                         user?['profile_picture'] ?? '';

//                     return Card(
//                       elevation: 4,
//                       margin: const EdgeInsets.symmetric(
//                           vertical: 8, horizontal: 16),
//                       child: ListTile(
//                         leading: CircleAvatar(
//                           backgroundImage: profilePictureUrl.isNotEmpty
//                               ? NetworkImage(profilePictureUrl)
//                               : AssetImage(
//                                   'assets/default_profile_picture.png') as ImageProvider,
//                         ),
//                         title: Text(fullName), // Display full name or default text
//                         subtitle: Text(
//                           'Marks: $marks',
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

// class WeeklyMarksScreen extends StatefulWidget {
//   @override
//   _WeeklyMarksScreenState createState() => _WeeklyMarksScreenState();
// }

// class _WeeklyMarksScreenState extends State<WeeklyMarksScreen> {
//   final supabase = Supabase.instance.client;
//   bool _isLoading = true;
//   List<Map<String, dynamic>> _weeklyMarks = [];
//   final int _maxWeeklyMarks = 100; // Set maximum marks for weekly progress.

//   @override
//   void initState() {
//     super.initState();
//     _fetchWeeklyMarks();
//   }

//   Future<void> _fetchWeeklyMarks() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final today = DateTime.now();
//       final oneWeekAgo = today.subtract(Duration(days: 7));

//       // Fetch data from Supabase
//       final response = await supabase
//           .from('marks')
//           .select('name, marks, date')
//           .gte('date', oneWeekAgo.toIso8601String())
//           .order('date', ascending: false);

//       if (response != null) {
//         setState(() {
//           _weeklyMarks = (response as List<dynamic>)
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
//         valueColor: AlwaysStoppedAnimation(const Color.fromARGB(255, 243, 212, 33)),
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
//         title: Text('Weekly Marks'),
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : _weeklyMarks.isEmpty
//               ? Center(
//                   child: Text(
//                     'No marks found for this week.',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 )
//               : ListView.builder(
//                   itemCount: _weeklyMarks.length,
//                   itemBuilder: (context, index) {
//                     final mark = _weeklyMarks[index];
//                     final name = mark['name'] ?? 'Unknown';
//                     final marks = mark['marks'] as int;
//                     final date = mark['date'] ?? 'Unknown Date';
//                     final percentage = marks / _maxWeeklyMarks;

//                     return Card(
//                       elevation: 4,
//                       margin: const EdgeInsets.symmetric(
//                           vertical: 8, horizontal: 16),
//                       child: ListTile(
//                         title: Text(name),
//                         subtitle: Text(
//                           'Marks: $marks',
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

// class WeeklyMarksScreen extends StatefulWidget {
//   @override
//   _WeeklyMarksScreenState createState() => _WeeklyMarksScreenState();
// }

// class _WeeklyMarksScreenState extends State<WeeklyMarksScreen> {
//   final supabase = Supabase.instance.client;
//   bool _isLoading = true;
//   List<Map<String, dynamic>> _weeklyMarks = [];
//   final int _maxWeeklyMarks = 100; // Set maximum marks for weekly progress.

//   @override
//   void initState() {
//     super.initState();
//     _fetchWeeklyMarks();
//   }

//   Future<void> _fetchWeeklyMarks() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final today = DateTime.now();
//       final oneWeekAgo = today.subtract(Duration(days: 7));

//       // Fetch data from Supabase
//       final response = await supabase
//           .from('marks')
//           .select('name, marks, date, profile_picture')
//           .gte('date', oneWeekAgo.toIso8601String())
//           .order('date', ascending: false);

//       if (response != null) {
//         setState(() {
//           _weeklyMarks = (response as List<dynamic>)
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
//         title: Text('Weekly Marks'),
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : _weeklyMarks.isEmpty
//               ? Center(
//                   child: Text(
//                     'No marks found for this week.',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 )
//               : ListView.builder(
//                   itemCount: _weeklyMarks.length,
//                   itemBuilder: (context, index) {
//                     final mark = _weeklyMarks[index];
//                     final name = mark['name'] ?? 'Unknown';
//                     final marks = mark['marks'] as int;
//                     final date = mark['date'] ?? 'Unknown Date';
//                     final profilePictureUrl =
//                         mark['profile_picture'] ?? ''; // Profile picture URL
//                     final percentage = marks / _maxWeeklyMarks;

//                     return Card(
//                       elevation: 4,
//                       margin: const EdgeInsets.symmetric(
//                           vertical: 8, horizontal: 16),
//                       child: ListTile(
//                         leading: CircleAvatar(
//   backgroundImage: profilePictureUrl.isNotEmpty
//       ? NetworkImage(profilePictureUrl)
//       : null,
//   backgroundColor: Colors.grey,
//   radius: 30, // Increased the radius for a bigger image
//   child: profilePictureUrl.isEmpty
//       ? Icon(Icons.person, color: Colors.white)
//       : null,
// ),

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

// class WeeklyMarksScreen extends StatefulWidget {
//   @override
//   _WeeklyMarksScreenState createState() => _WeeklyMarksScreenState();
// }

// class _WeeklyMarksScreenState extends State<WeeklyMarksScreen> {
//   final supabase = Supabase.instance.client;
//   bool _isLoading = true;
//   List<Map<String, dynamic>> _weeklyMarks = [];
//   final int _maxWeeklyMarks = 100; // Set maximum marks for weekly progress.

//   @override
//   void initState() {
//     super.initState();
//     _fetchWeeklyMarks();
//   }

//   Future<void> _fetchWeeklyMarks() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final today = DateTime.now();
//       final oneWeekAgo = today.subtract(Duration(days: 7));

//       final response = await supabase
//           .from('marks')
//           .select('name, marks, date,uid, profile_picture')
//           .gte('date', oneWeekAgo.toIso8601String())
//           .order('date', ascending: false);

//       if (response != null) {
//         setState(() {
//           _weeklyMarks = (response as List<dynamic>)
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

//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       title: Text('Weekly Marks'),
//   //     ),
//   //     body: _isLoading
//   //         ? Center(child: CircularProgressIndicator())
//   //         : _weeklyMarks.isEmpty
//   //             ? Center(
//   //                 child: Text(
//   //                   'No marks found for this week.',
//   //                   style: TextStyle(fontSize: 16),
//   //                 ),
//   //               )
//   //             : ListView.builder(
//   //                 itemCount: _weeklyMarks.length,
//   //                 itemBuilder: (context, index) {
//   //                   final mark = _weeklyMarks[index];
//   //                   final name = mark['name'] ?? 'Unknown';
//   //                   final marks = mark['marks'] as int;
//   //                   final date = mark['date'] ?? 'Unknown Date';
//   //                   final profilePictureUrl =
//   //                       mark['profile_picture'] ?? ''; // Profile picture URL
//   //                   final percentage = marks / _maxWeeklyMarks;

//   //                   return Card(
//   //                     elevation: 4,
//   //                     shape: RoundedRectangleBorder(
//   //                       borderRadius: BorderRadius.circular(16),
//   //                     ),
//   //                     margin: const EdgeInsets.symmetric(
//   //                         vertical: 8, horizontal: 16),
//   //                     child: ListTile(
//   //                       leading: CircleAvatar(
//   //                         backgroundImage: profilePictureUrl.isNotEmpty
//   //                             ? NetworkImage(profilePictureUrl)
//   //                             : null,
//   //                         backgroundColor: Colors.grey,
//   //                         radius: 30, // Increased the radius for a bigger image
//   //                         child: profilePictureUrl.isEmpty
//   //                             ? Icon(Icons.person, color: Colors.white)
//   //                             : null,
//   //                       ),
//   //                       title: Text(
//   //                         name,
//   //                         style: TextStyle(
//   //                           fontSize: 18,
//   //                           fontWeight: FontWeight.bold,
//   //                         ),
//   //                       ),
//   //                       subtitle: Text(
//   //                         'Marks: $marks',
//   //                         style: TextStyle(fontSize: 14, color: Colors.grey[600]),
//   //                       ),
//   //                       trailing: _buildLiquidProgress(percentage),
//   //                     ),
//   //                   );
//   //                 },
//   //               ),
//   //   );
//   // }
// // @override
// // Widget build(BuildContext context) {
// //   // Group marks by UID and sum them
// //   Map<String, int> summedMarks = {};
// //   for (var mark in _weeklyMarks) {
// //     final uid = mark['uid'] ?? '';
// //     final marks = mark['marks'] as int;

// //     if (summedMarks.containsKey(uid)) {
// //       summedMarks[uid] = summedMarks[uid]! + marks; // Add marks if UID is the same
// //     } else {
// //       summedMarks[uid] = marks; // Initialize with the first marks entry
// //     }
// //   }

// //   // Prepare the data for display
// //   List<Map<String, dynamic>> groupedMarks = [];
// //   for (var uid in summedMarks.keys) {
// //     // Filter all marks with the same UID
// //     var userMarks = _weeklyMarks.where((mark) => mark['uid'] == uid).toList();
// //     var name = userMarks.isNotEmpty ? userMarks[0]['name'] : 'Unknown';
// //     var profilePictureUrl = userMarks.isNotEmpty ? userMarks[0]['profile_picture'] : '';
// //     var totalMarks = summedMarks[uid]!;
// //     var percentage = totalMarks / _maxWeeklyMarks;

// //     groupedMarks.add({
// //       'uid': uid,
// //       'name': name,
// //       'profile_picture': profilePictureUrl,
// //       'totalMarks': totalMarks,
// //       'percentage': percentage,
// //     });
// //   }

// //   return Scaffold(
// //     appBar: AppBar(
// //       title: Text('Weekly Marks'),
      
// //     ),
// //     body: _isLoading
// //         ? Center(child: CircularProgressIndicator())
// //         : groupedMarks.isEmpty
// //             ? Center(
// //                 child: Text(
// //                   'No marks found for this week.',
// //                   style: TextStyle(fontSize: 16),
// //                 ),
// //               )
// //             : ListView.builder(
// //                 itemCount: groupedMarks.length,
// //                 itemBuilder: (context, index) {
// //                   final mark = groupedMarks[index];
// //                   final name = mark['name'] ?? 'Unknown';
// //                   final uid = mark['uid'] ?? '';
// //                   final totalMarks = mark['totalMarks'] as int;
// //                   final profilePictureUrl = mark['profile_picture'] ?? '';
// //                   final percentage = mark['percentage'];

// //                   return Card(
// //                     elevation: 4,
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(16),
// //                     ),
// //                     margin: const EdgeInsets.symmetric(
// //                         vertical: 8, horizontal: 16),
// //                     child: ListTile(
// //                       leading: CircleAvatar(
// //                         backgroundImage: profilePictureUrl.isNotEmpty
// //                             ? NetworkImage(profilePictureUrl)
// //                             : null,
// //                         backgroundColor: Colors.grey,
// //                         radius: 30, // Increased the radius for a bigger image
// //                         child: profilePictureUrl.isEmpty
// //                             ? Icon(Icons.person, color: Colors.white)
// //                             : null,
// //                       ),
// //                       title: Text(
// //                         name,
// //                         style: TextStyle(
// //                           fontSize: 18,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                       subtitle: Text(
// //                         'Marks: $totalMarks',
// //                         style: TextStyle(fontSize: 14, color: Colors.grey[600]),
// //                       ),
// //                       trailing: _buildLiquidProgress(percentage),
// //                     ),
// //                   );
// //                 },
// //               ),
// //   );
// // }
// @override
// Widget build(BuildContext context) {
//   // Group marks by UID and sum them
//   Map<String, int> summedMarks = {};
//   for (var mark in _weeklyMarks) {
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
//     var userMarks = _weeklyMarks.where((mark) => mark['uid'] == uid).toList();
//     var name = userMarks.isNotEmpty ? userMarks[0]['name'] : 'Unknown';
//     var profilePictureUrl = userMarks.isNotEmpty ? userMarks[0]['profile_picture'] : '';
//     var totalMarks = summedMarks[uid]!;

//     var percentage = totalMarks / _maxWeeklyMarks;

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
//       title: Text('Weekly Marks'),
//       backgroundColor: Colors.blue,  // Set AppBar color to blue
//     ),
//     body: _isLoading
//         ? Center(child: CircularProgressIndicator())
//         : groupedMarks.isEmpty
//             ? Center(
//                 child: Text(
//                   'No marks found for this week.',
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

//                   return Card(
//                     elevation: 4,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     margin: const EdgeInsets.symmetric(
//                         vertical: 8, horizontal: 16),
//                     child: ListTile(
//                       leading: CircleAvatar(
//                         backgroundImage: profilePictureUrl.isNotEmpty
//                             ? NetworkImage(profilePictureUrl)
//                             : null,
//                         backgroundColor: Colors.grey,
//                         radius: 30, // Increased the radius for a bigger image
//                         child: profilePictureUrl.isEmpty
//                             ? Icon(Icons.person, color: Colors.white)
//                             : null,
//                       ),
//                       title: Text(
//                         name,
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       subtitle: Text(
//                         'Marks: $totalMarks',
//                         style: TextStyle(fontSize: 14, color: Colors.grey[600]),
//                       ),
//                       trailing: _buildLiquidProgress(percentage),
//                     ),
//                   );
//                 },
//               ),
//   );
// }

// }
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:timezone/timezone.dart' as tz;


class WeeklyMarksScreen extends StatefulWidget {
  @override
  _WeeklyMarksScreenState createState() => _WeeklyMarksScreenState();
}

class _WeeklyMarksScreenState extends State<WeeklyMarksScreen> {
  final supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<Map<String, dynamic>> _weeklyMarks = [];
  final int _maxWeeklyMarks = 100; // Adjust this value as needed for weekly comparison

  @override
  void initState() {
    super.initState();
    _fetchWeeklyMarks();
  }


// Future<void> _fetchWeeklyMarks() async {
//   setState(() {
//     _isLoading = true;
//   });

//   try {
//     final today = DateTime.now();
//     final sevenDaysAgo = today.subtract(Duration(days: 7));

//     // Query to fetch the most recent data based on `date`
//     final response = await supabase
//         .from('marks')
//         .select('name, marks, date, profile_picture, uid')
//         .gte('date', sevenDaysAgo.toIso8601String()) // Filter for last 7 days
//         .order('date', ascending: false) // Most recent date first
//         .limit(1); // Fetch only the most recent record

//     if (response != null) {
//       setState(() {
//         _weeklyMarks = (response as List<dynamic>)
//             .map((e) => e as Map<String, dynamic>)
//             .toList();
//         _isLoading = false;
//       });
//     } else {
//       throw Exception('No recent data found.');
//     }
//   } catch (e) {
//     setState(() {
//       _isLoading = false;
//     });
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('Error fetching recent data: ${e.toString()}'),
//         duration: Duration(seconds: 3),
//       ),
//     );
//   }
// }
  Future<void> _fetchWeeklyMarks() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final today = DateTime.now();
      final oneWeekAgo = today.subtract(Duration(days: 7));

      // Fetch data from Supabase
      final response = await supabase
          .from('marks')
          .select('name, marks, date, profile_picture')
          .gte('date', oneWeekAgo.toIso8601String())
          .order('date', ascending: false);

      if (response != null) {
        setState(() {
          _weeklyMarks = (response as List<dynamic>)
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

  // Future<void> _fetchWeeklyMarks() async {
  //   setState(() {
  //     _isLoading = true;
  //   });

  //   try {
  //     final today = DateTime.now();
  //     final sevenDaysAgo = today.subtract(Duration(days: 7));

  //     final response = await supabase
  //         .from('marks')
  //         .select('name, marks, date, profile_picture, uid')
  //         .gte('date', sevenDaysAgo.toIso8601String())
  //         .order('date', ascending: false);

  //     if (response != null) {
  //       setState(() {
  //         _weeklyMarks = (response as List<dynamic>)
  //             .map((e) => e as Map<String, dynamic>)
  //             .toList();
  //         _isLoading = false;
  //       });
  //     } else {
  //       throw Exception('Unknown error occurred while fetching data.');
  //     }
  //   } catch (e) {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Error fetching marks: ${e.toString()}'),
  //         duration: Duration(seconds: 3),
  //       ),
  //     );
  //   }
  // }


// for every one
// Future<void> _generateAndPrintPdf() async {
//   final pdf = pw.Document();
//   final dateFormatter = DateFormat('yyyy-MM-dd'); // Formatter for the desired date format

//   pdf.addPage(
//     pw.Page(
//       build: (pw.Context context) => pw.Column(
//         children: [
//           pw.Text('Brahmakumari Rajyoga Sewa Kendra', style: pw.TextStyle(fontSize: 24)),
//           pw.Text('Avyakta Murli Exam', style: pw.TextStyle(fontSize: 24)),
//           pw.Text('Weekly Marks', style: pw.TextStyle(fontSize: 24)),
//           pw.Divider(),
//           pw.Table.fromTextArray(
//             context: context,
//             data: [
//               ['Name', 'Marks Obtained', 'Date', 'Total Marks'], // Updated header row
//               ..._weeklyMarks.map((mark) {
//                 final name = mark['name'] ?? 'Unknown';
//                 final marks = mark['marks'] as int;
//                 final dateRaw = mark['date']; // Original timestamp
//                 final dateFormatted = dateRaw != null
//                     ? dateFormatter.format(DateTime.parse(dateRaw))
//                     : 'N/A'; // Format or show 'N/A' if null
//                 return [name, marks.toString(), dateFormatted, _maxWeeklyMarks.toString()];
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
//     filename: 'WeeklyMarks.pdf',
//   );
// }
// Future<void> _generateAndPrintPdf() async {
//   final pdf = pw.Document();
//   final dateFormatter = DateFormat('yyyy-MM-dd'); // Formatter for the desired date format

//   // Fetch the date from the first mark's data (assuming all dates are the same)
//   final firstMark = _weeklyMarks.isNotEmpty ? _weeklyMarks[0]['date'] : null;
//   final reportDate = firstMark != null ? DateTime.parse(firstMark) : DateTime.now(); // Fallback to current date if no mark is found

//   pdf.addPage(
//     pw.Page(
//       build: (pw.Context context) => pw.Column(
//         children: [
//           pw.Text('Brahmakumari Rajyoga Sewa Kendra', style: pw.TextStyle(fontSize: 24)),
//           pw.Text('Avyakta Murli Exam', style: pw.TextStyle(fontSize: 24)),
//           pw.Text('Weekly Marks', style: pw.TextStyle(fontSize: 24)),
//           pw.SizedBox(height: 10), // Adding some space between texts
//           pw.Text('Date: ${dateFormatter.format(reportDate)}', style: pw.TextStyle(fontSize: 18)), // Displaying the date below "Weekly Marks"
//           pw.Divider(),
//           pw.Table.fromTextArray(
//             context: context,
//             data: [
//               ['Name', 'Marks Obtained', 'Total Marks'], // Updated header row without "Date"
//               ..._weeklyMarks.map((mark) {
//                 final name = mark['name'] ?? 'Unknown';
//                 final marks = mark['marks'] as int;
//                 return [name, marks.toString(), _maxWeeklyMarks.toString()];
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
//     filename: 'WeeklyMarks.pdf',
//   );
// }
// Future<void> _generateAndPrintPdf() async {
//   final pdf = pw.Document();
//   final dateFormatter = DateFormat('yyyy-MM-dd'); // Formatter for the desired date format

//   // Fetch the date from the first mark's data (assuming all dates are the same)
//   final firstMark = _weeklyMarks.isNotEmpty ? _weeklyMarks[0]['date'] : null;
//   final reportDate = firstMark != null ? DateTime.parse(firstMark) : DateTime.now(); // Fallback to current date if no mark is found

//   // Group marks by location (inside parentheses)
//   final Map<String, List<Map<String, dynamic>>> groupedMarks = {};

//   for (var mark in _weeklyMarks) {
//     final name = mark['name'] ?? 'Unknown';
//     final locationMatch = RegExp(r'\((.*?)\)').firstMatch(name); // Extract location from parentheses
//     final location = locationMatch != null ? locationMatch.group(1) ?? 'Unknown Location' : 'Unknown Location'; // Default to 'Unknown Location' if null

//     // Group by location
//     if (!groupedMarks.containsKey(location)) {
//       groupedMarks[location] = [];
//     }
//     groupedMarks[location]?.add(mark);
//   }

//   // Create pages for each group
//   groupedMarks.forEach((location, marks) {
//     pdf.addPage(
//       pw.Page(
//         build: (pw.Context context) => pw.Column(
//           children: [
//             pw.Text('Brahmakumari Rajyoga Sewa Kendra', style: pw.TextStyle(fontSize: 24)),
//             pw.Text('Avyakta Murli Exam', style: pw.TextStyle(fontSize: 24)),
//             pw.Text('Weekly Marks - $location', style: pw.TextStyle(fontSize: 24)), // Display location
//             pw.SizedBox(height: 10), // Adding some space between texts
//             pw.Text('Date: ${dateFormatter.format(reportDate)}', style: pw.TextStyle(fontSize: 18)), // Displaying the date below "Weekly Marks"
//             pw.Divider(),
//             pw.Table.fromTextArray(
//               context: context,
//               data: [
//                 ['Name', 'Marks Obtained', 'Total Marks'], // Updated header row without "Date"
//                 ...marks.map((mark) {
//                   final name = mark['name'] ?? 'Unknown';
//                   final marksObtained = mark['marks'] as int;
//                   return [name, marksObtained.toString(), _maxWeeklyMarks.toString()];
//                 }).toList(),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   });

//   // Save and download the PDF
//   await Printing.sharePdf(
//     bytes: await pdf.save(),
//     filename: 'WeeklyMarks.pdf',
//   );
// }


// Future<void> _generateAndPrintPdf() async {
//   final pdf = pw.Document();
//   final dateFormatter = DateFormat('yyyy-MM-dd'); // Formatter for the desired date format

//   // Fetch the date from the first mark's data (assuming all dates are the same)
//   final firstMark = _weeklyMarks.isNotEmpty ? _weeklyMarks[0]['date'] : null;
//   final reportDate = firstMark != null ? DateTime.parse(firstMark) : DateTime.now(); // Fallback to current date if no mark is found

//   // Group marks by location (inside parentheses)
//   final Map<String, List<Map<String, dynamic>>> groupedMarks = {};

//   for (var mark in _weeklyMarks) {
//     final name = mark['name'] ?? 'Unknown';
//     final locationMatch = RegExp(r'\((.*?)\)').firstMatch(name); // Extract location from parentheses
//     final location = locationMatch != null ? locationMatch.group(1) ?? 'Unknown Location' : 'Unknown Location'; // Default to 'Unknown Location' if null

//     // Group by location
//     if (!groupedMarks.containsKey(location)) {
//       groupedMarks[location] = [];
//     }
//     groupedMarks[location]?.add(mark);
//   }

//   // Create pages for each group
//   groupedMarks.forEach((location, marks) {
//     // Sort marks alphabetically by name
//     marks.sort((a, b) {
//       final nameA = (a['name'] ?? '').replaceAll(RegExp(r'\(.*?\)'), '').trim();
//       final nameB = (b['name'] ?? '').replaceAll(RegExp(r'\(.*?\)'), '').trim();
//       return nameA.compareTo(nameB); // Alphabetical order
//     });

//     pdf.addPage(
//       pw.Page(
//         build: (pw.Context context) => pw.Column(
//           children: [
//             pw.Text('Brahmakumari Rajyoga Sewa Kendra', style: pw.TextStyle(fontSize: 24)),
//             pw.Text('Avyakta Murli Exam', style: pw.TextStyle(fontSize: 24)),
//             pw.Text('Weekly Marks - $location', style: pw.TextStyle(fontSize: 24)), // Display location
//             pw.SizedBox(height: 10), // Adding some space between texts
//             pw.Text('Date: ${dateFormatter.format(reportDate)}', style: pw.TextStyle(fontSize: 18)), // Displaying the date below "Weekly Marks"
//             pw.Divider(),
//             pw.Table.fromTextArray(
//               context: context,
//               data: [
//                 ['SN', 'Name', 'Marks Obtained', 'Total Marks'], // Updated header with 'SN'
//                 ...List.generate(marks.length, (index) {
//                   final mark = marks[index];
//                   final nameWithLocation = mark['name'] ?? 'Unknown';
//                   final marksObtained = mark['marks'] as int;
//                   final sn = index + 1; // Serial number

//                   // Remove location (contents inside parentheses)
//                   final cleanedName = nameWithLocation.replaceAll(RegExp(r'\(.*?\)'), '').trim(); // Removing the content inside parentheses

//                   return [sn.toString(), cleanedName, marksObtained.toString(), _maxWeeklyMarks.toString()];
//                 }).toList(),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   });

//   // Save and download the PDF
//   await Printing.sharePdf(
//     bytes: await pdf.save(),
//     filename: 'WeeklyMarks.pdf',
//   );
// }

Future<void> _generateAndPrintPdf() async {
  final pdf = pw.Document();
  final dateFormatter = DateFormat('yyyy-MM-dd'); // Formatter for the desired date format

  // Fetch the date from the first mark's data (assuming all dates are the same)
  final firstMark = _weeklyMarks.isNotEmpty ? _weeklyMarks[0]['date'] : null;
  final reportDate = firstMark != null ? DateTime.parse(firstMark) : DateTime.now(); // Fallback to current date if no mark is found

  // Group marks by location (inside parentheses)
  final Map<String, List<Map<String, dynamic>>> groupedMarks = {};

  for (var mark in _weeklyMarks) {
    final name = mark['name'] ?? 'Unknown';
    final locationMatch = RegExp(r'\((.*?)\)').firstMatch(name); // Extract location from parentheses
    final location = locationMatch != null ? locationMatch.group(1) ?? 'Unknown Location' : 'Unknown Location'; // Default to 'Unknown Location' if null

    // Group by location
    if (!groupedMarks.containsKey(location)) {
      groupedMarks[location] = [];
    }
    groupedMarks[location]?.add(mark);
  }

  // Create pages for each group
  groupedMarks.forEach((location, marks) {
    // Sort marks alphabetically by name
    marks.sort((a, b) {
      final nameA = (a['name'] ?? '').replaceAll(RegExp(r'\(.*?\)'), '').trim();
      final nameB = (b['name'] ?? '').replaceAll(RegExp(r'\(.*?\)'), '').trim();
      return nameA.compareTo(nameB); // Alphabetical order
    });

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          children: [
            pw.Text('Brahmakumari Rajyoga Sewa Kendra', style: pw.TextStyle(fontSize: 24)),
            pw.Text('Avyakta Murli Exam', style: pw.TextStyle(fontSize: 24)),
            pw.Text('Weekly Marks - $location', style: pw.TextStyle(fontSize: 24)), // Display location
            pw.SizedBox(height: 10), // Adding some space between texts
            pw.Text('Date: ${dateFormatter.format(reportDate)}', style: pw.TextStyle(fontSize: 18)), // Displaying the date below "Weekly Marks"
            pw.Divider(),
            pw.Table.fromTextArray(
              context: context,
              data: [
                ['SN', 'Name', 'Total Marks', 'Marks Obtained'], // Column order swapped
                ...List.generate(marks.length, (index) {
                  final mark = marks[index];
                  final nameWithLocation = mark['name'] ?? 'Unknown';
                  final marksObtained = mark['marks'] as int;
                  final sn = index + 1; // Serial number

                  // Remove location (contents inside parentheses)
                  final cleanedName = nameWithLocation.replaceAll(RegExp(r'\(.*?\)'), '').trim(); // Removing the content inside parentheses

                  return [sn.toString(), cleanedName, _maxWeeklyMarks.toString(), marksObtained.toString()];
                }).toList(),
              ],
            ),
          ],
        ),
      ),
    );
  });

  // Save and download the PDF
  await Printing.sharePdf(
    bytes: await pdf.save(),
    filename: 'WeeklyMarks.pdf',
  );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weekly Marks'),
        actions: [
          IconButton(
            icon: Icon(Icons.download),
            onPressed: _generateAndPrintPdf,
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade700, Colors.blue.shade400],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _weeklyMarks.isEmpty
              ? Center(
                  child: Text(
                    'No marks found for the last week.',
                    style: TextStyle(fontSize: 16),
                  ),
                )
              : ListView.builder(
                  itemCount: _weeklyMarks.length,
                  itemBuilder: (context, index) {
                    final mark = _weeklyMarks[index];
                    final name = mark['name'] ?? 'Unknown';
                    final marks = mark['marks'] as int;
                    final profilePictureUrl =
                        mark['profile_picture'] ?? '';
                    final String formattedDate = mark['date'] != null
    ? '${DateFormat('yyyy-MM-dd').format(DateTime.parse(mark['date']))} AD'
    : 'Unknown Date';
                    final percentage = marks / _maxWeeklyMarks;

                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.blue.shade50,
                                Colors.blue.shade100
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: profilePictureUrl.isNotEmpty
                                    ? NetworkImage(profilePictureUrl)
                                    : null,
                                backgroundColor: Colors.grey,
                                radius: 30,
                                child: profilePictureUrl.isEmpty
                                    ? Icon(Icons.person, color: Colors.white)
                                    : null,
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      name,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Marks: $marks',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
  'Date: $formattedDate',
  style: TextStyle(
    fontSize: 14,
    color: Colors.grey[600],
  ),
),
                                  ],
                                ),
                              ),
                              _buildLiquidProgress(percentage),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
