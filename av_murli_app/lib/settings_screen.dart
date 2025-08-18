// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class SettingsScreen extends StatelessWidget {
//   final supabase = Supabase.instance.client;

//   // Function to sign out the user
//   Future<void> _signOut(BuildContext context) async {
//     await supabase.auth.signOut();
//     Navigator.of(context).pushReplacementNamed('/login');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Settings')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () => _signOut(context),
//           child: Text('Sign Out'),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';


// class SettingsScreen extends StatefulWidget {
//   const SettingsScreen({super.key});

//   @override
//   _SettingsScreenState createState() => _SettingsScreenState();
// }

// class _SettingsScreenState extends State<SettingsScreen> {
//   final SupabaseClient supabase = Supabase.instance.client;

//   bool _darkMode = false; // Track dark mode state

//   @override
//   void initState() {
//     super.initState();
//     // Check initial dark mode preference (assume dark mode settings are stored in Supabase or locally)
//     _fetchDarkModePreference();
//   }

//   Future<void> _fetchDarkModePreference() async {
//     // Simulate fetching dark mode preference
//     setState(() {
//       _darkMode = false; // Default to false
//     });
//   }

//   Future<void> _toggleDarkMode(bool value) async {
//     setState(() {
//       _darkMode = value;
//     });
//     // Save dark mode preference to Supabase or local storage
//   }

//   Future<void> _signOut(BuildContext context) async {
//     await supabase.auth.signOut();
//     Navigator.of(context).pushReplacementNamed('/login');
//   }
// Future<Map<String, dynamic>?> checkForUpdate() async {
//   final supabase = Supabase.instance.client;

//   final response = await supabase
//       .from('app_versions')
//       .select('*')
//       .order('created_at', ascending: false)
//       .limit(1)
//       .single();

//   if (response != null) {
//     return response as Map<String, dynamic>;
//   }
//   return null;
// }
// void checkAndUpdate() async {
//   final updateData = await checkForUpdate();

//   if (updateData != null) {
//     final latestVersion = updateData['version'];
//     final currentVersion = '1.0.0'; // Replace with your app's version.

//     if (latestVersion != currentVersion) {
//       final updateUrl = updateData['update_url'];
//       final isMandatory = updateData['mandatory'];

//       _showUpdateDialog(updateUrl, isMandatory);
//     }
//   }
// }
// void _showUpdateDialog(String updateUrl, bool isMandatory) {
//   showDialog(
//     context: context,
//     barrierDismissible: !isMandatory,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Update Available'),
//         content: Text('A new version is available. Please update your app.'),
//         actions: [
//           if (!isMandatory)
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: Text('Later'),
//             ),
//           ElevatedButton(
//             onPressed: () {
//               _launchUrl(updateUrl);
//             },
//             child: Text('Update'),
//           ),
//         ],
//       );
//     },
//   );
// }

// void _launchUrl(String url) async {
//   final Uri uri = Uri.parse(url);
//   if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
//     throw 'Could not launch $url';
//   }
// }


//   Future<void> _deleteAccount(BuildContext context) async {
//     final user = supabase.auth.currentUser;
//     if (user != null) {
//       try {
//         // Delete user data from your database
//         await supabase.from('users').delete().eq('id', user.id);

//         // Sign out the user
//         await supabase.auth.signOut();

//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Account deleted successfully')),
//         );

