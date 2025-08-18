// import 'package:flutter/material.dart';

// class UploadMarksScreen extends StatelessWidget {
//   final _nameController = TextEditingController();
//   final _dateController = TextEditingController();
//   final _marksController = TextEditingController();

//   _uploadMarks() {
//     // Code to upload marks to Supabase
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Upload Marks')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Name')),
//             TextField(controller: _dateController, decoration: InputDecoration(labelText: 'Date')),
//             TextField(controller: _marksController, decoration: InputDecoration(labelText: 'Marks')),
//             ElevatedButton(
//               onPressed: _uploadMarks,
//               child: Text('Upload'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class UploadMarksScreen extends StatefulWidget {
//   @override
//   _UploadMarksScreenState createState() => _UploadMarksScreenState();
// }

// class _UploadMarksScreenState extends State<UploadMarksScreen> {
//   final _nameController = TextEditingController();
//   final _dateController = TextEditingController();
//   final _marksController = TextEditingController();

//   final supabase = Supabase.instance.client;

//   // Function to upload marks to Supabase
//   // Future<void> _uploadMarks() async {
//   //   final name = _nameController.text.trim();
//   //   final date = _dateController.text.trim();
//   //   final marks = int.tryParse(_marksController.text.trim()) ?? 0;

//   //   if (name.isEmpty || date.isEmpty || marks < 0 || marks > 100) {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(content: Text('Please provide valid input')),
//   //     );
//   //     return;
//   //   }

//   //   final response = await supabase.from('marks').insert([
//   //     {
//   //       'name': name,
//   //       'marks': marks,
//   //       'date': date,
//   //       'period': 'weekly', // Can modify based on the selected period
//   //     }
//   //   ]).execute();

//   //   if (response.error == null) {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(content: Text('Marks uploaded successfully')),
//   //     );
//   //     _clearFields();
//   //   } else {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(content: Text('Error: ${response.error!.message}')),
//   //     );
//   //   }
//   // }
//   Future<void> _uploadMarks() async {
//   final name = _nameController.text.trim();
//   final date = _dateController.text.trim();
//   final marks = int.tryParse(_marksController.text.trim()) ?? 0;

//   // Validate the input fields
//   if (name.isEmpty || date.isEmpty || marks < 0 || marks > 100) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Please provide valid input')),
//     );
//     return;
//   }

//   try {
//     // Insert data into Supabase 'marks' table
//     final response = await supabase.from('marks').insert([
//       {
//         'name': name,
//         'marks': marks,
//         'date': date,
//         'period': 'weekly', // You can modify this based on the selected period
//       }
//     ]);

//     // Check if the insert was successful
//     if (response.error == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Marks uploaded successfully')),
//       );
//       _clearFields();
//     } else {
//       // Handle the error if the insert failed
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: ${response.error!.message}')),
//       );
//     }
//   } catch (e) {
//     // Catch any exceptions and show a snackbar with the error message
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('An error occurred: $e')),
//     );
//   }
// }


//   void _clearFields() {
//     _nameController.clear();
//     _dateController.clear();
//     _marksController.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Upload Marks')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             TextField(
//               controller: _dateController,
//               decoration: InputDecoration(labelText: 'Date (YYYY-MM-DD)'),
//             ),
//             TextField(
//               controller: _marksController,
//               decoration: InputDecoration(labelText: 'Marks (0-100)'),
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _uploadMarks,
//               child: Text('Upload Marks'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class UploadMarksScreen extends StatefulWidget {
//   @override
//   _UploadMarksScreenState createState() => _UploadMarksScreenState();
// }

// class _UploadMarksScreenState extends State<UploadMarksScreen> {
//   final _nameController = TextEditingController();
//   final _dateController = TextEditingController();
//   final _marksController = TextEditingController();
//   String? _selectedName;
//   List<String> _userNames = [];

//   final supabase = Supabase.instance.client;

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserNames(); // Fetch the user names when the screen is initialized
//   }

//   // Function to fetch the list of user names from Supabase
//   // Future<void> _fetchUserNames() async {
//   //   try {
//   //     final response = await supabase.from('users').select('name');
//   //     if (response != null) {
//   //       // Add each name to the userNames list
//   //       setState(() {
//   //         _userNames = List<String>.from(response.map((user) => user['name']));
//   //       });
//   //     } else {
//   //       ScaffoldMessenger.of(context).showSnackBar(
//   //         SnackBar(content: Text('Error fetching users: ${response}')),
//   //       );
//   //     }
//   //   } catch (e) {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(content: Text('An error occurred: $e')),
//   //     );
//   //   }
//   // }
//   // Function to fetch the list of user names from Supabase
// Future<void> _fetchUserNames() async {
//   final response = await supabase.from('users').select('first_name, last_name');

//     // Add each full name (first_name + last_name) to the userNames list
//       setState(() {
//         _userNames = List<String>.from(
//           response.map((user) => '${user['first_name']} ${user['last_name']}')
//         );
//       });
   
//     // Catch any exceptions
   
  
// }


//   // Function to upload marks to Supabase
//   Future<void> _uploadMarks() async {
//     final name = _selectedName;
//     final date = _dateController.text.trim();
//     final marks = int.tryParse(_marksController.text.trim()) ?? 0;

//     // Validate the input fields
//     if (name == null || date.isEmpty || marks < 0 || marks > 100) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please provide valid input')),
//       );
//       return;
//     }

//     try {
//       // Insert data into Supabase 'marks' table
//       final response = await supabase.from('marks').insert([
//         {
//           'name': name,
//           'marks': marks,
//           'date': date,
//           'period': 'weekly', // Modify this based on the selected period
//         }
//       ]);

//       // Check if the insert was successful
//       if (response.error == null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Marks uploaded successfully')),
//         );
//         _clearFields();
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error: ${response.error!.message}')),
//         );
//       }
//     } catch (e) {
//       // Catch any exceptions and show a snackbar with the error message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('An error occurred: $e')),
//       );
//     }
//   }

//   // Function to clear the input fields after successful submission
//   void _clearFields() {
//     _selectedName = null;
//     _dateController.clear();
//     _marksController.clear();
//   }

//   // Function to show date picker dialog
//   Future<void> _selectDate(BuildContext context) async {
//     DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );
//     if (pickedDate != null) {
//       // Format the selected date to 'YYYY-MM-DD' format
//       setState(() {
//         _dateController.text = "${pickedDate.toLocal()}".split(' ')[0]; // Date in YYYY-MM-DD format
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Upload Marks')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Dropdown for selecting user name
//             DropdownButton<String>(
//               value: _selectedName,
//               hint: Text('Select User'),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   _selectedName = newValue;
//                 });
//               },
//               items: _userNames.map<DropdownMenuItem<String>>((String name) {
//                 return DropdownMenuItem<String>(
//                   value: name,
//                   child: Text(name),
//                 );
//               }).toList(),
//             ),
//             SizedBox(height: 10),

//             // Date picker for selecting the date
//             TextField(
//               controller: _dateController,
//               decoration: InputDecoration(
//                 labelText: 'Date',
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.calendar_today),
//                   onPressed: () => _selectDate(context),
//                 ),
//               ),
//               readOnly: true, // Make it readonly so that the date picker is the only way to change the date
//             ),
//             SizedBox(height: 10),

//             // Marks input field
//             TextField(
//               controller: _marksController,
//               decoration: InputDecoration(labelText: 'Marks (0-100)'),
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(height: 20),

//             // Button to upload marks
//             ElevatedButton(
//               onPressed: _uploadMarks,
//               child: Text('Upload Marks'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class UploadMarksScreen extends StatefulWidget {
//   @override
//   _UploadMarksScreenState createState() => _UploadMarksScreenState();
// }

// class _UploadMarksScreenState extends State<UploadMarksScreen> {
//   final _dateController = TextEditingController();
//   final _marksController = TextEditingController();
//   String? _selectedName;
//   List<String> _userNames = [];
//   bool _isLoading = false; // New state variable to handle loading

//   final supabase = Supabase.instance.client;

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserNames(); // Fetch the user names when the screen is initialized
//   }

//   // Function to fetch the list of user names from Supabase
//   Future<void> _fetchUserNames() async {
//     try {
//       final response = await supabase.from('users').select('first_name, last_name');

//       if (response != null) {
//         // Handle error if it exists
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error fetching users: ${response}')),
//         );
//       } else if (response != null && response.isNotEmpty) {
//         // Add each full name (first_name + last_name) to the userNames list
//         setState(() {
//           _userNames = List<String>.from(
//             response.map((user) => '${user['first_name']} ${user['last_name']}')
//           );
//           _isLoading = false; // Stop the loading spinner after data is fetched
//         });
//       } else {
//         // Handle empty result case
//         setState(() {
//           _isLoading = false; // Stop the loading spinner if no users are found
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('No users found')),
//         );
//       }
//     } catch (e) {
//       // Catch any exceptions
//       setState(() {
//         _isLoading = false; // Stop the loading spinner in case of an error
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('An error occurred: $e')),
//       );
//     }
//   }

//   // Function to upload marks to Supabase
//   Future<void> _uploadMarks() async {
//     final name = _selectedName;
//     final date = _dateController.text.trim();
//     final marks = int.tryParse(_marksController.text.trim()) ?? 0;

