import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> checkForUpdate(BuildContext context) async {
  final supabase = Supabase.instance.client;

  try {
    final response = await supabase
        .from('app_versions')
        .select('*')
        .order('created_at', ascending: false)
        .limit(1)
        .single();

    if (response != null) {
      final latestVersion = response['version'];
      final updateUrl = response['update_url'];
      final isMandatory = response['mandatory'];

      const currentVersion = '1.0.0'; // Replace with your app's version.
      if (latestVersion != currentVersion) {
        _showUpdateDialog(context, updateUrl, isMandatory);
      }
    }
  } catch (e) {
    print('Error checking for updates: $e');
  }
}

void _showUpdateDialog(BuildContext context, String updateUrl, bool isMandatory) {
  showDialog(
    context: context,
    barrierDismissible: !isMandatory,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Update Available'),
        content: Text('A new version is available. Please update your app.'),
        actions: [
          if (!isMandatory)
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Later'),
            ),
          ElevatedButton(
            onPressed: () {
              launch(updateUrl);
            },
            child: Text('Update'),
          ),
        ],
      );
    },
  );
}