//         // Navigate to login screen
//         Navigator.of(context).pushReplacementNamed('/login');
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Failed to delete account: $e')),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Settings'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // ListTile(
//             //   title: const Text('Dark Mode'),
//             //   trailing: Switch(
//             //     value: _darkMode,
//             //     onChanged: (value) => _toggleDarkMode(value),
//             //   ),
//             // ),
//             // const Divider(),
//             ListTile(
//               title: const Text('View Profile'),
//               trailing: const Icon(Icons.person),
//               onTap: () {
//                 Navigator.of(context).pushNamed('/profile');
//               },
//             ),
//             // const Divider(),
//             // ListTile(
//             //   title: const Text(
//             //     'Delete Account',
//             //     style: TextStyle(color: Colors.red),
//             //   ),
//             //   trailing: const Icon(Icons.delete, color: Colors.red),
//             //   onTap: () async {
//             //     final confirm = await showDialog<bool>(
//             //       context: context,
//             //       builder: (BuildContext context) {
//             //         return AlertDialog(
//             //           title: const Text('Delete Account'),
//             //           content: const Text(
//             //             'Are you sure you want to delete your account? This action is irreversible.',
//             //           ),
//             //           actions: [
//             //             TextButton(
//             //               onPressed: () => Navigator.of(context).pop(false),
//             //               child: const Text('Cancel'),
//             //             ),
//             //             ElevatedButton(
//             //               onPressed: () => Navigator.of(context).pop(true),
//             //               style: ElevatedButton.styleFrom(
//             //                   backgroundColor: Colors.red),
//             //               child: const Text('Delete'),
//             //             ),
//             //           ],
//             //         );
//             //       },
//             //     );

//             //     if (confirm == true) {
//             //       _deleteAccount(context);
//             //     }
//             //   },
//             // ),
//             const Divider(),
//             Center(
//               child: ElevatedButton.icon(
//                 onPressed: () => _signOut(context),
//                 icon: const Icon(Icons.logout),
//                 label: const Text('Sign Out'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 231, 102, 102),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final SupabaseClient supabase = Supabase.instance.client;

  bool _darkMode = false; // Track dark mode state

  @override
  void initState() {
    super.initState();
    // Check initial dark mode preference (assume dark mode settings are stored in Supabase or locally)
    _fetchDarkModePreference();
  }
  final currentVersion = '1.0.0'; // Replace with your app's version


  Future<void> _fetchDarkModePreference() async {
    // Simulate fetching dark mode preference
    setState(() {
      _darkMode = false; // Default to false
    });
  }

  Future<void> _toggleDarkMode(bool value) async {
    setState(() {
      _darkMode = value;
    });
    // Save dark mode preference to Supabase or local storage
  }

  // Future<void> _signOut(BuildContext context) async {
  //   await supabase.auth.signOut();
  //   Navigator.of(context).pushReplacementNamed('/login');
  // }
  Future<void> _signOut(BuildContext context) async {
  await supabase.auth.signOut();

  // Clear the navigation stack and navigate to the login screen
  Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
}


  // Future<Map<String, dynamic>?> checkForUpdate() async {
  //   final supabase = Supabase.instance.client;

  //   final response = await supabase
  //       .from('app_versions')
  //       .select('*')
  //       .order('created_at', ascending: false)
  //       .limit(1)
  //       .single();

  //   if (response != null) {
  //     return response as Map<String, dynamic>;
  //   }
  //   return null;
  // }
Future<Map<String, dynamic>?> checkForUpdate() async {
  final supabase = Supabase.instance.client;

  // Query the most recent version from the app_versions table
  final response = await supabase
      .from('app_versions')  // The table name
      .select('*')  // Select all columns
      .order('created_at', ascending: false)  // Order by latest version
      .limit(1)  // Limit to the most recent entry
      .single();  // Only fetch one row

  if (response != null) {
    print('Update data fetched: $response');  // Debugging log
    return response as Map<String, dynamic>;
  }

  return null;
}

  // void checkAndUpdate() async {
  //   final updateData = await checkForUpdate();

  //   if (updateData != null) {
  //     final latestVersion = updateData['version'];
  //     final currentVersion = '1.0.0'; // Replace with your app's version.

  //     if (latestVersion != currentVersion) {
  //       final updateUrl = updateData['update_url'];
  //       final isMandatory = updateData['mandatory'];

  //       _showUpdateDialog(updateUrl, isMandatory);
  //     } else {
  //       _showNoUpdateDialog();
  //     }
  //   }
  // }