//     // Validate the input fields
//     if (name == null || date.isEmpty || marks < 0 || marks > 100) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please provide valid input')),
//       );
//       return;
//     }

//     try {
//       // Insert data into Supabase 'marks' table
//       final response = await supabase.from('marks').insert([
//         {
//           'name': name,
//           'marks': marks,
//           'date': date,
//           'period': 'weekly', // Modify this based on the selected period
//         }
//       ]);

//       // Check if the insert was successful
//       if (response.error == null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Marks uploaded successfully')),
//         );
//         _clearFields();
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error: ${response.error!.message}')),
//         );
//       }
//     } catch (e) {
//       // Catch any exceptions and show a snackbar with the error message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('An error occurred: $e')),
//       );
//     }
//   }

//   // Function to clear the input fields after successful submission
//   void _clearFields() {
//     _selectedName = null;
//     _dateController.clear();
//     _marksController.clear();
//   }

//   // Function to show date picker dialog
//   Future<void> _selectDate(BuildContext context) async {
//     DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );
//     if (pickedDate != null) {
//       // Format the selected date to 'YYYY-MM-DD' format
//       setState(() {
//         _dateController.text = "${pickedDate.toLocal()}".split(' ')[0]; // Date in YYYY-MM-DD format
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Upload Marks')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Show a loader until user names are fetched
//             if (_isLoading = false) 
//               Center(child: CircularProgressIndicator())
//             else
//               // Dropdown for selecting user name
//               DropdownButton<String>(
//                 value: _selectedName,
//                 hint: Text('Select User'),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     _selectedName = newValue;
//                   });
//                 },
//                 items: _userNames.map<DropdownMenuItem<String>>((String name) {
//                   return DropdownMenuItem<String>(
//                     value: name,
//                     child: Text(name),
//                   );
//                 }).toList(),
//               ),
//             SizedBox(height: 10),

//             // Date picker for selecting the date
//             TextField(
//               controller: _dateController,
//               decoration: InputDecoration(
//                 labelText: 'Date',
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.calendar_today),
//                   onPressed: () => _selectDate(context),
//                 ),
//               ),
//               readOnly: true, // Make it readonly so that the date picker is the only way to change the date
//             ),
//             SizedBox(height: 10),

//             // Marks input field
//             TextField(
//               controller: _marksController,
//               decoration: InputDecoration(labelText: 'Marks (0-100)'),
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(height: 20),

//             // Button to upload marks
//             ElevatedButton(
//               onPressed: _uploadMarks,
//               child: Text('Upload Marks'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class UploadMarksScreen extends StatefulWidget {
//   @override
//   _UploadMarksScreenState createState() => _UploadMarksScreenState();
// }

// class _UploadMarksScreenState extends State<UploadMarksScreen> {
//   final _supabaseClient = Supabase.instance.client;
//   List<String> userNames = [];
//   String? selectedUser;
//   String? marks;

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserNames();
//   }

//   // Fetch user names from the Supabase 'users' table
//   Future<void> _fetchUserNames() async {
//     final response = await _supabaseClient
//         .from('users')
//         .select('first_name, last_name');

    
//       final List<dynamic> data = response;
//       setState(() {
//         userNames = data
//             .map((user) =>
//                 '${user['first_name']} ${user['last_name']}')
//             .toList();
//       });
//     } else {
//       // Handle errors
//       print('Error fetching users: ${response}');
//     }
//   }

//   // Upload marks for the selected user
//   Future<void> _uploadMarks() async {
//     if (selectedUser != null && marks != null && marks!.isNotEmpty) {
//       final response = await _supabaseClient
//           .from('marks')
//           .insert({
//             'user_name': selectedUser,
//             'marks': marks,
//           });

//       if (response.error == null) {
//         // Marks uploaded successfully
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('Marks uploaded successfully'),
//         ));
//       } else {
//         // Handle errors
//         print('Error uploading marks: ${response.error!.message}');
//       }
//     } else {
//       // Show error if fields are empty
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('Please fill in all fields'),
//       ));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Upload Marks'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Dropdown to select user
//             DropdownButton<String>(
//               hint: Text('Select User'),
//               value: selectedUser,
//               onChanged: (String? newValue) {
//                 setState(() {
//                   selectedUser = newValue;
//                 });
//               },
//               items: userNames.map((String user) {
//                 return DropdownMenuItem<String>(
//                   value: user,
//                   child: Text(user),
//                 );
//               }).toList(),
//             ),

//             // TextField to input marks
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Enter Marks',
//               ),
//               keyboardType: TextInputType.number,
//               onChanged: (value) {
//                 setState(() {
//                   marks = value;
//                 });
//               },
//             ),

//             SizedBox(height: 20),

//             // Upload button
//             ElevatedButton(
//               onPressed: _uploadMarks,
//               child: Text('Upload Marks'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class UploadMarksScreen extends StatefulWidget {
//   @override
//   _UploadMarksScreenState createState() => _UploadMarksScreenState();
// }

// class _UploadMarksScreenState extends State<UploadMarksScreen> {
//   final _dateController = TextEditingController();
//   final _marksController = TextEditingController();
//   String? _selectedName;
//   List<String> _userNames = [];
//   List<String> _userName = [];
//   // String? _id;

//   bool _isLoading = false;

//   final supabase = Supabase.instance.client;

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserNames();
//   }

// Future<void> _fetchUserNames() async {
//   setState(() {
//     _isLoading = true;
//   });

//   try {
//     final response = await supabase
//         .from('users')
//         .select('first_name, last_name, center, profile_picture,id');
        
            

//     if (response is List && response.isNotEmpty) {
//       setState(() {

// //         _userName = response
// //             .map<String>((user) => '${user['first_name']} ${user['last_name']}')
// // .toSet()
// //             .toList();


//           // _userNames = List<String>.from(
//           //   response.map((user) => '${user['first_name']} ${user['last_name']}'),
//           // );
         

//         _userNames = response.map<String>((user) {
//           final fullName = '${user['first_name']} ${user['last_name']} (${user['center']})';
//           final profilePicture = user['profile_picture'] ?? '';
          
//           return '$fullName|$profilePicture'; // Combine name and picture URL
//         }).toList();

//         if (!_userNames.any((name) => name.startsWith(_selectedName ?? ''))) {
//           _selectedName = null; // Reset _selectedName if it's invalid
//         }

//         _isLoading = false;
//       });
//     } else {
//       setState(() {
//         _isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('No users found')),
//       );
//     }
//   } catch (e) {
//     setState(() {
//       _isLoading = false;
//     });
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('An error occurred: $e')),
//     );
//   }
// }


//   // Upload marks to Supabase
//   Future<void> _uploadMarks() async {
//     final name = _userNames;
//     final date = _dateController.text.trim();
//     final marks = int.tryParse(_marksController.text.trim()) ?? 0;

//     if (name == null || date.isEmpty || marks < 0 || marks > 100) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please provide valid input')),
//       );
//       return;
//     }

    
//       final response = await supabase.from('marks').insert([
//         {
//           'name': name,
//           'marks': marks,
//           'date': date,
          
//         }
//       ]);

      
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Marks uploaded successfully')),
//         );
//         _clearFields();
      
    
//   }

//   void _clearFields() {
//     setState(() {
//       _selectedName = null;
//       _dateController.clear();
//       _marksController.clear();
//     });
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );

//     if (pickedDate != null) {
//       setState(() {
//         _dateController.text = "${pickedDate.toLocal()}".split(' ')[0];
//       });
//     }
//   }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(title: Text('Upload Marks')),
//     body: Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           if (_isLoading)
//             Center(child: CircularProgressIndicator())
//           else
//             DropdownButton<String>(
//               value: _selectedName,
//               hint: Text('Select User'),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   _selectedName = newValue;
//                 });
//               },
//               items: _userNames.map<DropdownMenuItem<String>>((String userInfo) {
//                 final parts = userInfo.split('|');
//                 final name = parts[0]; // Full name and center
//                 final profilePicture = parts.length > 1 ? parts[1] : '';

//                 return DropdownMenuItem<String>(
//                   value: name,
//                   child: Row(
//                     children: [
//                       // if (profilePicture.isNotEmpty)
//                       //   CircleAvatar(
//                       //     backgroundImage: NetworkImage(profilePicture),
//                       //     radius: 20,
//                       //   )
//                       // else
//                       //   CircleAvatar(
//                       //     backgroundColor: Colors.grey,
//                       //     radius: 20,
//                       //     child: Icon(Icons.person, color: Colors.white),
//                       //   ),
//                       CircleAvatar(
//   backgroundImage: profilePicture.isNotEmpty
//       ? NetworkImage(profilePicture)
//       : null,
//   backgroundColor: Colors.grey,
//   radius: 20,
//   child: profilePicture.isEmpty ? Icon(Icons.person, color: Colors.white) : null,
// ),

