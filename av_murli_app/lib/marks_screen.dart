// import 'package:flutter/material.dart';

// class MarksScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Marks')),
//       body: Column(
//         children: [
//           ElevatedCard(
//             onTap: () {
//               // Navigate to upload marks screen
//             },
//             child: Text('Upload Marks'),
//           ),
//           // Additional cards for marks over different periods (weekly, monthly, etc.)
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:life_manager_app/marks_display_screen.dart';

// class MarksScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Marks Screen'),
//       ),
//       body: ListView(
//         children: [
//           Card(
//             elevation: 4.0,
//             margin: EdgeInsets.all(10),
//             child: ListTile(
//               title: Text('Marks'),
//               onTap: () {
//                 // Navigate to the appropriate screen
//               },
//             ),
//           ),
//           Card(
//             elevation: 4.0,
//             margin: EdgeInsets.all(10),
//             child: ListTile(
//               title: Text('Upload Marks'),
//               onTap: () {
//                 Navigator.pushReplacementNamed(context, '/home');
//                 MarksDisplayScreen();
//               },
//             ),
//           ),
//           // Add more cards for other features
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:life_manager_app/half_yearly_marks_screen.dart';
// import 'package:life_manager_app/marks_display_screen.dart';
// import 'package:life_manager_app/monthly_marks_screen.dart';
// import 'package:life_manager_app/weekly_marks_screen.dart';
// import 'package:life_manager_app/yearly_marks_screen.dart';
// // import 'package:life_manager_app/yearly_marks_screen.dart';
// import 'package:life_manager_app/your_marks_screen.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// final user = Supabase.instance.client.auth.currentUser;
// final userId = user?.id;

// class MarksScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Marks Screen'),
//       ),
//       body: ListView(
//         children: [
//           Card(
//             elevation: 4.0,
//             margin: EdgeInsets.all(10),
//             child: ListTile(
//               title: Text('Your Marks'),
//               onTap: () {
//                 // Navigate to MarksDisplayScreen, passing the selected period
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(
//                 //     builder: (context) => MarksDisplayScreen(period: 'Yearly'), // Example period
//                 //   ),
//                 // );
//              Navigator.push(
//   context,
//   MaterialPageRoute(
//     builder: (context) => YourMarksScreen(userId: userId ?? ''),
//   ),
// );

//               },
//             ),
//           ),
//           Card(
//             elevation: 4.0,
//             margin: EdgeInsets.all(10),
//             child: ListTile(
//               title: Text('Weekly Marks'),
//               onTap: () {
//                 // Navigate to MarksDisplayScreen, passing the selected period
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(
//                 //     builder: (context) => MarksDisplayScreen(period: 'Weekly'), // Example period
//                 //   ),
//                 // );
//                 Navigator.push(
//   context,
//   MaterialPageRoute(builder: (context) => WeeklyMarksScreen()),
// );

//               },
//             ),
//           ),
//           Card(
//             elevation: 4.0,
//             margin: EdgeInsets.all(10),
//             child: ListTile(
//               title: Text('Monthly Marks'),
//               onTap: () {
//                 // Navigate to MarksDisplayScreen, passing the selected period
//                                 Navigator.push(
//   context,
//   MaterialPageRoute(builder: (context) => MonthlyMarksScreen()),
// );

//               },
//             ),
//           ),
//           Card(
//             elevation: 4.0,
//             margin: EdgeInsets.all(10),
//             child: ListTile(
//               title: Text('Half Yearly Marks'),
//               onTap: () {
//                 // Navigate to MarksDisplayScreen, passing the selected period
//                                 Navigator.push(
//   context,
//   MaterialPageRoute(builder: (context) => HalfYearlyMarksScreen()),
// );

//               },
//             ),
//           ),
//           Card(
//             elevation: 4.0,
//             margin: EdgeInsets.all(10),
//             child: ListTile(
//               title: Text('Yearly Marks'),
//               onTap: () {
//                 // Navigate to MarksDisplayScreen, passing the selected period
//                                 Navigator.push(
//   context,
//   MaterialPageRoute(builder: (context) => YearlyMarksScreen()),
// );

//               },
//             ),
//           ),
          
//           Card(
//             elevation: 4.0,
//             margin: EdgeInsets.all(10),
//             child: ListTile(
//               title: Text('Upload Marks'),
//               onTap: () {
//                 // Navigate to the home screen or handle your navigation here
//                 Navigator.pushReplacementNamed(context, '/upload_marks');
//               },
//             ),
//           ),
//           // Add more cards for other features
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'half_yearly_marks_screen.dart';
import 'marks_display_screen.dart';
import 'monthly_marks_screen.dart';
import 'weekly_marks_screen.dart';
import 'yearly_marks_screen.dart';
import 'your_marks_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final user = Supabase.instance.client.auth.currentUser;
final userId = user?.id;

class MarksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Marks Overview',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0072ff), Color(0xFF00c6ff)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: ListView(
          children: [
            _buildMarksCard(
              context,
              title: 'Your Marks',
              icon: Icons.account_circle_rounded,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => YourMarksScreen(userId: userId ?? ''),
                ),
              ),
            ),
            _buildMarksCard(
              context,
              title: 'Weekly Marks',
              icon: Icons.calendar_view_week,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WeeklyMarksScreen()),
              ),
            ),
            _buildMarksCard(
              context,
              title: 'Monthly Marks',
              icon: Icons.calendar_month,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MonthlyMarksScreen()),
              ),
            ),
            _buildMarksCard(
              context,
              title: 'Half Yearly Marks',
              icon: Icons.timeline_rounded,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HalfYearlyMarksScreen()),
              ),
            ),
            _buildMarksCard(
              context,
              title: 'Yearly Marks',
              icon: Icons.school_rounded,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => YearlyMarksScreen()),
              ),
            ),
            // _buildMarksCard(
            //   context,
            //   title: 'Upload Marks',
            //   icon: Icons.upload_rounded,
            //   onTap: () => Navigator.pushReplacementNamed(
            //     context,
            //     '/upload_marks',
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildMarksCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 6.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.blueAccent.withOpacity(0.2),
                child: Icon(
                  icon,
                  size: 28,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