// void checkAndUpdate() async {
//   print("Checking for updates...");  // Debugging log
//   final updateData = await checkForUpdate();

//   if (updateData != null) {
//     final latestVersion = updateData['version'];
//     final currentVersion = '1.0.0'; // Replace with your app's version.

//     print("Latest version: $latestVersion, Current version: $currentVersion");  // Debugging log

//     if (latestVersion != currentVersion) {
//       final updateUrl = updateData['update_url'];
//       final isMandatory = updateData['mandatory'];

//       _showUpdateDialog(updateUrl, isMandatory);
//     } else {
//       _showNoUpdateDialog();
//     }
//   } else {
//     print("No update data found.");  // Debugging log
//   }
// }
void checkAndUpdate() async {
  final updateData = await checkForUpdate();

  if (updateData != null) {
    final latestVersion = updateData['version'];
    final currentVersion = '1.0.0';  // Update this to your app's current version.

    if (latestVersion != currentVersion) {
      final updateUrl = updateData['update_url'];
      final isMandatory = updateData['mandatory'];

      // Show the update dialog
      _showUpdateDialog(updateUrl, isMandatory);
    }
  }
}


  // void _showUpdateDialog(String updateUrl, bool isMandatory) {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: !isMandatory,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Update Available'),
  //         content: Text('A new version is available. Please update your app.'),
  //         actions: [
  //           if (!isMandatory)
  //             TextButton(
  //               onPressed: () => Navigator.of(context).pop(),
  //               child: Text('Later'),
  //             ),
  //           ElevatedButton(
  //             onPressed: () {
  //               _launchUrl(updateUrl);
  //             },
  //             child: Text('Update'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
  void _showUpdateDialog(String updateUrl, bool isMandatory) {
  showDialog(
    context: context,
    barrierDismissible: !isMandatory,  // If mandatory, the user can't dismiss the dialog
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Update Available'),
        content: Text('A new version is available. Please update your app.'),
        actions: [
          if (!isMandatory)
            TextButton(
              onPressed: () => Navigator.of(context).pop(),  // Dismiss the dialog
              child: Text('Later'),
            ),
          ElevatedButton(
            onPressed: () {
              _launchUrl(updateUrl);  // Launch the update URL
            },
            child: Text('Update'),
          ),
        ],
      );
    },
  );
}


  void _showNoUpdateDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('No Updates Available'),
          content: Text('Your app is up to date.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // void _launchUrl(String url) async {
  //   final Uri uri = Uri.parse(url);
  //   if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
  //     throw 'Could not launch $url';
  //   }
  // }
  void _launchUrl(String url) async {
  print("Launching URL: $url");  // Debugging log
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $url';
  }
}


  Future<void> _deleteAccount(BuildContext context) async {
    final user = supabase.auth.currentUser;
    if (user != null) {
      try {
        // Delete user data from your database
        await supabase.from('users').delete().eq('id', user.id);

        // Sign out the user
        await supabase.auth.signOut();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Account deleted successfully')),
        );

        // Navigate to login screen
        Navigator.of(context).pushReplacementNamed('/login');
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to delete account: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: const Text('View Profile'),
              trailing: const Icon(Icons.person),
              onTap: () {
                Navigator.of(context).pushNamed('/profile');
              },
            ),
            // const Divider(),
            // // Button to check for updates
            // Center(
            //   child: ElevatedButton.icon(
            //     onPressed: checkAndUpdate,
            //     icon: const Icon(Icons.system_update_alt),
            //     label: const Text('Check for Updates'),
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: const Color.fromARGB(255, 102, 204, 102),
            //     ),
            //   ),
            // ),
            // const Divider(),
            Center(
              child: ElevatedButton.icon(
                onPressed: () => _signOut(context),
                icon: const Icon(Icons.logout),
                label: const Text('Sign Out'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 231, 102, 102),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