//                       SizedBox(width: 10),
//                       Text(name),
//                     ],
//                   ),
//                 );
//               }).toList(),
//             ),
//           SizedBox(height: 10),
//           TextField(
//             controller: _dateController,
//             decoration: InputDecoration(
//               labelText: 'Date',
//               suffixIcon: IconButton(
//                 icon: Icon(Icons.calendar_today),
//                 onPressed: () => _selectDate(context),
//               ),
//             ),
//             readOnly: true,
//           ),
//           SizedBox(height: 10),
//           TextField(
//             controller: _marksController,
//             decoration: InputDecoration(labelText: 'Marks (0-100)'),
//             keyboardType: TextInputType.number,
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: _uploadMarks,
//             child: Text('Upload Marks'),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// }
// import 'package:flutter/material.dart';
// import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class UploadMarksScreen extends StatefulWidget {
//   @override
//   _UploadMarksScreenState createState() => _UploadMarksScreenState();
// }

// class _UploadMarksScreenState extends State<UploadMarksScreen> {
//   final _dateController = TextEditingController();
//   final _marksController = TextEditingController();
//   String? _selectedName;
//   List<String> _userNames = [];
//   List<Map<String, dynamic>> _todayMarks = []; // To store today's marks
//   bool _isLoading = false;

//   final supabase = Supabase.instance.client;

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserNames();
//     _fetchTodayMarks();
//   }

//   Future<void> _fetchUserNames() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final response = await supabase
//           .from('users')
//           .select('first_name, last_name, center, profile_picture');

//       if (response is List && response.isNotEmpty) {
//         setState(() {
//           _userNames = response.map<String>((user) {
//             final fullName =
//                 '${user['first_name']} ${user['last_name']} (${user['center']})';
//             final profilePicture = user['profile_picture'] ?? '';
//             return '$fullName|$profilePicture'; // Combine name and picture URL
//           }).toList();
//           _isLoading = false;
//         });
//       } else {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   Future<void> _fetchTodayMarks() async {
//     try {
//       final today = DateTime.now();
//       final formattedDate = "${today.toLocal()}".split(' ')[0];

//       final response = await supabase
//           .from('marks')
//           .select('name, marks, user(profile_picture)')
//           .eq('date', formattedDate);

//       if (response is List) {
//         setState(() {
//           _todayMarks = response.cast<Map<String, dynamic>>();
//         });
//       }
//     } catch (e) {
//       // Handle error
//     }
//   }

//   Future<void> _uploadMarks() async {
//     final date = _dateController.text.trim();
//     final marks = int.tryParse(_marksController.text.trim()) ?? 0;

//     if (_selectedName == null || date.isEmpty || marks < 0 || marks > 100) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please provide valid input')),
//       );
//       return;
//     }

//     try {
//       await supabase.from('marks').insert([
//         {
//           'name': _selectedName,
//           'marks': marks,
//           'date': date,
//         }
//       ]);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Marks uploaded successfully')),
//       );
//       _fetchTodayMarks(); // Refresh today's marks
//       _clearFields();
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error uploading marks')),
//       );
//     }
//   }

//   void _clearFields() {
//     setState(() {
//       _selectedName = null;
//       _dateController.clear();
//       _marksController.clear();
//     });
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );

//     if (pickedDate != null) {
//       setState(() {
//         _dateController.text = "${pickedDate.toLocal()}".split(' ')[0];
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Upload Marks')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             DropdownButton<String>(
//               value: _selectedName,
//               hint: Text('Select User'),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   _selectedName = newValue;
//                 });
//               },
//               items: _userNames.map<DropdownMenuItem<String>>((String userInfo) {
//                 final parts = userInfo.split('|');
//                 final name = parts[0]; // Full name and center
//                 final profilePicture = parts.length > 1 ? parts[1] : '';

//                 return DropdownMenuItem<String>(
//                   value: name,
//                   child: Row(
//                     children: [
//                       CircleAvatar(
//                         backgroundImage: profilePicture.isNotEmpty
//                             ? NetworkImage(profilePicture)
//                             : null,
//                         backgroundColor: Colors.grey,
//                         radius: 20,
//                         child: profilePicture.isEmpty
//                             ? Icon(Icons.person, color: Colors.white)
//                             : null,
//                       ),
//                       SizedBox(width: 10),
//                       Text(name),
//                     ],
//                   ),
//                 );
//               }).toList(),
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: _dateController,
//               decoration: InputDecoration(
//                 labelText: 'Date',
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.calendar_today),
//                   onPressed: () => _selectDate(context),
//                 ),
//               ),
//               readOnly: true,
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: _marksController,
//               decoration: InputDecoration(labelText: 'Marks (0-100)'),
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _uploadMarks,
//               child: Text('Upload Marks'),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _todayMarks.length,
//                 itemBuilder: (context, index) {
//                   final user = _todayMarks[index];
//                   final profilePicture = user['user']['profile_picture'] ?? '';
//                   final name = user['name'];
//                   final marks = user['marks'];

//                   return Card(
//                     child: ListTile(
//                       leading: CircleAvatar(
//                         backgroundImage: profilePicture.isNotEmpty
//                             ? NetworkImage(profilePicture)
//                             : null,
//                         backgroundColor: Colors.grey,
//                         child: profilePicture.isEmpty
//                             ? Icon(Icons.person, color: Colors.white)
//                             : null,
//                       ),
//                       title: Text(name),
//                       subtitle: LiquidLinearProgressIndicator(
//                         value: marks / 100,
//                         backgroundColor: Colors.grey.shade200,
//                         valueColor:
//                             AlwaysStoppedAnimation(Colors.blueAccent),
//                         borderRadius: 5.0,
//                         center: Text('$marks/100'),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class UploadMarksScreen extends StatefulWidget {
//   @override
//   _UploadMarksScreenState createState() => _UploadMarksScreenState();
// }

// class _UploadMarksScreenState extends State<UploadMarksScreen> {
//   final _dateController = TextEditingController();
//   final _marksController = TextEditingController();
//   String? _selectedName;
//   List<String> _userNames = [];
//   List<Map<String, dynamic>> _todayMarks = []; // To store today's marks
//   bool _isLoading = false;

//   final supabase = Supabase.instance.client;

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserNames();
//     _fetchTodayMarks();
//   }

//   Future<void> _fetchUserNames() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final response = await supabase
//           .from('users')
//           .select('first_name, last_name, center, profile_picture');

//       if (response is List && response.isNotEmpty) {
//         setState(() {
//           _userNames = response.map<String>((user) {
//             final fullName =
//                 '${user['first_name']} ${user['last_name']} (${user['center']})';
//             final profilePicture = user['profile_picture'] ?? '';
//             return '$fullName|$profilePicture'; // Combine name and picture URL
//           }).toList();
//           _isLoading = false;
//         });
//       } else {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   Future<void> _fetchTodayMarks() async {
//     try {
//       final today = DateTime.now();
//       final formattedDate = "${today.toLocal()}".split(' ')[0];

//       final response = await supabase
//           .from('marks')
//           .select('name, marks, user(profile_picture)')
//           .eq('date', formattedDate);

//       if (response is List) {
//         setState(() {
//           _todayMarks = response.cast<Map<String, dynamic>>();
//         });
//       }
//     } catch (e) {
//       // Handle error
//     }
//   }

//   Future<void> _uploadMarks() async {
//     final date = _dateController.text.trim();
//     final marks = int.tryParse(_marksController.text.trim()) ?? 0;

//     if (_selectedName == null || date.isEmpty || marks < 0 || marks > 100) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please provide valid input')),
//       );
//       return;
//     }

//     try {
//       await supabase.from('marks').insert([
//         {
//           'name': _selectedName,
//           'marks': marks,
//           'date': date,
//         }
//       ]);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Marks uploaded successfully')),
//       );
//       _fetchTodayMarks(); // Refresh today's marks
//       _clearFields();
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error uploading marks')),
//       );
//     }
//   }

//   void _clearFields() {
//     setState(() {
//       _selectedName = null;
//       _dateController.clear();
//       _marksController.clear();
//     });
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );

//     if (pickedDate != null) {
//       setState(() {
//         _dateController.text = "${pickedDate.toLocal()}".split(' ')[0];
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Upload Marks')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             DropdownButton<String>(
//               value: _selectedName,
//               hint: Text('Select User'),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   _selectedName = newValue;
//                 });
//               },
//               items: _userNames.map<DropdownMenuItem<String>>((String userInfo) {
//                 final parts = userInfo.split('|');
//                 final name = parts[0]; // Full name and center
//                 final profilePicture = parts.length > 1 ? parts[1] : '';

//                 return DropdownMenuItem<String>(
//                   value: name,
//                   child: Row(
//                     children: [
//                       CircleAvatar(
//                         backgroundImage: profilePicture.isNotEmpty
//                             ? NetworkImage(profilePicture)
//                             : null,
//                         backgroundColor: Colors.grey,
//                         radius: 20,
//                         child: profilePicture.isEmpty
//                             ? Icon(Icons.person, color: Colors.white)
//                             : null,
//                       ),
//                       SizedBox(width: 10),
//                       Text(name),
//                     ],
//                   ),
//                 );
//               }).toList(),
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: _dateController,
//               decoration: InputDecoration(
//                 labelText: 'Date',
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.calendar_today),
//                   onPressed: () => _selectDate(context),
//                 ),
//               ),
//               readOnly: true,
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: _marksController,
//               decoration: InputDecoration(labelText: 'Marks (0-100)'),
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _uploadMarks,
//               child: Text('Upload Marks'),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _todayMarks.length,
//                 itemBuilder: (context, index) {
//                   final user = _todayMarks[index];
//                   final profilePicture = user['user']['profile_picture'] ?? '';
//                   final name = user['name'];
//                   final marks = user['marks'];

