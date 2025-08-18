// import 'package:flutter/material.dart';
// import 'marks_display_screen.dart';

// class YearlyMarksScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MarksDisplayScreen(period: 'yearly');
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class YearlyMarksScreen extends StatefulWidget {
//   final String userId;

//   const YearlyMarksScreen({Key? key, required this.userId}) : super(key: key);

//   @override
//   _YearlyMarksScreenState createState() => _YearlyMarksScreenState();
// }

// class _YearlyMarksScreenState extends State<YearlyMarksScreen> {
//   int _totalMarks = 0;
//   bool _isLoading = true;

//   final supabase = Supabase.instance.client;

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
//       final oneYearAgo = DateTime.now().subtract(Duration(days: 365)).toIso8601String();
//       final today = DateTime.now().toIso8601String();

//       final response = await supabase
//           .from('marks')
//           .select('marks')
//           .eq('uid', widget.userId)
//           .gte('date', oneYearAgo)
//           .lte('date', today);

//       if (response is List) {
//         final totalMarks = response.fold<int>(0, (sum, item) => sum + (item['marks'] as int));
//         setState(() {
//           _totalMarks = totalMarks;
//           _isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error fetching marks')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Yearly Marks'),
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Card(
//                     elevation: 4,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Total Marks (Past Year)',
//                             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(height: 8),
//                           Text(
//                             '$_totalMarks',
//                             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 32),
//                   Text(
//                     'Progress Over the Year',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 16),
//                   LiquidLinearProgressIndicator(
//                     value: _totalMarks / 36500, // Assuming max marks are 100 per day
//                     valueColor: AlwaysStoppedAnimation(Colors.blue),
//                     backgroundColor: Colors.grey[200],
//                     borderColor: Colors.blue,
//                     borderWidth: 2.0,
//                     borderRadius: 16.0,
//                     direction: Axis.vertical,
//                     center: Text(
//                       '${((_totalMarks / 5200) * 100).toStringAsFixed(1)}%',
//                       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class YourMarksScreen extends StatefulWidget {
//   final String userId;

//   const YourMarksScreen({Key? key, required this.userId}) : super(key: key);

//   @override
//   _YourMarksScreenState createState() => _YourMarksScreen();
// }

// class _YourMarksScreen {
// }



// class _YourMarksScreenState extends State<YourMarksScreen> with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   bool _isLoading = true;
//   int _weeklyMarks = 0;
//   int _monthlyMarks = 0;
//   int _halfYearlyMarks = 0;
//   int _yearlyMarks = 0;

//   final supabase = Supabase.instance.client;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 4, vsync: this);
//     _fetchMarks();
//   }

//   Future<void> _fetchMarks() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final today = DateTime.now();
//       final oneWeekAgo = today.subtract(Duration(days: 7)).toIso8601String();
//       final oneMonthAgo = today.subtract(Duration(days: 30)).toIso8601String();
//       final halfYearAgo = today.subtract(Duration(days: 182)).toIso8601String();
//       final oneYearAgo = today.subtract(Duration(days: 365)).toIso8601String();

//       final response = await supabase
//           .from('marks')
//           .select('marks, date')
//           .eq('uid', widget.userId);

//       if (response is List) {
//         int weekly = 0, monthly = 0, halfYearly = 0, yearly = 0;

//         for (var item in response) {
//           final date = DateTime.parse(item['date'] as String);
//           final marks = item['marks'] as int;

//           if (date.isAfter(DateTime.parse(oneWeekAgo))) {
//             weekly += marks;
//           }
//           if (date.isAfter(DateTime.parse(oneMonthAgo))) {
//             monthly += marks;
//           }
//           if (date.isAfter(DateTime.parse(halfYearAgo))) {
//             halfYearly += marks;
//           }
//           if (date.isAfter(DateTime.parse(oneYearAgo))) {
//             yearly += marks;
//           }
//         }

//         setState(() {
//           _weeklyMarks = weekly;
//           _monthlyMarks = monthly;
//           _halfYearlyMarks = halfYearly;
//           _yearlyMarks = yearly;
//           _isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error fetching marks')),
//       );
//     }
//   }

//   Widget _buildProgressCard(String title, int marks, double maxMarks) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text(
//               '$marks',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
//             ),
//             SizedBox(height: 16),
//             LiquidLinearProgressIndicator(
//               value: marks / maxMarks,
//               valueColor: AlwaysStoppedAnimation(Colors.blue),
//               backgroundColor: Colors.grey[200],
//               borderColor: Colors.blue,
//               borderWidth: 2.0,
//               borderRadius: 16.0,
//               direction: Axis.vertical,
//               center: Text(
//                 '${((marks / maxMarks) * 100).toStringAsFixed(1)}%',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Marks Overview'),
//         bottom: TabBar(
//           controller: _tabController,
//           tabs: [
//             Tab(text: 'Weekly'),
//             Tab(text: 'Monthly'),
//             Tab(text: 'Half-Yearly'),
//             Tab(text: 'Yearly'),
//           ],
//         ),
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : TabBarView(
//               controller: _tabController,
//               children: [
//                 _buildProgressCard('Weekly Marks', _weeklyMarks, 700),
//                 _buildProgressCard('Monthly Marks', _monthlyMarks, 3000),
//                 _buildProgressCard('Half-Yearly Marks', _halfYearlyMarks, 18200),
//                 _buildProgressCard('Yearly Marks', _yearlyMarks, 36500),
//               ],
//             ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class YourMarksScreen extends StatefulWidget {
//   final String userId;

//   const YourMarksScreen({Key? key, required this.userId}) : super(key: key);

//   @override
//   _YourMarksScreenState createState() => _YourMarksScreenState();
// }

// class _YourMarksScreenState extends State<YourMarksScreen> with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   bool _isLoading = true;
//   int _weeklyMarks = 0;
//   int _monthlyMarks = 0;
//   int _halfYearlyMarks = 0;
//   int _yearlyMarks = 0;

//   final supabase = Supabase.instance.client;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 4, vsync: this);
//     _fetchMarks();
//   }

//   Future<void> _fetchMarks() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final today = DateTime.now();
//       final oneWeekAgo = today.subtract(Duration(days: 7));
//       final oneMonthAgo = today.subtract(Duration(days: 30));
//       final halfYearAgo = today.subtract(Duration(days: 182));
//       final oneYearAgo = today.subtract(Duration(days: 365));

//       final response = await supabase
//           .from('marks')
//           .select('marks, date')
//           .eq('uid', widget.userId)
//         ;

     
//         int weekly = 0, monthly = 0, halfYearly = 0, yearly = 0;

//         for (var item in response) {
//           final date = DateTime.parse(item['date'] as String);
//           final marks = item['marks'] as int;

//           if (date.isAfter(oneWeekAgo)) {
//             weekly += marks;
//           }
//           if (date.isAfter(oneMonthAgo)) {
//             monthly += marks;
//           }
//           if (date.isAfter(halfYearAgo)) {
//             halfYearly += marks;
//           }
//           if (date.isAfter(oneYearAgo)) {
//             yearly += marks;
//           }
        

//         setState(() {
//           _weeklyMarks = weekly;
//           _monthlyMarks = monthly;
//           _halfYearlyMarks = halfYearly;
//           _yearlyMarks = yearly;
//           _isLoading = false;
//         });
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

//   Widget _buildProgressCard(String title, int marks, double maxMarks) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text(
//               '$marks',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
//             ),
//             SizedBox(height: 16),
//             LiquidLinearProgressIndicator(
//               value: (marks / maxMarks).clamp(0.0, 1.0), // Safeguard for invalid values
//               valueColor: AlwaysStoppedAnimation(Colors.blue),
//               backgroundColor: Colors.grey[200],
//               borderColor: Colors.blue,
//               borderWidth: 2.0,
//               borderRadius: 16.0,
//               direction: Axis.vertical,
//               center: Text(
//                 '${((marks / maxMarks) * 100).clamp(0.0, 100.0).toStringAsFixed(1)}%',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Marks Overview'),
//         bottom: TabBar(
//           controller: _tabController,
//           tabs: [
//             Tab(text: 'Weekly'),
//             Tab(text: 'Monthly'),
//             Tab(text: 'Half-Yearly'),
//             Tab(text: 'Yearly'),
//           ],
//         ),
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : TabBarView(
//               controller: _tabController,
//               children: [
//                 _buildProgressCard('Weekly Marks', _weeklyMarks, 700),
//                 _buildProgressCard('Monthly Marks', _monthlyMarks, 3000),
//                 _buildProgressCard('Half-Yearly Marks', _halfYearlyMarks, 18200),
//                 _buildProgressCard('Yearly Marks', _yearlyMarks, 36500),
//               ],
//             ),
//     );
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
// }
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class YourMarksScreen extends StatefulWidget {
  final String userId;

  const YourMarksScreen({Key? key, required this.userId}) : super(key: key);

  @override
  _YourMarksScreenState createState() => _YourMarksScreenState();
}

class _YourMarksScreenState extends State<YourMarksScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isLoading = true;
  int _weeklyMarks = 0;
  int _monthlyMarks = 0;
  int _halfYearlyMarks = 0;
  int _yearlyMarks = 0;

  final supabase = Supabase.instance.client;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _fetchMarks();
  }

  Future<void> _fetchMarks() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final today = DateTime.now();
      final oneWeekAgo = today.subtract(Duration(days: 7));
      final oneMonthAgo = today.subtract(Duration(days: 30));
      final halfYearAgo = today.subtract(Duration(days: 182));
      final oneYearAgo = today.subtract(Duration(days: 365));

      final response = await supabase
          .from('marks')
          .select('marks, date')
          .eq('uid', widget.userId);

      int weekly = 0, monthly = 0, halfYearly = 0, yearly = 0;

      for (var item in response) {
        final date = DateTime.parse(item['date'] as String);
        final marks = item['marks'] as int;

        if (date.isAfter(oneWeekAgo)) {
          weekly += marks;
        }
        if (date.isAfter(oneMonthAgo)) {
          monthly += marks;
        }
        if (date.isAfter(halfYearAgo)) {
          halfYearly += marks;
        }
        if (date.isAfter(oneYearAgo)) {
          yearly += marks;
        }
      }

      setState(() {
        _weeklyMarks = weekly;
        _monthlyMarks = monthly;
        _halfYearlyMarks = halfYearly;
        _yearlyMarks = yearly;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching marks: ${e.toString()}')),
      );
    }
  }

  Widget _buildProgressCard(String title, int marks, double maxMarks) {
    final percentage = (marks / maxMarks).clamp(0.0, 1.0);

    return Card(
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[800],
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: LiquidLinearProgressIndicator(
                    value: percentage,
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                    backgroundColor: Colors.grey[200],
                    borderRadius: 16.0,
                    center: Text(
                      '${(percentage * 100).toStringAsFixed(1)}%',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Text(
                  '$marks / ${maxMarks.toInt()}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[700],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Marks Overview',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue[200]!, Colors.blue[700]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Weekly'),
            Tab(text: 'Monthly'),
            Tab(text: 'Half-Yearly'),
            Tab(text: 'Yearly'),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blue[50]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : TabBarView(
                controller: _tabController,
                children: [
                  _buildProgressCard('Weekly Marks', _weeklyMarks, 100),
                  _buildProgressCard('Monthly Marks', _monthlyMarks, 400),
                  _buildProgressCard('Half-Yearly Marks', _halfYearlyMarks, 2600),
                  _buildProgressCard('Yearly Marks', _yearlyMarks, 5200),
                ],
              ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
