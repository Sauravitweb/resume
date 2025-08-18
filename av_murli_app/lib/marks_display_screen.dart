// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class MarksDisplayScreen extends StatefulWidget {
//   @override
//   _MarksDisplayScreenState createState() => _MarksDisplayScreenState();
// }

// class _MarksDisplayScreenState extends State<MarksDisplayScreen> {
//   final supabase = Supabase.instance.client;
//   String _selectedPeriod = 'Weekly';
//   List<Map<String, dynamic>> marksData = [];

//   @override
//   void initState() {
//     super.initState();
//     _fetchMarks('weekly');
//   }

//   // Function to fetch marks from Supabase based on the selected period
//   Future<void> _fetchMarks(String period) async {
//     final response = await supabase
//         .from('marks')
//         .select()
//         .eq('period', period)
//         .order('date', ascending: true)
//         .execute();

//     if (response.error == null) {
//       setState(() {
//         marksData = List<Map<String, dynamic>>.from(response.data);
//       });
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Error fetching marks: ${response.error!.message}'),
//       ));
//     }
//   }

//   // Function to handle period selection
//   void _onPeriodSelected(String period) {
//     setState(() {
//       _selectedPeriod = period;
//     });
//     _fetchMarks(period.toLowerCase());
//   }

//   // UI to display the marks
//   Widget _buildMarksDisplay() {
//     return ListView.builder(
//       itemCount: marksData.length,
//       itemBuilder: (context, index) {
//         final mark = marksData[index];
//         double progress = mark['marks'] / 100.0;

//         return ListTile(
//           title: Text(mark['name']),
//           subtitle: Text('Marks: ${mark['marks']}'),
//           trailing: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('${(progress * 100).toStringAsFixed(0)}%'),
//               SizedBox(height: 8),
//               LinearProgressIndicator(
//                 value: progress,
//                 color: Colors.blue,
//                 backgroundColor: Colors.grey[300],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Marks Display'),
//       ),
//       body: Column(
//         children: [
//           // Period Selection Buttons (Weekly, Monthly, Half-Yearly, Yearly)
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 _buildPeriodButton('Weekly'),
//                 _buildPeriodButton('Monthly'),
//                 _buildPeriodButton('Half-Yearly'),
//                 _buildPeriodButton('Yearly'),
//               ],
//             ),
//           ),
//           Expanded(child: _buildMarksDisplay()),
//         ],
//       ),
//     );
//   }

//   // Button for selecting the time period
//   Widget _buildPeriodButton(String period) {
//     return ElevatedButton(
//       onPressed: () => _onPeriodSelected(period),
//       style: ElevatedButton.styleFrom(
//         primary: _selectedPeriod == period ? Colors.blue : Colors.grey,
//       ),
//       child: Text(period),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class MarksDisplayScreen extends StatefulWidget {
//   final String period; // Define the period as a parameter

//   // Constructor for MarksDisplayScreen that accepts period
//   const MarksDisplayScreen({Key? key, required this.period}) : super(key: key);

//   @override
//   _MarksDisplayScreenState createState() => _MarksDisplayScreenState();
// }

// class _MarksDisplayScreenState extends State<MarksDisplayScreen> {
//   final supabase = Supabase.instance.client;

//   // Define a list to hold the fetched marks
//   List<Map<String, dynamic>> marks = [];

//   @override
//   void initState() {
//     super.initState();
//     // Fetch marks based on the selected period
//     _fetchMarks();
//   }

//   // Function to fetch marks based on the selected period
//   // Future<void> _fetchMarks() async {
//   //   final response = await supabase
//   //       .from('marks')
//   //       .select()
//   //       .eq('period', widget.period) // Use widget.period to filter marks by period
//   //       .order('date', ascending: false) // Optionally order by date
//   //       .execute();

//   //   if (response.error == null) {
//   //     setState(() {
//   //       marks = List<Map<String, dynamic>>.from(response.data);
//   //     });
//   //   } else {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(content: Text('Error: ${response.error!.message}')),
//   //     );
//   //   }
//   // }

//  Future<void> _fetchMarks() async {
//     final response = await supabase
//         .from('marks')
//         .select()
//         .eq('period', widget.period) // Use widget.period to filter marks by period
//         .order('date', ascending: false) // Optionally order by date
//         .then((data) => data);

//     // Check for errors and update the UI
//     if (response != null) {
//       setState(() {
//         marks = List<Map<String, dynamic>>.from(response);
//       });
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error fetching data')),
//       );
//     }
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Marks for ${widget.period.capitalize()}')),
//       body: ListView.builder(
//         itemCount: marks.length,
//         itemBuilder: (context, index) {
//           final mark = marks[index];
//           return ListTile(
//             title: Text(mark['name']),
//             subtitle: Text('Marks: ${mark['marks']}'),
//             trailing: Text(mark['date']),
//           );
//         },
//       ),
//     );
//   }
// }

// extension StringCasingExtension on String {
//   String capitalize() {
//     return this[0].toUpperCase() + this.substring(1);
//   }
// }
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MarksDisplayScreen extends StatefulWidget {
  final String period; // Define the period as a parameter

  // Constructor for MarksDisplayScreen that accepts period
  const MarksDisplayScreen({Key? key, required this.period}) : super(key: key);

  @override
  _MarksDisplayScreenState createState() => _MarksDisplayScreenState();
}

class _MarksDisplayScreenState extends State<MarksDisplayScreen> {
  final supabase = Supabase.instance.client;

  // Define a list to hold the fetched marks
  List<Map<String, dynamic>> marks = [];

  @override
  void initState() {
    super.initState();
    // Fetch marks based on the selected period
    _fetchMarks();
  }

  // Function to fetch marks based on the selected period
  Future<void> _fetchMarks() async {
    final response = await supabase
        .from('marks')
        .select()
        .eq('period', widget.period) // Use widget.period to filter marks by period
        .order('date', ascending: false); // Use execute to get the response

    // Check for errors and update the UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Marks for ${widget.period.capitalize()}')),
      body: marks.isEmpty
          ? Center(child: CircularProgressIndicator()) // Show loading indicator when marks are empty
          : ListView.builder(
              itemCount: marks.length,
              itemBuilder: (context, index) {
                final mark = marks[index];
                // Format the date if it's a timestamp
                String formattedDate = mark['date'] != null
                    ? DateTime.parse(mark['date']).toLocal().toString()
                    : 'N/A';

                return ListTile(
                  title: Text(mark['name'] ?? 'No Name'),
                  subtitle: Text('Marks: ${mark['marks']}'),
                  trailing: Text(formattedDate),
                );
              },
            ),
    );
  }
}

extension StringCasingExtension on String {
  String capitalize() {
    return this[0].toUpperCase() + this.substring(1);
  }
}