//                   return Card(
//                     child: ListTile(
//                       leading: CircleAvatar(
//                         backgroundImage: profilePicture.isNotEmpty
//                             ? NetworkImage(profilePicture)
//                             : null,
//                         backgroundColor: Colors.grey,
//                         child: profilePicture.isEmpty
//                             ? Icon(Icons.person, color: Colors.white)
//                             : null,
//                       ),
//                       title: Text(name),
//                       subtitle: LiquidLinearProgressIndicator(
//                         value: marks / 100,
//                         backgroundColor: Colors.grey.shade200,
//                         valueColor:
//                             AlwaysStoppedAnimation(Colors.blueAccent),
//                         borderRadius: 5.0,
//                         center: Text('$marks/100'),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// class _UploadMarksScreenState extends State<UploadMarksScreen> {
//   final _dateController = TextEditingController();
//   final _marksController = TextEditingController();
//   String? _selectedName;
//   List<String> _userNames = [];
//   List<Map<String, dynamic>> _todayMarks = []; // Store marks from last 24 hours
//   bool _isLoading = false;

//   final supabase = Supabase.instance.client;

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserNames();
//     _fetchTodayMarks();
//   }
    
//   Future<void> _uploadMarks() async {
//     final date = _dateController.text.trim();
//     final marks = int.tryParse(_marksController.text.trim()) ?? 0;

//     if (_selectedName == null || date.isEmpty || marks < 0 || marks > 100) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please provide valid input')),
//       );
//       return;
//     }

//     try {
//       await supabase.from('marks').insert([
//         {
//           'name': _selectedName,
//           'marks': marks,
//           'date': date,
          
//         }
//       ]);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Marks uploaded successfully')),
//       );
//       // Refresh the list after uploading
//       _clearFields();
//       _fetchTodayMarks(); 
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error uploading marks')),
//       );
//     }
//   }

//   Future<void> _fetchUserNames() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final response = await supabase
//           .from('users')
//           .select('first_name, last_name, center, profile_picture,id');
         

//       if (response is List && response.isNotEmpty) {
//         setState(() {
//           _userNames = response.map<String>((user) {
//             final fullName =
//                 '${user['first_name']} ${user['last_name']} (${user['center']})';
//             final profilePicture = user['profile_picture'] ?? '';
            
//             return '$fullName|$profilePicture';
//           }).toList();
//           _isLoading = false;
//         });
//       } else {
//         setState(() {
//           _isLoading = false;
          
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

// // Future<void> _uploadMarks() async {
// //   final date = _dateController.text.trim();
// //   final marks = int.tryParse(_marksController.text.trim()) ?? 0;

// //   if (_selectedName == null || date.isEmpty || marks < 0 || marks > 100) {
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       SnackBar(content: Text('Please provide valid input')),
// //     );
// //     return;
// //   }

// //   try {
// //     // Assuming you have the current user's UID
// //     final userId = supabase.auth.currentUser?.id;

// //     if (userId == null) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('User not logged in')),
// //       );
// //       return;
// //     }

// //     await supabase.from('marks').insert([
// //       {
// //         'name': _selectedName,
// //         'marks': marks,
// //         'date': date,
// //         'user_id': userId, // Include the UID here
// //       }
// //     ]);

// //     ScaffoldMessenger.of(context).showSnackBar(
// //       SnackBar(content: Text('Marks uploaded successfully')),
// //     );
// //     // Refresh the list after uploading
// //     _clearFields();
// //     _fetchTodayMarks();
// //   } catch (e) {
// //     ScaffoldMessenger.of(context).showSnackBar(
// //       SnackBar(content: Text('Error uploading marks')),
// //     );
// //   }
// // }



//   Future<void> _fetchTodayMarks() async {
//     try {
//       // final now = DateTime.now();
//       final now = DateTime.now().toUtc();
//       final yesterday = now.subtract(Duration(hours: 24));

//       final response = await supabase
//           .from('marks')
//           .select('name, marks, user(profile_picture), created_at')
//           .gte('created_at', yesterday) // Fetch records from last 24 hours
//           .order('created_at', ascending: false);

//       if (response is List) {
//         setState(() {
//           _todayMarks = response.cast<Map<String, dynamic>>();
//         });
//       }
//     } catch (e) {
//   setState(() {
//     _isLoading = false;
//   });
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(content: Text('Error fetching user names')),
//   );
// }

//   }


//   void _clearFields() {
//     setState(() {
//       _selectedName = null;
//       _dateController.clear();
//       _marksController.clear();
//     });
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );

//     if (pickedDate != null) {
//       setState(() {
//         _dateController.text = "${pickedDate.toLocal()}".split(' ')[0];
//       });
//     }
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     appBar: AppBar(title: Text('Upload Marks')),
//   //     body: Padding(
//   //       padding: const EdgeInsets.all(16.0),
//   //       child: Column(
//   //         children: [
//   //           DropdownButton<String>(
//   //             value: _selectedName,
//   //             hint: Text('Select User'),
//   //             onChanged: (String? newValue) {
//   //               setState(() {
//   //                 _selectedName = newValue;
//   //               });
//   //             },
//   //             items: _userNames.map<DropdownMenuItem<String>>((String userInfo) {
//   //               final parts = userInfo.split('|');
//   //               final name = parts[0];
//   //               final profilePicture = parts.length > 1 ? parts[1] : '';

//   //               return DropdownMenuItem<String>(
//   //                 value: name,
//   //                 child: Row(
//   //                   children: [
//   //                     CircleAvatar(
//   //                       backgroundImage: profilePicture.isNotEmpty
//   //                           ? NetworkImage(profilePicture)
//   //                           : null,
//   //                       backgroundColor: Colors.grey,
//   //                       radius: 20,
//   //                       child: profilePicture.isEmpty
//   //                           ? Icon(Icons.person, color: Colors.white)
//   //                           : null,
//   //                     ),
//   //                     SizedBox(width: 10),
//   //                     Text(name),
//   //                   ],
//   //                 ),
//   //               );
//   //             }).toList(),
//   //           ),
//   //           SizedBox(height: 10),
//   //           TextField(
//   //             controller: _dateController,
//   //             decoration: InputDecoration(
//   //               labelText: 'Date',
//   //               suffixIcon: IconButton(
//   //                 icon: Icon(Icons.calendar_today),
//   //                 onPressed: () => _selectDate(context),
//   //               ),
//   //             ),
//   //             readOnly: true,
//   //           ),
//   //           SizedBox(height: 10),
//   //           TextField(
//   //             controller: _marksController,
//   //             decoration: InputDecoration(labelText: 'Marks (0-100)'),
//   //             keyboardType: TextInputType.number,
//   //           ),
//   //           SizedBox(height: 20),
//   //           ElevatedButton(
//   //             onPressed: _uploadMarks,
//   //             child: Text('Upload Marks'),
//   //           ),
//   //           SizedBox(height: 20),
//   //           Expanded(
//   //             child: ListView.builder(
//   //               itemCount: _todayMarks.length,
//   //               itemBuilder: (context, index) {
//   //                 final user = _todayMarks[index];
//   //                 final profilePicture = user['user']['profile_picture'] ?? '';
//   //                 final name = user['name'];
//   //                 final marks = user['marks'];

//   //                 return Card(
//   //                   child: ListTile(
//   //                     leading: CircleAvatar(
//   //                       backgroundImage: profilePicture.isNotEmpty
//   //                           ? NetworkImage(profilePicture)
//   //                           : null,
//   //                       backgroundColor: Colors.grey,
//   //                       child: profilePicture.isEmpty
//   //                           ? Icon(Icons.person, color: Colors.white)
//   //                           :
//   //                           null,
//   //                     ),
//   //                     title: Text(name),
//   //                     subtitle: LiquidLinearProgressIndicator(
//   //                       value: marks / 100,
//   //                       backgroundColor: Colors.grey.shade200,
//   //                       valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
//   //                       borderRadius: 5.0,
//   //                       center: Text('$marks/100'),
//   //                     ),
//   //                   ),
//   //                 );
//   //               },
//   //             ),
//   //           ),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(title: Text('Upload Marks')),
//     body: Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           // Dropdown for selecting a user
//           DropdownButton<String>(
//             value: _selectedName,
//             hint: Text('Select User'),
//             onChanged: (String? newValue) {
//               setState(() {
//                 _selectedName = newValue;
//               });
//             },
//             items: _userNames.map<DropdownMenuItem<String>>((String userInfo) {
//               final parts = userInfo.split('|');
//               final name = parts[0];
//               final profilePicture = parts.length > 1 ? parts[1] : '';

