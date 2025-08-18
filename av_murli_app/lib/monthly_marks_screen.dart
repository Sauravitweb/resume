// import 'package:flutter/material.dart';
// import 'marks_display_screen.dart';

// class MonthlyMarksScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MarksDisplayScreen(period: 'monthly');
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

// class MonthlyMarksScreen extends StatefulWidget {
//   @override
//   _MonthlyMarksScreenState createState() => _MonthlyMarksScreenState();
// }

// class _MonthlyMarksScreenState extends State<MonthlyMarksScreen> {
//   final supabase = Supabase.instance.client;
//   bool _isLoading = true;
//   List<Map<String, dynamic>> _monthlyMarks = [];
//   final int _maxMonthlyMarks = 400; // Set maximum marks for monthly progress.

//   @override
//   void initState() {
//     super.initState();
//     _fetchMonthlyMarks();
//   }

//   Future<void> _fetchMonthlyMarks() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final today = DateTime.now();
//       final oneMonthAgo = today.subtract(Duration(days: 30)); // Changed to 30 days for monthly data

//       // Fetch data from Supabase
//       final response = await supabase
//           .from('marks')
//           .select('name, marks, date, profile_picture')
//           .gte('date', oneMonthAgo.toIso8601String())
//           .order('date', ascending: false);

//       if (response != null) {
//         setState(() {
//           _monthlyMarks = (response as List<dynamic>)
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
//         title: Text('Monthly Marks'),
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : _monthlyMarks.isEmpty
//               ? Center(
//                   child: Text(
//                     'No marks found for this month.',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 )
//               : ListView.builder(
//                   itemCount: _monthlyMarks.length,
//                   itemBuilder: (context, index) {
//                     final mark = _monthlyMarks[index];
//                     final name = mark['name'] ?? 'Unknown';
//                     final marks = mark['marks'] as int;
//                     final date = mark['date'] ?? 'Unknown Date';
//                     final profilePictureUrl =
//                         mark['profile_picture'] ?? ''; // Profile picture URL
//                     final percentage = marks / _maxMonthlyMarks;

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
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class MonthlyMarksScreen extends StatefulWidget {
  @override
  _MonthlyMarksScreenState createState() => _MonthlyMarksScreenState();
}

class _MonthlyMarksScreenState extends State<MonthlyMarksScreen> {
  final supabase = Supabase.instance.client;
  bool _isLoading = true;
  List<Map<String, dynamic>> _monthlyMarks = [];
  final int _maxMonthlyMarks = 400;

  @override
  void initState() {
    super.initState();
    _fetchMonthlyMarks();
  }

  Future<void> _fetchMonthlyMarks() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final today = DateTime.now();
      final oneMonthAgo = today.subtract(Duration(days: 30));

      final response = await supabase
          .from('marks')
          .select('name, marks, date,uid, profile_picture')
          .gte('date', oneMonthAgo.toIso8601String())
          .order('date', ascending: false);

