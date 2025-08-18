// import 'package:flutter/material.dart';
// import 'package:package_info_plus/package_info_plus.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class UpdateAppCheck extends StatefulWidget {
//   @override
//   _UpdateAppCheckState createState() => _UpdateAppCheckState();
// }

// class _UpdateAppCheckState extends State<UpdateAppCheck> {
//   final supabase = Supabase.instance.client;

//   String? _updateUrl;

//   @override
//   void initState() {
//     super.initState();
//     _checkForUpdates();
//   }

//   Future<void> _checkForUpdates() async {
//     try {
//       // Fetch the current app version
//       final packageInfo = await PackageInfo.fromPlatform();
//       final currentVersion = packageInfo.version;

//       // Fetch the latest version from Supabase
//       final response = await supabase
//           .from('app_versions')
//           .select('latest_version, update_url')
//           .eq('platform', 'android') // or 'ios' based on the platform
//           .single();

//       final latestVersion = response['latest_version'];
//       final updateUrl = response['update_url'];

//       // Compare versions
//       if (_isNewVersionAvailable(currentVersion, latestVersion)) {
//         setState(() {
//           _updateUrl = updateUrl;
//         });
//       }
//     } catch (e) {
//       print('Error checking for updates: $e');
//     }
//   }

//   bool _isNewVersionAvailable(String current, String latest) {
//     List<int> currentParts = current.split('.').map(int.parse).toList();
//     List<int> latestParts = latest.split('.').map(int.parse).toList();

//     for (int i = 0; i < latestParts.length; i++) {
//       if (latestParts[i] > currentParts[i]) {
//         return true;
//       } else if (latestParts[i] < currentParts[i]) {
//         return false;
//       }
//     }
//     return false;
//   }

//   void _launchUpdateUrl() async {
//     if (_updateUrl != null) {
//       // Use a package like url_launcher to open the URL
//       await launchUrl(Uri.parse(_updateUrl!));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('App Update Check')),
//       body: Center(
//         child: _updateUrl != null
//             ? ElevatedButton(
//                 onPressed: _launchUpdateUrl,
//                 child: Text('Update App'),
//               )
//             : Text('Your app is up to date!'),
//       ),
//     );
//   }
// }