//               return DropdownMenuItem<String>(
//                 value: name,
//                 child: Row(
//                   children: [
//                     CircleAvatar(
//                       backgroundImage: profilePicture.isNotEmpty
//                           ? NetworkImage(profilePicture)
//                           : null,
//                       backgroundColor: Colors.grey,
//                       radius: 20,
//                       child: profilePicture.isEmpty
//                           ? Icon(Icons.person, color: Colors.white)
//                           : null,
//                     ),
//                     SizedBox(width: 10),
//                     Text(name),
//                   ],
//                 ),
//               );
//             }).toList(),
//           ),
//           SizedBox(height: 10),

//           // Date picker field
//           TextField(
//             controller: _dateController,
//             decoration: InputDecoration(
//               labelText: 'Date',
//               suffixIcon: IconButton(
//                 icon: Icon(Icons.calendar_today),
//                 onPressed: () => _selectDate(context),
//               ),
//             ),
//             readOnly: true,
//           ),
//           SizedBox(height: 10),

//           // Marks input field
//           TextField(
//             controller: _marksController,
//             decoration: InputDecoration(labelText: 'Marks (0-100)'),
//             keyboardType: TextInputType.number,
//           ),
//           SizedBox(height: 20),

//           // Upload Marks button
//           ElevatedButton(
//             onPressed: _uploadMarks,
//             child: Text('Upload Marks'),
//           ),
//           SizedBox(height: 20),

//           // Display today's uploaded marks
//           Expanded(
//             child: _isLoading
//                 ? Center(child: CircularProgressIndicator())
//                 : ListView.builder(
//                     itemCount: _todayMarks.length,
//                     itemBuilder: (context, index) {
//                       final user = _todayMarks[index];
//                       final profilePicture = user['user']['profile_picture'] ?? '';
//                       final name = user['name'];
//                       final marks = user['marks'];

//                       return
//                       Card(
//   margin: EdgeInsets.symmetric(vertical: 8.0),
//   child: ListTile(
//     leading: CircleAvatar(
//       backgroundImage: profilePicture.isNotEmpty
//           ? NetworkImage(profilePicture)
//           : null,
//       backgroundColor: Colors.grey,
//       child: profilePicture.isEmpty ? Icon(Icons.person, color: Colors.white) : null,
//     ),
//     title: Text(name),
//     subtitle: Padding(
//       padding: EdgeInsets.symmetric(vertical: 8.0),
//       child: LiquidLinearProgressIndicator(
//         value: marks / 100,
//         backgroundColor: Colors.grey.shade200,
//         valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
//         borderRadius: 5.0,
//         center: Text('$marks/100'),
//       ),
//     ),
//   ),
// );
 
//                       // Card(
//                       //   child: ListTile(
//                       //     leading: CircleAvatar(
//                       //       backgroundImage: profilePicture.isNotEmpty
//                       //           ? NetworkImage(profilePicture)
//                       //           : null,
//                       //       backgroundColor: Colors.grey,
//                       //       child: profilePicture.isEmpty
//                       //           ? Icon(Icons.person, color: Colors.white)
//                       //           : null,
//                       //     ),
//                       //     title: Text(name),
//                       //     subtitle: LiquidLinearProgressIndicator(
//                       //       value: marks / 100,
//                       //       backgroundColor: Colors.grey.shade200,
//                       //       valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
//                       //       borderRadius: 5.0,
//                       //       center: Text('$marks/100'),
//                       //     ),
//                       //   ),
//                       // );
//                     },
//                   ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
// }
// class _UploadMarksScreenState extends State<UploadMarksScreen> {
//   final _dateController = TextEditingController();
//   final _marksController = TextEditingController();
//   String? _selectedId; // Store selected user's ID
//   List<Map<String, dynamic>> _userNames = []; // Store both name and id
//   List<Map<String, dynamic>> _todayMarks = [];
//   bool _isLoading = false;

//   final supabase = Supabase.instance.client;

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserNames();
//     _fetchTodayMarks();
//   }
  
//   Future<void> _fetchTodayMarks() async {
//     try {
//       // final now = DateTime.now();
//       final now = DateTime.now().toUtc();
//       final yesterday = now.subtract(Duration(hours: 24));

//       final response = await supabase
//           .from('marks')
//           .select('name, marks, user(profile_picture), created_at')
//           .gte('created_at', yesterday) // Fetch records from last 24 hours
//           .order('created_at', ascending: false);

//       if (response is List) {
//         setState(() {
//           _todayMarks = response.cast<Map<String, dynamic>>();
//         });
//       }
//     } catch (e) {
//   setState(() {
//     _isLoading = false;
//   });
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(content: Text('Error fetching user names')),
//   );
// }

//   }

//   Future<void> _uploadMarks() async {
//     final date = _dateController.text.trim();
//     final marks = int.tryParse(_marksController.text.trim()) ?? 0;

//     if (_selectedId == null || date.isEmpty || marks < 0 || marks > 100) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please provide valid input')),
//       );
//       return;
//     }
//         if (_selectedName == null || date.isEmpty || marks < 0 || marks > 100) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please provide valid input')),
//       );
//       return;
//     }


//     try {
//       await supabase.from('marks').insert([
//         {
//           'name': _selectedName,
//           'uid': _selectedId, // Use selected user ID
//           'marks': marks,
//           'date': date,
//         }
//       ]);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Marks uploaded successfully')),
//       );
//       _clearFields();
//       _fetchTodayMarks();
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error uploading marks: $e')),
//       );
//     }
//   }

//   Future<void> _fetchUserNames() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final response = await supabase
//           .from('users')
//           .select('id, first_name, last_name, center, profile_picture');

//       if (response is List && response.isNotEmpty) {
//         setState(() {
//           _userNames = response.map<Map<String, dynamic>>((user) {
//             return {
//               'id': user['id'],
//               'name':
//                   '${user['first_name']} ${user['last_name']} (${user['center']})',
//               'profilePicture': user['profile_picture'] ?? '',
//             };
//           }).toList();
//           _isLoading = false;
//         });
//       } else {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error fetching user names')),
//       );
//     }
//   }

//   void _clearFields() {
//     setState(() {
//       _selectedId = null;
//       _dateController.clear();
//       _marksController.clear();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Upload Marks')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             DropdownButton<String>(
//               value: _selectedId,
//               hint: Text('Select User'),
//               onChanged: (String? newId) {
//                 setState(() {
//                   _selectedId = newId; // Set selected user ID
//                 });
//               },
//               items: _userNames.map<DropdownMenuItem<String>>((user) {
//                 return DropdownMenuItem<String>(
//                   value: user['id'], // Use ID as the value
//                   child: Row(
//                     children: [
//                       CircleAvatar(
//                         backgroundImage: user['profilePicture'].isNotEmpty
//                             ? NetworkImage(user['profilePicture'])
//                             : null,
//                         backgroundColor: Colors.grey,
//                         radius: 20,
//                         child: user['profilePicture'].isEmpty
//                             ? Icon(Icons.person, color: Colors.white)
//                             : null,
//                       ),
//                       SizedBox(width: 10),
//                       Text(user['name']),
//                     ],
//                   ),
//                 );
//               }).toList(),
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: _dateController,
//               decoration: InputDecoration(
//                 labelText: 'Date',
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.calendar_today),
//                   onPressed: () async {
//                     DateTime? pickedDate = await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime(2000),
//                       lastDate: DateTime(2101),
//                     );

//                     if (pickedDate != null) {
//                       setState(() {
//                         _dateController.text =
//                             "${pickedDate.toLocal()}".split(' ')[0];
//                       });
//                     }
//                   },
//                 ),
//               ),
//               readOnly: true,
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: _marksController,
//               decoration: InputDecoration(labelText: 'Marks (0-100)'),
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _uploadMarks,
//               child: Text('Upload Marks'),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: _isLoading
//                   ? Center(child: CircularProgressIndicator())
//                   : ListView.builder(
//                       itemCount: _todayMarks.length,
//                       itemBuilder: (context, index) {
//                         final user = _todayMarks[index];
//                         final profilePicture =
//                             user['user']['profile_picture'] ?? '';
//                         final name = user['name'];
//                         final marks = user['marks'];

//                         return Card(
//                           margin: EdgeInsets.symmetric(vertical: 8.0),
//                           child: ListTile(
//                             leading: CircleAvatar(
//                               backgroundImage: profilePicture.isNotEmpty
//                                   ? NetworkImage(profilePicture)
//                                   : null,
//                               backgroundColor: Colors.grey,
//                               child: profilePicture.isEmpty
//                                   ? Icon(Icons.person, color: Colors.white)
//                                   : null,
//                             ),
//                             title: Text(name),
//                             subtitle: LiquidLinearProgressIndicator(
//                               value: marks / 100,
//                               backgroundColor: Colors.grey.shade200,
//                               valueColor: AlwaysStoppedAnimation(
//                                   Colors.blueAccent),
//                               borderRadius: 5.0,
//                               center: Text('$marks/100'),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// class _UploadMarksScreenState extends State<UploadMarksScreen> {
//   final _dateController = TextEditingController();
//   final _marksController = TextEditingController();
//   String? _selectedName;
//   String? _selectedUID; // To store the UID of the selected user
//   List<Map<String, dynamic>> _users = []; // Updated to store user data
//   List<Map<String, dynamic>> _todayMarks = [];
//   bool _isLoading = false;