      if (response != null) {
        setState(() {
          _monthlyMarks = (response as List<dynamic>)
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

  Widget _buildLiquidProgress(double percentage) {
    return SizedBox(
      width: 50,
      height: 50,
      child: LiquidCircularProgressIndicator(
        value: percentage.clamp(0.0, 1.0),
        valueColor: AlwaysStoppedAnimation(Colors.blue),
        backgroundColor: Colors.grey[200]!,
        borderColor: Colors.blueAccent,
        borderWidth: 3.0,
        direction: Axis.vertical,
        center: Text(
          '${(percentage * 100).toStringAsFixed(1)}%',
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Monthly Marks'),
  //       backgroundColor: Colors.blueAccent,
  //     ),
  //     body: _isLoading
  //         ? Center(
  //             child: CircularProgressIndicator(
  //               valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
  //             ),
  //           )
  //         : _monthlyMarks.isEmpty
  //             ? Center(
  //                 child: Text(
  //                   'No marks found for this month.',
  //                   style: TextStyle(fontSize: 16, color: Colors.black54),
  //                 ),
  //               )
  //             : ListView.builder(
  //                 itemCount: _monthlyMarks.length,
  //                 padding: const EdgeInsets.all(8.0),
  //                 itemBuilder: (context, index) {
  //                   final mark = _monthlyMarks[index];
  //                   final name = mark['name'] ?? 'Unknown';
  //                   final marks = mark['marks'] as int;
  //                   final profilePictureUrl =
  //                       mark['profile_picture'] ?? ''; // Profile picture URL
  //                   final percentage = marks / _maxMonthlyMarks;

  //                   return Card(
  //                     elevation: 5,
  //                     margin:
  //                         const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
  //                     shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(15),
  //                     ),
  //                     child: ListTile(
  //                       leading: CircleAvatar(
  //                         backgroundImage: profilePictureUrl.isNotEmpty
  //                             ? NetworkImage(profilePictureUrl)
  //                             : null,
  //                         backgroundColor: Colors.blue.shade100,
  //                         radius: 30,
  //                         child: profilePictureUrl.isEmpty
  //                             ? Icon(Icons.person, color: Colors.blue)
  //                             : null,
  //                       ),
  //                       title: Text(
  //                         name,
  //                         style: TextStyle(
  //                             fontSize: 18, fontWeight: FontWeight.w600),
  //                       ),
  //                       subtitle: Text(
  //                         'Marks: $marks',
  //                         style: TextStyle(fontSize: 16, color: Colors.black54),
  //                       ),
  //                       trailing: _buildLiquidProgress(percentage),
  //                     ),
  //                   );
  //                 },
  //               ),
  //   );
  // }
  
  // Future<void> _generateAndPrintPdf() async {
  //   final pdf = pw.Document();
  //   pdf.addPage(
  //     pw.Page(
  //       build: (pw.Context context) => pw.Column(
  //         children: [
  //           pw.Text('Brahmakumari Rajyoga Sewa Kendra', style: pw.TextStyle(fontSize: 24)),
  //           pw.Text('Avyakta Murli Exam', style: pw.TextStyle(fontSize: 24)),
  //           pw.Text('Monthly Marks', style: pw.TextStyle(fontSize: 24)),
  //           pw.Divider(),
  //           pw.Table.fromTextArray(
  //             context: context,
  //             data: [
  //               ['Name', 'Marks Obtained', 'Total Marks'],
  //               ..._monthlyMarks.map((mark) {
  //                 final name = mark['name'] ?? 'Unknown';
  //                 final marks = mark['marks'] as int;
  //                 return [name, marks.toString(), _maxMonthlyMarks.toString()];
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
  //     filename: 'MonthlyMarks.pdf',
  //   );
  // }
  //   Future<void> _generateAndPrintPdf() async {
  //   final pdf = pw.Document();

  //   // Group marks by UID and sum them
  //   Map<String, int> summedMarks = {};
  //   for (var mark in _monthlyMarks) {
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
  //     var userMarks = _monthlyMarks.where((mark) => mark['uid'] == uid).toList();
  //     var name = userMarks.isNotEmpty ? userMarks[0]['name'] : 'Unknown';
  //     var profilePictureUrl = userMarks.isNotEmpty ? userMarks[0]['profile_picture'] : '';
  //     var totalMarks = summedMarks[uid]!;
  //     var percentage = totalMarks / _maxMonthlyMarks;

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
  //             'Monthly Marks',
  //             style: pw.TextStyle(
  //               fontSize: 24,
  //               fontWeight: pw.FontWeight.bold,
  //             ),
  //           ),
  //           pw.SizedBox(height: 16),
  //           pw.Table.fromTextArray(
  //             headers: ['Name', 'Total Marks'],
  //             data: groupedMarks.map((mark) {
  //               final name = mark['name'] ?? 'Unknown';
  //               final marks = mark['totalMarks'] ?? 0;
  //               return [name, '$marks / $_maxMonthlyMarks'];
  //             }).toList(),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );

  //   try {
  //     // Save the PDF
  //     final tempDir = await getTemporaryDirectory();
  //     final file = File('${tempDir.path}/MonthlyMarks.pdf');
  //     await file.writeAsBytes(await pdf.save());

  //     // Open the PDF
  //     await Printing.sharePdf(bytes: await pdf.save(), filename: 'MonthlyMarks.pdf');
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Failed to generate PDF: $e')),
  //     );
  //   }
  // }
// Future<void> _generateAndPrintPdf() async {
//   final pdf = pw.Document();

//   // Group marks by UID and sum them
//   Map<String, int> summedMarks = {};
//   for (var mark in _monthlyMarks) {
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
//     var userMarks = _monthlyMarks.where((mark) => mark['uid'] == uid).toList();
//     var name = userMarks.isNotEmpty ? userMarks[0]['name'] : 'Unknown';
//     var profilePictureUrl = userMarks.isNotEmpty ? userMarks[0]['profile_picture'] : '';
//     var totalMarks = summedMarks[uid]!;
//     var percentage = totalMarks / _maxMonthlyMarks;

//     groupedMarks.add({
//       'uid': uid,
//       'name': name,
//       'profile_picture': profilePictureUrl,
//       'totalMarks': totalMarks,
//       'percentage': percentage,
//     });
//   }

//   // Sort grouped marks by totalMarks in descending order
//   groupedMarks.sort((a, b) => b['totalMarks'].compareTo(a['totalMarks']));

//   // Add content to the PDF
//   pdf.addPage(
//     pw.Page(
//       build: (context) => pw.Column(
//         crossAxisAlignment: pw.CrossAxisAlignment.start,
//         children: [
//           pw.Text(
//             'Monthly Marks',
//             style: pw.TextStyle(
//               fontSize: 24,
//               fontWeight: pw.FontWeight.bold,
//             ),
//           ),
//           pw.SizedBox(height: 16),
//           pw.Table.fromTextArray(
//             headers: ['Name', 'Total Marks'],
//             data: groupedMarks.map((mark) {
//               final name = mark['name'] ?? 'Unknown';
//               final marks = mark['totalMarks'] ?? 0;
//               return [name, '$marks / $_maxMonthlyMarks'];
//             }).toList(),
//           ),
//         ],
//       ),
//     ),
//   );

//   try {
//     // Save the PDF
//     final tempDir = await getTemporaryDirectory();
//     final file = File('${tempDir.path}/MonthlyMarks.pdf');
//     await file.writeAsBytes(await pdf.save());

//     // Open the PDF
//     await Printing.sharePdf(bytes: await pdf.save(), filename: 'MonthlyMarks.pdf');
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
  for (var mark in _monthlyMarks) {
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
    var userMarks = _monthlyMarks.where((mark) => mark['uid'] == uid).toList();
    var name = userMarks.isNotEmpty ? userMarks[0]['name'] : 'Unknown';
    var profilePictureUrl = userMarks.isNotEmpty ? userMarks[0]['profile_picture'] : '';
    var totalMarks = summedMarks[uid]!;
    var percentage = totalMarks / _maxMonthlyMarks;

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
            'Monthly Marks',
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
              final sn = index + 1;  // Serial number starts from 1
              final name = mark['name'] ?? 'Unknown';
              final marks = mark['totalMarks'] ?? 0;
              return [sn.toString(), name, '$marks / $_maxMonthlyMarks'];
            }),
          ),
        ],
      ),
    ),
  );

  try {
    // Save the PDF
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/MonthlyMarks.pdf');
    await file.writeAsBytes(await pdf.save());

    // Open the PDF
    await Printing.sharePdf(bytes: await pdf.save(), filename: 'MonthlyMarks.pdf');
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to generate PDF: $e')),
    );
  }
}


@override
Widget build(BuildContext context) {
  // Group marks by UID and sum them
  Map<String, int> summedMarks = {};
  for (var mark in _monthlyMarks) {
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
    var userMarks = _monthlyMarks.where((mark) => mark['uid'] == uid).toList();
    var name = userMarks.isNotEmpty ? userMarks[0]['name'] : 'Unknown';
    var profilePictureUrl = userMarks.isNotEmpty ? userMarks[0]['profile_picture'] : '';
    var totalMarks = summedMarks[uid]!;
    var percentage = totalMarks / _maxMonthlyMarks;

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
      title: Text('Monthly Marks'),
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
                  'No marks found for this month.',
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