//   final supabase = Supabase.instance.client;

//   @override
//   void initState() {
//     super.initState();
//     _fetchUserNames();
//     _fetchTodayMarks();
//   }

//   Future<void> _fetchUserNames() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final response = await supabase.from('users').select('first_name, last_name, center, profile_picture, id');

//       if (response is List && response.isNotEmpty) {
//         setState(() {
//           _users = response.map<Map<String, dynamic>>((user) {
//             return {
//               'name': '${user['first_name']} ${user['last_name']} (${user['center']})',
//               'id': user['id'],
//               'profile_picture': user['profile_picture'] ?? '',
//             };
//           }).toList();
//           _isLoading = false;
//         });
//       } else {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error fetching user names')),
//       );
//     }
//   }

// //   Future<void> _uploadMarks() async {
// //     final date = _dateController.text.trim();
// //     final marks = int.tryParse(_marksController.text.trim()) ?? 0;

// //     if (_selectedName == null || _selectedUID == null || date.isEmpty || marks < 0 || marks > 100) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('Please provide valid input')),
// //       );
// //       return;
// //     }

// //     try {
// //       await supabase.from('marks').insert([
// //         {
          
// //           'name': _selectedName,
// //           'uid': _selectedUID, // Add UID here
// //           'marks': marks,
// //           'date': date,
// //         }
// //       ]);

// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('Marks uploaded successfully')),
// //       );

// //       _clearFields();
// //       _fetchTodayMarks();
// //     } catch (e) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('Error uploading marks')),
// //       );
// //     }
// //   }
//     Future<void> _fetchTodayMarks() async {
//     try {
//       // final now = DateTime.now();
//       final now = DateTime.now().toUtc();
//       final yesterday = now.subtract(Duration(hours: 24));

//       final response = await supabase
//           .from('marks')
//           .select('name, marks, user(profile_picture), created_at')
//           .gte('created_at', yesterday) // Fetch records from last 24 hours
//           .order('created_at', ascending: false);

//       if (response is List) {
//         setState(() {
//           _todayMarks = response.cast<Map<String, dynamic>>();
//         });
//       }
//     } catch (e) {
//   setState(() {
//     _isLoading = false;
//   });
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(content: Text('Error fetching user names')),
//   );
// }

//   }
// Future<void> _uploadMarks() async {
//   final date = _dateController.text.trim();
//   final marks = int.tryParse(_marksController.text.trim()) ?? 0;

//   // Fetch the selected user's data
//   final selectedUser = _users.firstWhere(
//     (user) => user['name'] == _selectedName,
//     orElse: () => {},
//   );

//   if (_selectedName == null || _selectedUID == null || date.isEmpty || marks < 0 || marks > 100) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Please provide valid input')),
//     );
//     return;
//   }

//   try {
//     await supabase.from('marks').insert([
//       {
//         'name': _selectedName,
//         'uid': _selectedUID,
//         'marks': marks,
//         'date': date,
//         'profile_picture': selectedUser['profile_picture'], // Include profile picture URL
//       }
//     ]);

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Marks uploaded successfully')),
//     );

//     _clearFields();
//     _fetchTodayMarks();
//   } catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Error uploading marks')),
//     );
//   }
// }


//   void _clearFields() {
//     setState(() {
//       _selectedName = null;
//       _selectedUID = null;
//       _dateController.clear();
//       _marksController.clear();
//     });
//   }
//   Future<void> _selectDate(BuildContext context) async {
//   final DateTime? pickedDate = await showDatePicker(
//     context: context,
//     initialDate: DateTime.now(),
//     firstDate: DateTime(2000), // Earliest date the user can pick
//     lastDate: DateTime(2100), // Latest date the user can pick
//   );

//   if (pickedDate != null) {
//     setState(() {
//       _dateController.text = "${pickedDate.toLocal()}".split(' ')[0]; // Format to YYYY-MM-DD
//     });
//   }
// }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Upload Marks')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Dropdown for selecting a user
//             DropdownButton<String>(
//               value: _selectedName,
//               hint: Text('Select User'),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   _selectedName = newValue;
//                   _selectedUID = _users.firstWhere((user) => user['name'] == newValue)['id'];
//                 });
//               },
//               items: _users.map<DropdownMenuItem<String>>((user) {
//                 return DropdownMenuItem<String>(
//                   value: user['name'],
//                   child: Row(
//                     children: [
//                       CircleAvatar(
//                         backgroundImage: user['profile_picture'].isNotEmpty
//                             ? NetworkImage(user['profile_picture'])
//                             : null,
//                         backgroundColor: Colors.grey,
//                         radius: 20,
//                         child: user['profile_picture'].isEmpty
//                             ? Icon(Icons.person, color: Colors.white)
//                             : null,
//                       ),
//                       SizedBox(width: 10),
//                       Text(user['name']),
//                     ],
//                   ),
//                 );
//               }).toList(),
//             ),
//             SizedBox(height: 10),

//             // Date picker field
//             TextField(
//               controller: _dateController,
//               decoration: InputDecoration(
//                 labelText: 'Date',
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.calendar_today),
//                   onPressed: () => _selectDate(context),
//                 ),
//               ),
//               readOnly: true,
//             ),
//             SizedBox(height: 10),

//             // Marks input field
//             TextField(
//               controller: _marksController,
//               decoration: InputDecoration(labelText: 'Marks (0-100)'),
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(height: 20),

//             // Upload Marks button
//             ElevatedButton(
//               onPressed: _uploadMarks,
//               child: Text('Upload Marks'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// Future<void> _fetchRecentMarks() async {
//   setState(() {
//     _isLoading = true;
//   });

//   try {
//     final response = await supabase.from('marks').select('name, marks, profile_picture, id');

//     setState(() {
//       _todayMarks = response.map<Map<String, dynamic>>((mark) {
//         return {
//           'name': '${mark['name']}',
//           'id': mark['id'],
//           'profile_picture': mark['profile_picture'] ?? '',
//           'marks': mark['marks'] ?? 'no',
//         };
//       }).toList();
//     });
//   } catch (error) {
//     print('Error fetching recent marks: $error');
//   } finally {
//     setState(() {
//       _isLoading = false;
//     });
//   }
// }
// Future<void> _fetchRecentMarks() async {
//   setState(() {
//     _isLoading = true;
//   });

//   try {
//     // Calculate the timestamp for 24 hours ago
//     final DateTime now = DateTime.now();
//     final DateTime twentyFourHoursAgo = now.subtract(Duration(hours: 24));

//     // Query marks with a created_at timestamp within the last 24 hours
//     final response = await supabase
//         .from('marks')
//         .select('name, marks, profile_picture, id, created_at')
//         .gte('created_at', twentyFourHoursAgo.toIso8601String());

//     // Map the response to a list of marks
//     setState(() {
//       _todayMarks = response.map<Map<String, dynamic>>((mark) {
//         return {
//           'name': mark['name'],
//           'id': mark['id'],
//           'profile_picture': mark['profile_picture'] ?? '',
//           'marks': mark['marks'] ?? 'no',
//           'created_at': mark['created_at'],
//         };
//       }).toList();
//     });
//   } catch (error) {
//     print('Error fetching recent marks: $error');
//   } finally {
//     setState(() {
//       _isLoading = false;
//     });
//   }
// }

    
  
  

//     Future<void> _fetchTodayMarks() async {
//     try {
//       // final now = DateTime.now();
//       final now = DateTime.now().toUtc();
//       final yesterday = now.subtract(Duration(hours: 24));

//       final response = await supabase
//           .from('marks')
//           .select('name, marks, user(profile_picture), created_at')
//           .gte('created_at', yesterday) // Fetch records from last 24 hours
//           .order('created_at', ascending: false);

//       if (response is List) {
//         setState(() {
//           _todayMarks = response.cast<Map<String, dynamic>>();
//         });
//       }
//     } catch (e) {
//   setState(() {
//     _isLoading = false;
//   });
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(content: Text('Welcome ')),
//   );
// }

//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Upload Marks')),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Select User:',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 8),
//                   DropdownButton<String>(
//                     isExpanded: true,
//                     value: _selectedName,
//                     hint: Text('Select User'),
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         _selectedName = newValue;
//                         _selectedUID = _users.firstWhere((user) => user['name'] == newValue)['id'];
//                       });
//                     },
//                     items: _users.map<DropdownMenuItem<String>>((user) {
//                       return DropdownMenuItem<String>(
//                         value: user['name'],
//                         child: Row(
//                           children: [
//                             CircleAvatar(
//                               backgroundImage: user['profile_picture'].isNotEmpty
//                                   ? NetworkImage(user['profile_picture'])
//                                   : null,
//                               backgroundColor: Colors.grey[300],
//                               radius: 20,
//                               child: user['profile_picture'].isEmpty
//                                   ? Icon(Icons.person, color: Colors.white)
//                                   : null,
//                             ),
//                             SizedBox(width: 10),
//                             Expanded(child: Text(user['name'])),
//                           ],
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                   SizedBox(height: 16),
//                   TextField(
//                     controller: _dateController,
//                     decoration: InputDecoration(
//                       labelText: 'Date',
//                       border: OutlineInputBorder(),
//                       suffixIcon: IconButton(
//                         icon: Icon(Icons.calendar_today),
//                         onPressed: () => _selectDate(context),
//                       ),
//                     ),
//                     readOnly: true,
//                   ),
//                   SizedBox(height: 16),
//                   TextField(
//                     controller: _marksController,
//                     decoration: InputDecoration(
//                       labelText: 'Marks (0-100)',
//                       border: OutlineInputBorder(),
//                     ),
//                     keyboardType: TextInputType.number,
//                   ),
//                   SizedBox(height: 24),
//                   Center(
//                     child: ElevatedButton(
//                       onPressed: _uploadMarks,
//                       style: ElevatedButton.styleFrom(
//                         padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                       child: Text('Upload Marks', style: TextStyle(fontSize: 16)),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(title: Text('Upload Marks')),
//     body: _isLoading
//         ? Center(child: CircularProgressIndicator())
//         : Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // User Selection
//                 Text(
//                   'Select User:',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 8),
//                 DropdownButton<String>(
//                   isExpanded: true,
//                   value: _selectedName,
//                   hint: Text('Select User'),
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       _selectedName = newValue;
//                       _selectedUID = _users
//                           .firstWhere((user) => user['name'] == newValue)['id'];
//                     });
//                   },
//                   items: _users.map<DropdownMenuItem<String>>((user) {
//                     return DropdownMenuItem<String>(
//                       value: user['name'],
//                       child: Row(
//                         children: [
//                           CircleAvatar(
//                             backgroundImage: user['profile_picture'].isNotEmpty
//                                 ? NetworkImage(user['profile_picture'])
//                                 : null,
//                             backgroundColor: Colors.grey[300],
//                             radius: 20,
//                             child: user['profile_picture'].isEmpty
//                                 ? Icon(Icons.person, color: Colors.white)
//                                 : null,
//                           ),
//                           SizedBox(width: 10),
//                           Expanded(child: Text(user['name'])),
//                         ],
//                       ),
//                     );
//                   }).toList(),
//                 ),
//                 SizedBox(height: 16),

//                 // Date Picker
//                 TextField(
//                   controller: _dateController,
//                   decoration: InputDecoration(
//                     labelText: 'Date',
//                     border: OutlineInputBorder(),
//                     suffixIcon: IconButton(
//                       icon: Icon(Icons.calendar_today),
//                       onPressed: () => _selectDate(context),
//                     ),
//                   ),
//                   readOnly: true,
//                 ),
//                 SizedBox(height: 16),

//                 // Marks Input
//                 TextField(
//                   controller: _marksController,
//                   decoration: InputDecoration(
//                     labelText: 'Marks (0-100)',
//                     border: OutlineInputBorder(),
//                   ),
//                   keyboardType: TextInputType.number,
//                 ),
//                 SizedBox(height: 24),

//                 // Upload Button
//                 Center(
//                   child: ElevatedButton(
//                     onPressed: _uploadMarks,
//                     style: ElevatedButton.styleFrom(
//                       padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: Text('Upload Marks', style: TextStyle(fontSize: 16)),
//                   ),
//                 ),
//                 SizedBox(height: 24),

//                 // Recent Marks Section
//                 Text(
//                   'Recent Marks (Last 24 Hours):',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 8),
//                 _todayMarks.isEmpty
//                     ? Text('No recent marks available.')
//                     : Expanded(
//                         child: ListView.builder(
//                           itemCount: _todayMarks.length,
//                           itemBuilder: (context, index) {
//                             final mark = _todayMarks[index];
//                             return Card(
//                               margin: EdgeInsets.symmetric(vertical: 8),
//                               child: ListTile(
//                                 leading: CircleAvatar(
//                                   backgroundImage: mark['user']['profile_picture'] != null
//                                       ? NetworkImage(mark['user']['profile_picture'])
//                                       : null,
//                                   backgroundColor: Colors.grey[300],
//                                   child: mark['user']['profile_picture'] == null
//                                       ? Icon(Icons.person, color: Colors.white)
//                                       : null,
//                                 ),
//                                 title: Text(mark['name']),
//                                 subtitle: Text(
//                                   'Marks: ${mark['marks']}\nDate: ${DateTime.parse(mark['created_at']).toLocal()}',
//                                   style: TextStyle(fontSize: 14),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//               ],
//             ),
//           ),
//   );
// }


// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(title: Text('Upload Marks')),
//     body: _isLoading
//         ? Center(child: CircularProgressIndicator())
//         : Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // User Selection
//                 Text(
//                   'Select User:',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 8),
//                 DropdownButton<String>(
//                   isExpanded: true,
//                   value: _selectedName,
//                   hint: Text('Select User'),
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       _selectedName = newValue;
//                       _selectedUID = _users
//                           .firstWhere((user) => user['name'] == newValue)['id'];
//                     });
//                   },
//                   items: _users.map<DropdownMenuItem<String>>((user) {
//                     return DropdownMenuItem<String>(
//                       value: user['name'],
//                       child: Row(
//                         children: [
//                           CircleAvatar(
//                             backgroundImage: user['profile_picture'].isNotEmpty
//                                 ? NetworkImage(user['profile_picture'])
//                                 : null,
//                             backgroundColor: Colors.grey[300],
//                             radius: 20,
//                             child: user['profile_picture'].isEmpty
//                                 ? Icon(Icons.person, color: Colors.white)
//                                 : null,
//                           ),
//                           SizedBox(width: 10),
//                           Expanded(child: Text(user['name'])),
//                         ],
//                       ),
//                     );
//                   }).toList(),
//                 ),
//                 SizedBox(height: 16),

//                 // Date Picker
//                 TextField(
//                   controller: _dateController,
//                   decoration: InputDecoration(
//                     labelText: 'Date',
//                     border: OutlineInputBorder(),
//                     suffixIcon: IconButton(
//                       icon: Icon(Icons.calendar_today),
//                       onPressed: () => _selectDate(context),
//                     ),
//                   ),
//                   readOnly: true,
//                 ),
//                 SizedBox(height: 16),

//                 // Marks Input
//                 TextField(
//                   controller: _marksController,
//                   decoration: InputDecoration(
//                     labelText: 'Marks (0-100)',
//                     border: OutlineInputBorder(),
//                   ),
//                   keyboardType: TextInputType.number,
//                 ),
//                 SizedBox(height: 24),

//                 // Upload Button
//                 Center(
//                   child: ElevatedButton(
//                     onPressed: _uploadMarks,
//                     style: ElevatedButton.styleFrom(
//                       padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: Text('Upload Marks', style: TextStyle(fontSize: 16)),
//                   ),
//                 ),
//                 SizedBox(height: 24),

//                 // Recent Marks Section
//                 Text(
//                   'Recent Marks (Last 24 Hours):',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 8),
//                 Expanded(
//                   child: _todayMarks.isEmpty
//                       ? Center(child: Text('No recent marks available.'))
//                       : ListView.builder(
//                           itemCount: _todayMarks.length,
//                           itemBuilder: (context, index) {
//                             final mark = _todayMarks[index];
//                             return Card(
//                               margin: EdgeInsets.symmetric(vertical: 8),
//                               child: ListTile(
//                                 leading: CircleAvatar(
//                                   backgroundImage:
//                                        NetworkImage(mark['profile_picture']),
                                      
//                                   backgroundColor: Colors.grey[300],
//                                   child: mark['profile_picture'].isEmpty
//                                       ? Icon(Icons.person, color: Colors.white)
//                                       : null,
//                                 ),
//                                 title: Text(mark['name']),
//                                 subtitle: Text('Marks: ${mark['marks'] ?? 'Not Available'}'),

//                               ),
//                             );
//                           },
//                         ),
//                 ),
//               ],
//             ),
//           ),
//   );
// }
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class UploadMarksScreen extends StatefulWidget {
  @override
  _UploadMarksScreenState createState() => _UploadMarksScreenState();
}
class _UploadMarksScreenState extends State<UploadMarksScreen> {
  final _dateController = TextEditingController();
  final _marksController = TextEditingController();
  
  String? _selectedName;
  String? _selectedUID;
  List<Map<String, dynamic>> _users = [];
  List<Map<String, dynamic>> _todayMarks = [];
  bool _isLoading = false;

  final supabase = Supabase.instance.client;

  @override
  void initState() {
    super.initState();
    _fetchUserNames();
    _fetchTodayMarks();
    _fetchRecentMarks();
  }

  Future<void> _fetchUserNames() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await supabase.from('users').select('first_name, last_name, center, profile_picture, id');

      if (response is List && response.isNotEmpty) {
        setState(() {
          _users = response.map<Map<String, dynamic>>((user) {
            return {
              'name': '${user['first_name']} ${user['last_name']} (${user['center']})',
              'id': user['id'],
              'profile_picture': user['profile_picture'] ?? '',
            };
          }).toList();
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Welcome')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

// Future<void> _fetchRecentMarks() async {
//   setState(() {
//     _isLoading = true;
//   });

//   try {
//     // Get the timestamp for 24 hours ago
//     final DateTime now = DateTime.now();
//     final DateTime twentyFourHoursAgo = now.subtract(Duration(hours: 24));

//     // Query marks created within the last 24 hours
//     final response = await supabase
//         .from('marks')
//         .select('name, marks, profile_picture, id, created_at')
//         .gte('created_at', twentyFourHoursAgo.toIso8601String());

//     // Process the response
//     setState(() {
//       _todayMarks = response.map<Map<String, dynamic>>((mark) {
//         return {
//           'name': mark['name'],
//           'id': mark['id'],
//           'profile_picture': mark['profile_picture'] ?? '',
//           // 'marks': mark['marks'] ?? 'no',
//           'marks': mark['marks'], 
//           'created_at': mark['created_at'],
//         };
//       }).toList();
//     });
//   } catch (error) {
//     print('Error fetching recent marks: $error');
//   } finally {
//     setState(() {
//       _isLoading = false;
//     });
//   }
// }


Future<void> _fetchRecentMarks() async {
  setState(() {
    _isLoading = true;
  });

  try {
    // Get the timestamp for 24 hours ago in UTC
    final DateTime now = DateTime.now().toUtc();
    final DateTime twentyFourHoursAgo = now.subtract(Duration(hours: 24));

    // Query marks created within the last 24 hours
    final response = await supabase
        .from('marks')
        .select('name, marks, profile_picture, id, created_at')
        .gte('created_at', twentyFourHoursAgo.toIso8601String())
        .lte('created_at', now.toIso8601String());

    if (response is List) {
      setState(() {
        _todayMarks = response.map<Map<String, dynamic>>((mark) {
          return {
            'name': mark['name'],
            'id': mark['id'],
            'profile_picture': mark['profile_picture'] ?? '',
            'marks': mark['marks'],
            'created_at': mark['created_at'],
          };
        }).toList();
      });
    }
  } catch (error) {
    print('Error fetching recent marks: $error');
  } finally {
    setState(() {
      _isLoading = false;
    });
  }
}


// Future<void> _fetchTodayMarks() async {
//   setState(() {
//     _isLoading = true;
//   });

//   try {
//     final now = DateTime.now().toUtc();
//     final yesterday = now.subtract(Duration(hours: 24));

//     final response = await supabase
//         .from('marks')
//         .select('name, marks, profile_picture, created_at');
        

//     if (response is List) {
//       setState(() {
//         _todayMarks = response.cast<Map<String, dynamic>>();
//       });
//     }
//   } catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Error fetching marks')),
//     );
//   } finally {
//     setState(() {
//       _isLoading = false;
//     });
//   }
// }
Future<void> _fetchTodayMarks() async {
  setState(() {
    _isLoading = true;
  });

  try {
    final DateTime today = DateTime.now().toUtc();
    final DateTime startOfDay = DateTime.utc(today.year, today.month, today.day);
    final DateTime endOfDay = startOfDay.add(Duration(days: 1));

    final response = await supabase
        .from('marks')
        .select('name, marks, profile_picture, id, created_at')
        .gte('created_at', startOfDay.toIso8601String())
        .lt('created_at', endOfDay.toIso8601String());

    if (response is List) {
      setState(() {
        _todayMarks = response.map<Map<String, dynamic>>((mark) {
          return {
            'name': mark['name'],
            'id': mark['id'],
            'profile_picture': mark['profile_picture'] ?? '',
            'marks': mark['marks'],
            'created_at': mark['created_at'],
          };
        }).toList();
      });
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error fetching marks')),
    );
  } finally {
    setState(() {
      _isLoading = false;
    });
  }
}

  Future<void> _uploadMarks() async {
    final date = _dateController.text.trim();
    final marks = int.tryParse(_marksController.text.trim()) ?? 0;

    if (_selectedName == null || _selectedUID == null || date.isEmpty || marks < 0 || marks > 100) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please provide valid input')),
      );
      return;
    }

    try {
      final selectedUser = _users.firstWhere(
        (user) => user['name'] == _selectedName,
        orElse: () => {},
      );

      await supabase.from('marks').insert([
        {
          'name': _selectedName,
          'uid': _selectedUID,
          'marks': marks,
          'date': date,
          'profile_picture': selectedUser['profile_picture'],
        }
      ]);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Marks uploaded successfully')),
      );

      _clearFields();
      _fetchRecentMarks();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error uploading marks')),
      );
    }
  }

  void _clearFields() {
    setState(() {
      _selectedName = null;
      _selectedUID = null;
      _dateController.clear();
      _marksController.clear();
    });
  }
  Future<void> _deleteMark(String markId) async {
  try {
    await supabase.from('marks').delete().eq('id', markId);
    setState(() {
      _todayMarks.removeWhere((mark) => mark['id'] == markId);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Mark deleted successfully')),
    );
  } catch (error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error deleting mark')),
    );
  }
}


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _dateController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('Upload Marks')),
    body: _isLoading
        ? Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User Selection
                Text(
                  'Select User:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                DropdownButton<String>(
                  isExpanded: true,
                  value: _selectedName,
                  hint: Text('Select User'),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedName = newValue;
                      _selectedUID = _users
                          .firstWhere((user) => user['name'] == newValue)['id'];
                    });
                  },
                  items: _users.map<DropdownMenuItem<String>>((user) {
                    return DropdownMenuItem<String>(
                      value: user['name'],
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: user['profile_picture'].isNotEmpty
                                ? NetworkImage(user['profile_picture'])
                                : null,
                            backgroundColor: Colors.grey[300],
                            radius: 20,
                            child: user['profile_picture'].isEmpty
                                ? Icon(Icons.person, color: Colors.white)
                                : null,
                          ),
                          SizedBox(width: 10),
                          Expanded(child: Text(user['name'])),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),

                // Date Picker
                TextField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    labelText: 'Date',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () => _selectDate(context),
                    ),
                  ),
                  readOnly: true,
                ),
                SizedBox(height: 16),

                // Marks Input
                TextField(
                  controller: _marksController,
                  decoration: InputDecoration(
                    labelText: 'Marks (0-100)',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 24),

                // Upload Button
                Center(
                  child: ElevatedButton(
                    onPressed: _uploadMarks,
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('Upload Marks',
                        style: TextStyle(fontSize: 16)),
                  ),
                ),
                SizedBox(height: 24),

                // Recent Marks Section
                Text(
                  'Recent Marks (Last 24 Hours):',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
              //   Expanded(
              //     child: _todayMarks.isEmpty
              //         ? Center(child: Text('No recent marks available.'))
              //         : ListView.builder(
              //             itemCount: _todayMarks.length,
              //             itemBuilder: (context, index) {
              //               final mark = _todayMarks[index];
              //               return Card(
              //                 margin: EdgeInsets.symmetric(vertical: 8),
              //                 child: ListTile(
              //                   leading: CircleAvatar(
              //                     backgroundImage:
              //                         mark['profile_picture'].isNotEmpty
              //                             ? NetworkImage(
              //                                 mark['profile_picture'])
              //                             : null,
              //                     backgroundColor: Colors.grey[300],
              //                     child: mark['profile_picture'].isEmpty
              //                         ? Icon(Icons.person, color: Colors.white)
              //                         : null,
              //                   ),
              //                   title: Text(mark['name']),
              //                   subtitle: Text(
              //                       'Marks: ${mark['marks'] ?? 'Not Available'}'),
              //                   onTap: () {
              //                     setState(() {
              //                       _selectedName = mark['name'];
              //                       _selectedUID = mark['uid'];
              //                       _dateController.text = mark['date'];
              //                       _marksController.text =
              //                           mark['marks'].toString();
              //                     });
              //                   },
              //                 ),
              //               );
              //             },
              //           ),
              //   ),
              Expanded(
  child: _todayMarks.isEmpty
      ? Center(child: Text('No recent marks available.'))
      : ListView.builder(
          itemCount: _todayMarks.length,
          itemBuilder: (context, index) {
            final mark = _todayMarks[index];

            return Slidable(
              // Define the key for the slidable item
              key: ValueKey(mark['id']),
              // Configure the action pane
              endActionPane: ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (_) async {
                      // Show confirmation dialog
                      final shouldDelete = await showDialog<bool>(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Delete Mark'),
                            content: Text(
                                'Are you sure you want to delete this mark?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(false),
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(true),
                                child: Text('Delete'),
                              ),
                            ],
                          );
                        },
                      );

                      if (shouldDelete == true) {
                        _deleteMark(mark['id']);
                      }
                    },
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: mark['profile_picture'].isNotEmpty
                        ? NetworkImage(mark['profile_picture'])
                        : null,
                    backgroundColor: Colors.grey[300],
                    child: mark['profile_picture'].isEmpty
                        ? Icon(Icons.person, color: Colors.white)
                        : null,
                  ),
                  title: Text(mark['name']),
                  subtitle: Text(
                      'Marks: ${mark['marks'] ?? 'Not Available'}'),
                  onTap: () {
                    setState(() {
                      _selectedName = mark['name'];
                      _selectedUID = mark['id'];
                      _dateController.text = mark['date'];
                      _marksController.text = mark['marks'].toString();
                    });
                  },
                ),
              ),
            );
          },
        ),
),
              ],
            ),
          ),
  );
}


}