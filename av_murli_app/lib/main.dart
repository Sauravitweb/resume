// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         // This is the theme of your application.
// //         //
// //         // TRY THIS: Try running your application with "flutter run". You'll see
// //         // the application has a purple toolbar. Then, without quitting the app,
// //         // try changing the seedColor in the colorScheme below to Colors.green
// //         // and then invoke "hot reload" (save your changes or press the "hot
// //         // reload" button in a Flutter-supported IDE, or press "r" if you used
// //         // the command line to start the app).
// //         //
// //         // Notice that the counter didn't reset back to zero; the application
// //         // state is not lost during the reload. To reset the state, use hot
// //         // restart instead.
// //         //
// //         // This works for code too, not just values: Most code changes can be
// //         // tested with just a hot reload.
// //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
// //         useMaterial3: true,
// //       ),
// //       home: const MyHomePage(title: 'Flutter Demo Home Page'),
// //     );
// //   }
// // }

// // class MyHomePage extends StatefulWidget {
// //   const MyHomePage({super.key, required this.title});

// //   // This widget is the home page of your application. It is stateful, meaning
// //   // that it has a State object (defined below) that contains fields that affect
// //   // how it looks.

// //   // This class is the configuration for the state. It holds the values (in this
// //   // case the title) provided by the parent (in this case the App widget) and
// //   // used by the build method of the State. Fields in a Widget subclass are
// //   // always marked "final".

// //   final String title;

// //   @override
// //   State<MyHomePage> createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage> {
// //   int _counter = 0;

// //   void _incrementCounter() {
// //     setState(() {
// //       // This call to setState tells the Flutter framework that something has
// //       // changed in this State, which causes it to rerun the build method below
// //       // so that the display can reflect the updated values. If we changed
// //       // _counter without calling setState(), then the build method would not be
// //       // called again, and so nothing would appear to happen.
// //       _counter++;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     // This method is rerun every time setState is called, for instance as done
// //     // by the _incrementCounter method above.
// //     //
// //     // The Flutter framework has been optimized to make rerunning build methods
// //     // fast, so that you can just rebuild anything that needs updating rather
// //     // than having to individually change instances of widgets.
// //     return Scaffold(
// //       appBar: AppBar(
// //         // TRY THIS: Try changing the color here to a specific color (to
// //         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
// //         // change color while the other colors stay the same.
// //         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
// //         // Here we take the value from the MyHomePage object that was created by
// //         // the App.build method, and use it to set our appbar title.
// //         title: Text(widget.title),
// //       ),
// //       body: Center(
// //         // Center is a layout widget. It takes a single child and positions it
// //         // in the middle of the parent.
// //         child: Column(
// //           // Column is also a layout widget. It takes a list of children and
// //           // arranges them vertically. By default, it sizes itself to fit its
// //           // children horizontally, and tries to be as tall as its parent.
// //           //
// //           // Column has various properties to control how it sizes itself and
// //           // how it positions its children. Here we use mainAxisAlignment to
// //           // center the children vertically; the main axis here is the vertical
// //           // axis because Columns are vertical (the cross axis would be
// //           // horizontal).
// //           //
// //           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
// //           // action in the IDE, or press "p" in the console), to see the
// //           // wireframe for each widget.
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             const Text(
// //               'You have pushed the button this many times:',
// //             ),
// //             Text(
// //               '$_counter',
// //               style: Theme.of(context).textTheme.headlineMedium,
// //             ),
// //           ],
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: _incrementCounter,
// //         tooltip: 'Increment',
// //         child: const Icon(Icons.add),
// //       ), // This trailing comma makes auto-formatting nicer for build methods.
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'auth_screen.dart';
// import 'screens/home_screen.dart';
// import 'screens/task_list_screen.dart';
// import 'screens/health_tracking_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'screens/dashboard_screen.dart';
// import 'screens/login_screen.dart';
// import 'screens/registration_screen.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_analytics/observer.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:your_app/models/task_hive.dart';

// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:table_calendar/table_calendar.dart';
// import 'package:googleapis/calendar/v3.dart';
// import 'package:googleapis_auth/auth_io.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:health/health.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:intl/intl.dart';





// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Hive.initFlutter();
//   runApp(MyApp());
// }


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: '/',
//       routes: {
//         '/': (context) => AuthScreen(),
//         '/home': (context) => HomeScreen(),
//         '/tasks': (context) => TaskListScreen(),
//         '/health': (context) => HealthTrackingScreen(),
//       },
//     );
//   }
// }
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool _darkMode = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadTheme();
//   }

//   void _loadTheme() async {
//     final settings = await SettingsService().getSettings();
//     setState(() {
//       _darkMode = settings.darkMode;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: _darkMode ? ThemeData.dark() : ThemeData.light(),
//       initialRoute: '/',
//       routes: {
//         '/': (context) => HomeScreen(),
//         '/settings': (context) => SettingsScreen(),
//         // Other routes
//       },
//     );
//   }
// }

// routes: {
//   '/home': (context) => HomeScreen(),
//   '/dashboard': (context) => DashboardScreen(),
//   '/tasks': (context) => TaskListScreen(),
//   '/health': (context) => HealthTrackingScreen(),
//   '/logs': (context) => LogScreen(),
// },


// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Life Manager',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           }
//           if (snapshot.hasData) {
//             return DashboardScreen();
//           }
//           return LoginScreen();
//         },
//       ),
//       routes: {
//         '/login': (context) => LoginScreen(),
//         '/register': (context) => RegistrationScreen(),
//         '/dashboard': (context) => DashboardScreen(),
//         // Other routes
//       },
//     );
//   }
// }




// FirebaseAnalytics analytics = FirebaseAnalytics();

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Life Manager',
//       navigatorObservers: [
//         FirebaseAnalyticsObserver(analytics: analytics),
//       ],
//       home: HomeScreen(),
//       // Other configurations...
//     );
//   }
// }


// void _logTaskCompletion(String taskId) async {
//   await analytics.logEvent(
//     name: 'task_completed',
//     parameters: {
//       'task_id': taskId,
//     },
//   );
// }
// void _setUserPreferredTheme(String theme) async {
//   await analytics.setUserProperty(name: 'preferred_theme', value: theme);
// }


// FirebaseMessaging messaging = FirebaseMessaging.instance;

// void setupFCM() {
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     print('Received a message: ${message.messageId}');
//     // Handle the message in the app
//   });

//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//     print('Message clicked: ${message.messageId}');
//     // Handle when the notification is clicked and the app opens
//   });
// }

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   setupFCM();
//   runApp(MyApp());
// }


// FirebaseMessaging messaging = FirebaseMessaging.instance;

// void setupFCM() {
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     print('Received a message: ${message.messageId}');
//     // Handle the message in the app
//   });

//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//     print('Message clicked: ${message.messageId}');
//     // Handle when the notification is clicked and the app opens
//   });
// }

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   setupFCM();
//   runApp(MyApp());
// }
// Future<void> requestNotificationPermissions() async {
//   NotificationSettings settings = await messaging.requestPermission(
//     alert: true,
//     badge: true,
//     sound: true,
//   );

//   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//     print('User granted permission');
//   } else {
//     print('User declined or has not accepted permission');
//   }
// }
// Future<void> backupUserData() async {
//   final userTasks = _taskOfflineService.getTasks();
//   for (final task in userTasks) {
//     await FirebaseFirestore.instance.collection('user_data').add({
//       'title': task.title,
//       'description': task.description,
//       'isCompleted': task.isCompleted,
//       'timestamp': FieldValue.serverTimestamp(),
//     });
//   }
// }
// // A simple function to prioritize tasks based on deadlines and completion status
// int prioritizeTask(TaskHive task) {
//   // Assign higher priority to tasks that are not completed and have a nearer deadline
//   if (!task.isCompleted) {
//     // For demonstration, let's assume each task has a 'dueDate' property
//     DateTime now = DateTime.now();
//     Duration timeUntilDue = task.dueDate.difference(now);
//     return timeUntilDue.inDays < 1 ? 1 : 2; // Higher score for tasks due soon
//   }
//   return 3; // Lowest priority for completed tasks
// }


// class NLPService {
//   final String _apiKey = 'YOUR_NLP_API_KEY';

//   Future<String> categorizeText(String text) async {
//     final response = await http.post(
//       Uri.parse('https://api.nlp-service.com/categorize'),
//       headers: {
//         'Authorization': 'Bearer $_apiKey',
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode({'text': text}),
//     );

//     if (response.statusCode == 200) {
//       final Map<String, dynamic> data = jsonDecode(response.body);
//       return data['category'];
//     } else {
//       throw Exception('Failed to categorize text');
//     }
//   }
// }
// Future<void> backupUserData() async {
//   final userTasks = _taskOfflineService.getTasks();
//   for (final task in userTasks) {
//     await FirebaseFirestore.instance.collection('user_data').add({
//       'title': task.title,
//       'description': task.description,
//       'isCompleted': task.isCompleted,
//       'timestamp': FieldValue.serverTimestamp(),
//     });
//   }
// }

// Future<void> restoreUserData() async {
//   QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('user_data').get();
//   for (var doc in snapshot.docs) {
//     TaskHive task = TaskHive(
//       title: doc['title'],
//       description: doc['description'],
//       isCompleted: doc['isCompleted'],
//     );
//     await _taskOfflineService.addTask(task);
//   }
// }
// class TaskCard extends StatelessWidget {
//   final TaskHive task;
//   final VoidCallback onDelete;

//   const TaskCard({required this.task, required this.onDelete, Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         title: Text(task.title),
//         subtitle: Text(task.description),
//         trailing: IconButton(
//           icon: Icon(Icons.delete),
//           onPressed: onDelete,
//         ),
//       ),
//     );
//   }
// }
// AnimatedContainer(
//   duration: Duration(milliseconds: 300),
//   decoration: BoxDecoration(
//     color: Colors.blue,
//     borderRadius: BorderRadius.circular(15),
//   ),
//   child: // Your child widget
// )

// void main() {
//   test('Test task prioritization', () {
//     TaskHive task = TaskHive(title: 'Test Task', description: 'Testing', isCompleted: false, dueDate: DateTime.now().add(Duration(days: 1)));
//     expect(prioritizeTask(task), equals(1)); // Test if prioritization is correct
//   });
// }

// class User {
//   int points;

//   User(this.points);

//   void completeTask() {
//     points += 10; // Example points for task completion
//   }
// }

// class Leaderboard extends StatelessWidget {
//   final List<User> users;

//   Leaderboard({required this.users});

//   @override
//   Widget build(BuildContext context) {
//     users.sort((a, b) => b.points.compareTo(a.points)); // Sort by points
//     return ListView.builder(
//       itemCount: users.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text('User: ${users[index].name}'),
//           trailing: Text('Points: ${users[index].points}'),
//         );
//       },
//     );
//   }
// }


// class CalendarView extends StatelessWidget {
//   final ValueChanged<DateTime> onDaySelected;

//   CalendarView({required this.onDaySelected});

//   @override
//   Widget build(BuildContext context) {
//     return TableCalendar(
//       onDaySelected: (selectedDay, focusedDay) {
//         onDaySelected(selectedDay);
//       },
//     );
//   }
// }

// void shareTask(String taskId, String userId) {
//   // Logic to share a task with another user
//   // This could involve a Firestore update to allow collaborative editing
// }
// class ChatScreen extends StatelessWidget {
//   final String chatId;

//   ChatScreen({required this.chatId});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseFirestore.instance.collection('chats').doc(chatId).collection('messages').snapshots(),
//       builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (!snapshot.hasData) return CircularProgressIndicator();
//         return ListView.builder(
//           itemCount: snapshot.data!.docs.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text(snapshot.data!.docs[index]['content']),
//             );
//           },
//         );
//       },
//     );
//   }
// }
// class FeedbackForm extends StatelessWidget {
//   final TextEditingController feedbackController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextField(
//           controller: feedbackController,
//           decoration: InputDecoration(labelText: 'Your Feedback'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             sendFeedback(feedbackController.text);
//             feedbackController.clear();
//           },
//           child: Text('Submit Feedback'),
//         ),
//       ],
//     );
//   }

//   void sendFeedback(String feedback) {
//     FirebaseFirestore.instance.collection('feedback').add({
//       'feedback': feedback,
//       'timestamp': FieldValue.serverTimestamp(),
//     });
//   }
// }
// class CustomizableDashboard extends StatefulWidget {
//   @override
//   _CustomizableDashboardState createState() => _CustomizableDashboardState();
// }

// class _CustomizableDashboardState extends State<CustomizableDashboard> {
//   List<String> widgets = ['Tasks', 'Calendar', 'Health Summary'];

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       itemCount: widgets.length,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//       itemBuilder: (context, index) {
//         return GestureDetector(
//           onLongPress: () => _removeWidget(index),
//           child: Card(
//             child: Center(child: Text(widgets[index])),
//           ),
//         );
//       },
//     );
//   }

//   void _removeWidget(int index) {
//     setState(() {
//       widgets.removeAt(index);
//     });
//   }
// }
// class ThemeNotifier with ChangeNotifier {
//   ThemeData _currentTheme = lightTheme;

//   ThemeData get currentTheme => _currentTheme;

//   void toggleTheme() {
//     _currentTheme = _currentTheme == lightTheme ? darkTheme : lightTheme;
//     notifyListeners();
//   }
// }
// void scheduleAdaptiveReminder(User user) {
//   if (user.lastLogin.difference(DateTime.now()).inDays > 3) {
//     // Send a push notification
//     _sendReminderNotification('It's been a while! Don’t forget to update your tasks.');
//   }
// }


// void fetchGoogleCalendarEvents() async {
//   var client = await clientViaUserConsent(ClientId(clientId, clientSecret), scopes, (url) {
//     // Direct the user to the authentication URL
//   });

//   var calendarApi = CalendarApi(client);
//   var events = await calendarApi.events.list('primary');
//   print('Upcoming events:');
//   events.items?.forEach((event) => print(event.summary));
// }
// // Define health data types to read
// List<HealthDataType> types = [HealthDataType.STEPS, HealthDataType.HEART_RATE];

// HealthFactory health = HealthFactory();

// // Fetch steps data for today
// bool success = await health.requestAuthorization(types);

// if (success) {
//   List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(DateTime.now().subtract(Duration(days: 1)), DateTime.now(), types);
//   healthData.forEach((dataPoint) {
//     print('${dataPoint.typeString}: ${dataPoint.value}');
//   });
// }
// Future<String> analyzeSentiment(String text) async {
//   final response = await http.post(
//     Uri.parse('https://api.sentiment-analysis.com/analyze'),
//     headers: {'Content-Type': 'application/json'},
//     body: jsonEncode({'text': text}),
//   );

//   if (response.statusCode == 200) {
//     final Map<String, dynamic> data = jsonDecode(response.body);
//     return data['sentiment'];
//   } else {
//     throw Exception('Failed to analyze sentiment');
//   }
// }
// void main() {
//   runApp(MaterialApp(
//     localizationsDelegates: [
//       GlobalMaterialLocalizations.delegate,
//       GlobalWidgetsLocalizations.delegate,
//       GlobalCupertinoLocalizations.delegate,
//     ],
//     supportedLocales: [
//       const Locale('en', ''), // English
//       const Locale('es', ''), // Spanish
//     ],
//   ));
// }
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_analytics/observer.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

// // Importing screens
// // import 'screens/auth_screen.dart';
// import 'screens/home_screen.dart';
// import 'screens/task_list_screen.dart';
// import 'screens/health_tracking_screen.dart';
// import 'screens/dashboard_screen.dart';
// import 'screens/login_screen.dart';
// import 'screens/registration_screen.dart';
// import 'screens/chat_screen.dart'; // Chat functionality

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   await Hive.initFlutter();
//   setupFCM();
//   runApp(MyApp());
// }

// void setupFCM() {
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     print('Received a message: ${message.messageId}');
//     // Handle the message in the app
//   });

//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//     print('Message clicked: ${message.messageId}');
//     // Handle when the notification is clicked and the app opens
//   });
// }

// class MyApp extends StatelessWidget {
//   final FirebaseAnalytics analytics = FirebaseAnalytics();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Life Manager',
//       navigatorObservers: [
//         FirebaseAnalyticsObserver(analytics: analytics),
//       ],
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasData) {
//             return DashboardScreen();
//           }
//           return LoginScreen();
//         },
//       ),
//       routes: {
//         '/login': (context) => LoginScreen(),
//         '/register': (context) => RegistrationScreen(),
//         '/dashboard': (context) => DashboardScreen(),
//         '/home': (context) => HomeScreen(),
//         '/tasks': (context) => TaskListScreen(),
//         '/health': (context) => HealthTrackingScreen(),
//         '/chat': (context) => ChatScreen(chatId: 'defaultChatId'), // Chat route
//       },
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

// // Importing screens
// import 'screens/home_screen.dart';
// import 'screens/task_list_screen.dart';
// import 'screens/health_tracking_screen.dart';
// import 'screens/dashboard_screen.dart';
// import 'screens/login_screen.dart';
// import 'screens/registration_screen.dart';
// import 'screens/chat_screen.dart'; // Chat functionality

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   await Hive.initFlutter();
//   setupFCM();
//   runApp(MyApp());
// }

// void setupFCM() {
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     print('Received a message: ${message.messageId}');
//     // Handle the message in the app
//   });

//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//     print('Message clicked: ${message.messageId}');
//     // Handle when the notification is clicked and the app opens
//   });
// }

// class MyApp extends StatelessWidget {
//   // Use the named constructor to get the instance
//   final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Life Manager',
//       navigatorObservers: [
//         FirebaseAnalyticsObserver(analytics: analytics),
//       ],
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasData) {
//             return DashboardScreen();
//           }
//           return LoginScreen();
//         },
//       ),
//       routes: {
//         '/login': (context) => LoginScreen(),
//         '/register': (context) => RegistrationScreen(),
//         '/dashboard': (context) => DashboardScreen(),
//         '/home': (context) => HomeScreen(),
//         '/tasks': (context) => TaskListScreen(),
//         '/health': (context) => HealthTrackingScreen(),
//         '/chat': (context) => ChatScreen(chatId: 'defaultChatId'), // Chat route
//       },
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:life_manager_app/screens/auth_screen.dart';
// import 'package:life_manager_app/screens/profile_screen.dart';
// import 'package:life_manager_app/screens/settings_screen.dart';

// // Importing screens
// import 'screens/home_screen.dart';
// import 'screens/task_list_screen.dart';
// import 'screens/health_tracking_screen.dart';
// import 'screens/dashboard_screen.dart';
// import 'screens/login_screen.dart';
// import 'screens/registration_screen.dart';
// import 'screens/chat_screen.dart'; // Chat functionality

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   try {
//     await Firebase.initializeApp();
//     await Hive.initFlutter();
//     setupFCM();
//     runApp(MyApp());
//   } catch (e) {
//     print('Error during Firebase initialization: $e');
//   }
// }

// void setupFCM() {
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     print('Received a message: ${message.messageId}');
//     // Handle the message in the app
//   });

//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//     print('Message clicked: ${message.messageId}');
//     // Handle when the notification is clicked and the app opens
//   });
// }

// class MyApp extends StatelessWidget {
//   final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

//   MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Life Manager',
//       navigatorObservers: [
//         FirebaseAnalyticsObserver(analytics: analytics),
//       ],
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//         scaffoldBackgroundColor: Colors.grey[200],
//       ),
//       home: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasData) {
//             print('User is logged in: ${snapshot.data?.email}');
//             // return DashboardScreen();
//             return HomeScreen();
//           }
//           print('No user is logged in');
//           return LoginScreen();
//         },
//       ),
//       routes: {
//         '/login': (context) => LoginScreen(),
//         '/register': (context) => RegistrationScreen(),
//         '/dashboard': (context) => DashboardScreen(),
//         '/home': (context) => HomeScreen(),
//         '/tasks': (context) => TaskListScreen(),
//         '/health': (context) => HealthTrackingScreen(),
//         '/chat': (context) => ChatScreen(chatId: 'defaultChatId'),
//         '/auth': (context) => AuthScreen(),
//         '/profile': (context) => ProfileScreen(),
//         '/settings': (context) => SettingsScreen(),
//         // '/edittask': (context) => EditTaskScreen(),

//         // '/logs': (context) => LogScreen(), // Chat route AuthScreen SettingsScreen EditTaskScreen
//       },
//     );
//   }
// }
// // import 'edit_task_screen.dart';
// // import 'add_task_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:life_manager_app/screens/auth_screen.dart';
// import 'package:life_manager_app/screens/profile_screen.dart';
// import 'package:life_manager_app/screens/settings_screen.dart';

// // Importing screens
// import 'screens/home_screen.dart';
// import 'screens/task_list_screen.dart';
// import 'screens/health_tracking_screen.dart';
// import 'screens/dashboard_screen.dart';
// import 'screens/login_screen.dart';
// import 'screens/registration_screen.dart';
// import 'screens/chat_screen.dart'; // Chat functionality
// import 'services/settings_service.dart'; // Make sure you have this import

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   try {
//     await Firebase.initializeApp();
//     await Hive.initFlutter();
//     setupFCM();
//     runApp(MyApp());
//   } catch (e) {
//     print('Error during Firebase initialization: $e');
//   }
// }

// void setupFCM() {
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     print('Received a message: ${message.messageId}');
//     // Handle the message in the app
//   });

//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//     print('Message clicked: ${message.messageId}');
//     // Handle when the notification is clicked and the app opens
//   });
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool _darkMode = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadSettings();
//   }

//   void _loadSettings() async {
//     final settingsService = SettingsService();
//     final settings = await settingsService.getSettings();
//     setState(() {
//       _darkMode = settings.darkMode; // Load the saved dark mode setting
//     });
//   }

//   void _updateTheme(bool isDarkMode) {
//     setState(() {
//       _darkMode = isDarkMode;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Life Manager',
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//         scaffoldBackgroundColor: Colors.grey[200],
//       ),
//       darkTheme: ThemeData(
//         primarySwatch: Colors.teal,
//         scaffoldBackgroundColor: Colors.black87,
//       ),
//       themeMode: _darkMode ? ThemeMode.dark : ThemeMode.light, // Dynamically set theme
//       home: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasData) {
//             print('User is logged in: ${snapshot.data?.email}');
//             return HomeScreen(); // or DashboardScreen(); based on your needs
//           }
//           print('No user is logged in');
//           return LoginScreen();
//         },
//       ),
//       routes: {
//         '/login': (context) => LoginScreen(),
//         '/register': (context) => RegistrationScreen(),
//         '/dashboard': (context) => DashboardScreen(),
//         '/home': (context) => HomeScreen(),
//         '/tasks': (context) => TaskListScreen(),
//         '/health': (context) => HealthTrackingScreen(),
//         '/chat': (context) => ChatScreen(chatId: 'defaultChatId'),
//         '/auth': (context) => AuthScreen(),
//         '/profile': (context) => ProfileScreen(),
//         '/settings': (context) => SettingsScreen(onThemeChange: _updateTheme), // Pass theme change callback
//       },
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:life_manager_app/screens/auth_screen.dart';
// import 'package:life_manager_app/screens/profile_screen.dart';
// import 'package:life_manager_app/screens/settings_screen.dart';

// // Importing screens
// import 'screens/home_screen.dart';
// import 'screens/task_list_screen.dart';
// import 'screens/health_tracking_screen.dart';
// import 'screens/dashboard_screen.dart';
// import 'screens/login_screen.dart';
// import 'screens/registration_screen.dart';
// import 'screens/chat_screen.dart';
// import 'services/settings_service.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   try {
//     await Firebase.initializeApp();
//     await Hive.initFlutter();
//     setupFCM();
//     runApp(MyApp());
//   } catch (e) {
//     print('Error during Firebase initialization: $e');
//   }
// }

// void setupFCM() {
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     print('Received a message: ${message.messageId}');
//   });

//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//     print('Message clicked: ${message.messageId}');
//   });
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool _darkMode = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadSettings();
//   }

//   void _loadSettings() async {
//     final settingsService = SettingsService();
//     final settings = await settingsService.getSettings();
//     setState(() {
//       _darkMode = settings.darkMode;
//     });
//   }

//   void _updateTheme(bool isDarkMode) {
//     setState(() {
//       _darkMode = isDarkMode;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Life Manager',
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//         scaffoldBackgroundColor: Colors.grey[200],
//         textTheme: TextTheme(
//           bodyLarge: TextStyle(color: Colors.black),
//           bodyMedium: TextStyle(color: Colors.black87),
//         ),
//       ),
//       darkTheme: ThemeData(
//         primarySwatch: Colors.teal,
//         scaffoldBackgroundColor: Colors.black87,
//         textTheme: TextTheme(
//           bodyLarge: TextStyle(color: Colors.white),
//           bodyMedium: TextStyle(color: Colors.white70),
//         ),
//       ),
//       themeMode: _darkMode ? ThemeMode.dark : ThemeMode.light,
//       home: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasData) {
//             print('User is logged in: ${snapshot.data?.email}');
//             return HomeScreen();
//           }
//           print('No user is logged in');
//           return LoginScreen();
//         },
//       ),
//       routes: {
//         '/login': (context) => LoginScreen(),
//         '/register': (context) => RegistrationScreen(),
//         '/dashboard': (context) => DashboardScreen(),
//         '/home': (context) => HomeScreen(),
//         '/tasks': (context) => TaskListScreen(),
//         '/health': (context) => HealthTrackingScreen(),
//         '/chat': (context) => ChatScreen(chatId: 'defaultChatId'),
//         '/auth': (context) => AuthScreen(),
//         '/profile': (context) => ProfileScreen(),
//         '/settings': (context) => SettingsScreen(onThemeChange: _updateTheme),
//       },
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:life_manager_app/screens/auth_screen.dart';
// import 'package:life_manager_app/screens/profile_screen.dart';
// import 'package:life_manager_app/screens/settings_screen.dart';

// // Importing screens
// import 'screens/home_screen.dart';
// import 'screens/task_list_screen.dart';
// import 'screens/health_tracking_screen.dart';
// import 'screens/dashboard_screen.dart';
// import 'screens/login_screen.dart';
// import 'screens/registration_screen.dart';
// import 'screens/chat_screen.dart';
// import 'services/settings_service.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   try {
//     await Firebase.initializeApp();
//     await Hive.initFlutter();
//     setupFCM();
//     runApp(MyApp());
//   } catch (e) {
//     print('Error during Firebase initialization: $e');
//   }
// }

// void setupFCM() {
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     print('Received a message: ${message.messageId}');
//   });

//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//     print('Message clicked: ${message.messageId}');
//   });
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool _darkMode = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadSettings();
//   }

//   void _loadSettings() async {
//     final settingsService = SettingsService();
//     final settings = await settingsService.getSettings();
//     setState(() {
//       _darkMode = settings.darkMode;
//     });
//   }

//   void _updateTheme(bool isDarkMode) {
//     setState(() {
//       _darkMode = isDarkMode;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Life Manager',
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//         scaffoldBackgroundColor: Colors.grey[200],
//         textTheme: TextTheme(
//           bodyLarge: TextStyle(color: Colors.black),
//           bodyMedium: TextStyle(color: Colors.black87),
//         ),
//       ),
//       darkTheme: ThemeData(
//         primarySwatch: Colors.teal,
//         scaffoldBackgroundColor: Colors.black87,
//         textTheme: TextTheme(
//           bodyLarge: TextStyle(color: Colors.white),
//           bodyMedium: TextStyle(color: Colors.white70),
//         ),
//       ),
//       themeMode: _darkMode ? ThemeMode.dark : ThemeMode.light,
//       home: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasData) {
//             print('User is logged in: ${snapshot.data?.email}');
//             return HomeScreen();
//           }
//           print('No user is logged in');
//           return LoginScreen();
//         },
//       ),
//       routes: {
//         '/login': (context) => LoginScreen(),
//         '/register': (context) => RegistrationScreen(),
//         '/dashboard': (context) => DashboardScreen(),
//         '/home': (context) => HomeScreen(),
//         '/tasks': (context) => TaskListScreen(),
//         '/health': (context) => HealthTrackingScreen(),
//         // Update the /chat route to receive a dynamic chatId
//         '/chat': (context) {
//           // Retrieve the chatId from arguments passed when navigating to the route
//           final chatId = ModalRoute.of(context)!.settings.arguments as String;
//           return ChatScreen(chatId: chatId);
//         },
//         '/auth': (context) => AuthScreen(),
//         '/profile': (context) => ProfileScreen(),
//         '/settings': (context) => SettingsScreen(onThemeChange: _updateTheme),
//       },
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:life_manager_app/screens/auth_screen.dart';
// import 'package:life_manager_app/screens/profile_screen.dart';
// import 'package:life_manager_app/screens/settings_screen.dart';

// // Importing screens
// import 'screens/home_screen.dart';
// import 'screens/task_list_screen.dart';
// import 'screens/health_tracking_screen.dart';
// import 'screens/dashboard_screen.dart';
// import 'screens/login_screen.dart';
// import 'screens/registration_screen.dart';
// import 'screens/chat_screen.dart';
// import 'services/settings_service.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   try {
//     await Firebase.initializeApp();
//     await Hive.initFlutter();
//     setupFCM();
//     runApp(MyApp());
//   } catch (e) {
//     print('Error during Firebase initialization: $e');
//   }
// }

// void setupFCM() {
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     print('Received a message: ${message.messageId}');
//   });

//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//     print('Message clicked: ${message.messageId}');
//   });
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool _darkMode = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadSettings();
//   }

//   void _loadSettings() async {
//     final settingsService = SettingsService();
//     final settings = await settingsService.getSettings();
//     setState(() {
//       _darkMode = settings.darkMode;
//     });
//   }

//   void _updateTheme(bool isDarkMode) {
//     setState(() {
//       _darkMode = isDarkMode;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Life Manager',
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//         scaffoldBackgroundColor: Colors.grey[200],
//         textTheme: TextTheme(
//           bodyLarge: TextStyle(color: Colors.black),
//           bodyMedium: TextStyle(color: Colors.black87),
//         ),
//       ),
//       darkTheme: ThemeData(
//         primarySwatch: Colors.teal,
//         scaffoldBackgroundColor: Colors.black87,
//         textTheme: TextTheme(
//           bodyLarge: TextStyle(color: Colors.white),
//           bodyMedium: TextStyle(color: Colors.white70),
//         ),
//       ),
//       themeMode: _darkMode ? ThemeMode.dark : ThemeMode.light,
//       home: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasData) {
//             print('User is logged in: ${snapshot.data?.email}');
//             return HomeScreen();
//           }
//           print('No user is logged in');
//           return LoginScreen();
//         },
//       ),
//       routes: {
//         '/login': (context) => LoginScreen(),
//         '/register': (context) => RegistrationScreen(),
//         '/dashboard': (context) => DashboardScreen(),
//         '/home': (context) => HomeScreen(),
//         '/tasks': (context) => TaskListScreen(),
//         '/health': (context) => HealthTrackingScreen(),
//         // Update the /chat route to receive a dynamic chatId
//         '/chat': (context) {
//           final args = ModalRoute.of(context)!.settings.arguments;
//           if (args is String) {
//             return ChatScreen(chatId: args);
//           }
//           // Handle error if args is not a String
//           return Scaffold(
//             body: Center(child: Text('Invalid chat ID')),
//           );
//         },
//         '/auth': (context) => AuthScreen(),
//         '/profile': (context) => ProfileScreen(),
//         '/settings': (context) => SettingsScreen(onThemeChange: _updateTheme),
//       },
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:life_manager_app/screens/auth_screen.dart';
// import 'package:life_manager_app/screens/log_screen.dart';
// import 'package:life_manager_app/screens/profile_screen.dart';
// import 'package:life_manager_app/screens/settings_screen.dart';
// import 'services/notification_service.dart'; // Import the NotificationService

// // Importing screens
// import 'screens/home_screen.dart';
// import 'screens/task_list_screen.dart';
// import 'screens/health_tracking_screen.dart';
// import 'screens/dashboard_screen.dart';
// import 'screens/login_screen.dart';
// import 'screens/registration_screen.dart';
// import 'screens/chat_screen.dart';
// import 'services/settings_service.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   try {
//     await Firebase.initializeApp();
//     await Hive.initFlutter();
//     await NotificationService().init(); // Initialize NotificationService
//     setupFCM();
//     runApp(MyApp());
//   } catch (e) {
//     print('Error during initialization: $e');
//   }
// }

// void setupFCM() {
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     print('Received a message: ${message.messageId}');
//     // Show notification when app is in the foreground
//     NotificationService().showNotification(
//       message.notification?.title ?? 'New Notification',
//       message.notification?.body ?? '',
//     );
//   });

//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//     print('Message clicked: ${message.messageId}');
//   });
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool _darkMode = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadSettings();
//   }

//   void _loadSettings() async {
//     final settingsService = SettingsService();
//     final settings = await settingsService.getSettings();
//     setState(() {
//       _darkMode = settings.darkMode;
//     });
//   }

//   void _updateTheme(bool isDarkMode) {
//     setState(() {
//       _darkMode = isDarkMode;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Life Manager',
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//         scaffoldBackgroundColor: Colors.grey[200],
//         textTheme: TextTheme(
//           bodyLarge: TextStyle(color: Colors.black),
//           bodyMedium: TextStyle(color: Colors.black87),
//         ),
//       ),
//       darkTheme: ThemeData(
//         primarySwatch: Colors.teal,
//         scaffoldBackgroundColor: const Color.fromARGB(221, 34, 26, 26),
//         textTheme: TextTheme(
//           bodyLarge: TextStyle(color: Colors.white),
//           bodyMedium: TextStyle(color: Colors.white70),
//         ),
//       ),
//       themeMode: _darkMode ? ThemeMode.dark : ThemeMode.light,
//       home: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasData) {
//             print('User is logged in: ${snapshot.data?.email}');
//             return HomeScreen();
//           }
//           print('No user is logged in');
//           return LoginScreen();
//         },
//       ),
//       routes: {
//         '/login': (context) => LoginScreen(),
//         '/register': (context) => RegistrationScreen(),
//         '/dashboard': (context) => DashboardScreen(),
//         '/home': (context) => HomeScreen(),
//         '/tasks': (context) => TaskListScreen(),
//         '/health': (context) => HealthTrackingScreen(),
//         // Update the /chat route to receive a dynamic chatId

//         // '/chat': (context) {
//         //   final args = ModalRoute.of(context)!.settings.arguments;
//         //   if (args is String) {
//         //     return ChatScreen(chatId: args);
//         //   }
//         //   // Handle error if args is not a String
//         //   return Scaffold(
//         //     body: Center(child: Text('Invalid chat ID')),
//         //   );
//         // },
//         '/chat': (context) => ChatScreen(chatId: 'defaultChatId'),
//         '/auth': (context) => AuthScreen(),
//         '/profile': (context) => ProfileScreen(),
//         '/settings': (context) => SettingsScreen(onThemeChange: _updateTheme),
//         '/logscreen': (context) => LogScreen(),
//       },
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:life_manager_app/screens/auth_screen.dart';
// import 'package:life_manager_app/screens/chat_list_screen.dart';
// import 'package:life_manager_app/screens/finance_screen.dart';
// import 'package:life_manager_app/screens/log_screen.dart';
// import 'package:life_manager_app/screens/profile_screen.dart';
// import 'package:life_manager_app/screens/recent_chats_screen.dart';
// import 'package:life_manager_app/screens/settings_screen.dart';
// import 'package:life_manager_app/screens/social_screen.dart';
// import 'package:life_manager_app/services/task_service.dart';
// import 'services/notification_service.dart'; // Import the NotificationService

// // Importing screens
// import 'screens/home_screen.dart';
// import 'screens/task_list_screen.dart'; // Importing the TaskListScreen
// import 'screens/health_tracking_screen.dart'; // Importing the HealthTrackingScreen
// import 'screens/dashboard_screen.dart';
// import 'screens/login_screen.dart';
// import 'screens/registration_screen.dart';
// import 'screens/chat_screen.dart';
// import 'services/settings_service.dart';
// import 'services/health_service.dart';

// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
// final TaskService _taskService = TaskService();
// final HealthService _healthService = HealthService();
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   try {
//     await Firebase.initializeApp();
//     await Hive.initFlutter();
//     await NotificationService().init(); // Initialize NotificationService
//     setupFCM();
    
//     runApp(MyApp());
//   } catch (e) {
//     print('Error during initialization: $e');
//   }
// }



// void setupFCM() {
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     print('Received a message: ${message.messageId}');
//     // Show notification when app is in the foreground
//     NotificationService().showNotification(
//       message.notification?.title ?? 'New Notification',
//       message.notification?.body ?? '',
//     );
//   });

//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//     print('Message clicked: ${message.messageId}');
//   });
// }

// class MyApp extends StatefulWidget {
  
//   @override
//   _MyAppState createState() => _MyAppState();
  
// }

// class _MyAppState extends State<MyApp> {
//   bool _darkMode = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadSettings();
//   }

//   void _loadSettings() async {
//     final settingsService = SettingsService();
//     final settings = await settingsService.getSettings();
//     setState(() {
//       _darkMode = settings.darkMode;
//     });
//   }

//   void _updateTheme(bool isDarkMode) {
//     setState(() {
//       _darkMode = isDarkMode;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Life Manager',
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//         scaffoldBackgroundColor: Colors.grey[200],
//         textTheme: TextTheme(
//           bodyLarge: TextStyle(color: Colors.black),
//           bodyMedium: TextStyle(color: Colors.black87),
//         ),
//       ),
//       darkTheme: ThemeData(
//         primarySwatch: Colors.teal,
//         scaffoldBackgroundColor: const Color.fromARGB(221, 34, 26, 26),
//         textTheme: TextTheme(
//           bodyLarge: TextStyle(color: Colors.white),
//           bodyMedium: TextStyle(color: Colors.white70),
//         ),
//       ),
//       themeMode: _darkMode ? ThemeMode.dark : ThemeMode.light,
//       home: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasData) {
//             final userId = snapshot.data!.uid; // Get the user's ID
//             return HomeScreen(userId: userId); // Pass userId to HomeScreen
//           }
//           return LoginScreen();
//         },
//       ),
//       routes: {
//         '/login': (context) => LoginScreen(),
//         '/register': (context) => RegistrationScreen(),
//         // '/dashboard': (context) => DashboardScreen(),
//         // '/home': (context) => HomeScreen(),
//         // //  '/tasks': (context) => TaskListScreen(taskService: _taskService), // Pass an instance of TaskService
//         // '/health': (context) => HealthTrackingScreen(healthService: _healthService),// Use the correct class
//         '/dashboard': (context) {
//           final userId = FirebaseAuth.instance.currentUser?.uid; // Get userId
//           return DashboardScreen(userId: userId!); // Pass userId to DashboardScreen
//         },
//         '/home': (context) {
//           final userId = FirebaseAuth.instance.currentUser?.uid; // Get userId
//           return HomeScreen(userId: userId!); // Pass userId to HomeScreen
//         }, 
//         '/chat': (context) => ChatScreen(chatId: 'defaultChatId'),
//         '/tasks': (context) => TaskListScreen(),
//         '/auth': (context) => AuthScreen(),
//         '/profile': (context) => ProfileScreen(),
//         '/settings': (context) => SettingsScreen(onThemeChange: _updateTheme),
//         '/logscreen': (context) => LogScreen(),
//         '/finance': (context) => FinanceScreen(),
//         '/social': (context) => SocialScreen(),
//         '/chatList': (context) => ChatListScreen(),
//         '/recentchat': (context) => RecentChatsScreen(),
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:life_manager_app/screens/auth_screen.dart';
// import 'package:life_manager_app/screens/chat_list_screen.dart';
// import 'package:life_manager_app/screens/finance_screen.dart';
// import 'package:life_manager_app/screens/log_screen.dart';
// import 'package:life_manager_app/screens/profile_screen.dart';
// import 'package:life_manager_app/screens/recent_chats_screen.dart';
// import 'package:life_manager_app/screens/settings_screen.dart';
// import 'package:life_manager_app/screens/social_screen.dart';
// import 'package:life_manager_app/services/task_service.dart';
// import 'services/notification_service.dart'; // Import the NotificationService
// import 'screens/home_screen.dart';
// import 'screens/task_list_screen.dart'; // Importing the TaskListScreen
// import 'screens/health_tracking_screen.dart'; // Importing the HealthTrackingScreen
// import 'screens/dashboard_screen.dart';
// import 'screens/login_screen.dart';
// import 'screens/registration_screen.dart';
// import 'screens/chat_screen.dart';
// import 'services/settings_service.dart';
// import 'services/health_service.dart';

// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
// final TaskService _taskService = TaskService();
// final HealthService _healthService = HealthService();


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   try {
//     await Firebase.initializeApp();
//     await Hive.initFlutter();
//     await NotificationService().init(); // Initialize NotificationService
//     setupFCM();

//     runApp(MyApp());
//   } catch (e) {
//     print('Error during initialization: $e');
//   }
// }

// void setupFCM() {
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     print('Received a message: ${message.messageId}');
//     // Show notification when app is in the foreground
//     NotificationService().showNotification(
//       message.notification?.title ?? 'New Notification',
//       message.notification?.body ?? '',
//     );
//   });

//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//     print('Message clicked: ${message.messageId}');
//   });
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool _darkMode = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadSettings();
//   }

//   // void _loadSettings() async {
//   //   final settingsService = SettingsService();
//   //   final settings = await settingsService.getSettings();
//   //   setState(() {
//   //     _darkMode = settings.darkMode;
//   //   });
//   // }
// void _loadSettings() async {
//   final settingsService = SettingsService();
//   final userId = FirebaseAuth.instance.currentUser?.uid; // Get the current user ID
  
//   if (userId != null) { // Ensure userId is available
//     try {
//       final settings = await settingsService.getSettings(userId); // Pass userId
//       setState(() {
//         _darkMode = settings.darkMode; // Update dark mode state
//       });
//     } catch (e) {
//       print("Error loading settings: $e");
//       // Optionally, set a default value for darkMode if loading settings fails
//       setState(() {
//         _darkMode = false; // Default to light mode
//       });
//     }
//   } else {
//     // Handle case when there is no authenticated user
//     print("No user is logged in. Cannot load settings.");
//     // Optionally, set a default value for darkMode
//     setState(() {
//       _darkMode = false; // Default to light mode
//     });
//   }
// }

//   void _updateTheme(bool isDarkMode) {
//     setState(() {
//       _darkMode = isDarkMode;
//     });
//   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Life Manager',
// //       theme: ThemeData(
// //         primarySwatch: Colors.teal,
// //         scaffoldBackgroundColor: Colors.grey[200],
// //         textTheme: TextTheme(
// //           bodyLarge: TextStyle(color: Colors.black),
// //           bodyMedium: TextStyle(color: Colors.black87),
// //         ),
// //       ),
// //       darkTheme: ThemeData(
// //         primarySwatch: Colors.teal,
// //         scaffoldBackgroundColor: const Color.fromARGB(221, 34, 26, 26),
// //         textTheme: TextTheme(
// //           bodyLarge: TextStyle(color: Colors.white),
// //           bodyMedium: TextStyle(color: Colors.white70),
// //         ),
// //       ),
// //       themeMode: _darkMode ? ThemeMode.dark : ThemeMode.light,
// //       home: StreamBuilder<User?>(
// //         stream: FirebaseAuth.instance.authStateChanges(),
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return Center(child: CircularProgressIndicator());
// //           }
// //           if (snapshot.hasData) {
// //             final userId = snapshot.data!.uid; // Get the user's ID
// //             return HomeScreen(userId: userId); // Pass userId to HomeScreen
// //           }
// //           return LoginScreen();
// //         },
// //       ),
      
// //       routes: {
// //         '/login': (context) => LoginScreen(),
// //         '/register': (context) => RegistrationScreen(),
// //         '/dashboard': (context) {
// //           final userId = FirebaseAuth.instance.currentUser?.uid; // Get userId
// //           return DashboardScreen(userId: userId!); // Pass userId to DashboardScreen
// //         },
// //         '/home': (context) {
// //           final userId = FirebaseAuth.instance.currentUser?.uid; // Get userId
// //           return HomeScreen(userId: userId!); // Pass userId to HomeScreen
// //         },
        
// //         '/health': (context) {
// //           final userId = FirebaseAuth.instance.currentUser?.uid; // Get userId
// //           return HealthTrackingScreen(userId: userId!, healthService: HealthService(),); // Pass userId to HomeScreen
// //         },
// //         '/chat': (context) => ChatScreen(chatId: 'defaultChatId'),
// //         '/tasks': (context) => TaskListScreen(),
// //         '/auth': (context) => AuthScreen(),
// //         '/profile': (context) => ProfileScreen(),
// //         '/settings': (context) {
// //           final userId = FirebaseAuth.instance.currentUser?.uid; // Get userId
// //           return SettingsScreen(
// //             onThemeChange: _updateTheme, // Pass the theme update callback
// //             userId: userId!, // Pass userId to SettingsScreen
// //           );
// //         }, // Updated to include theme change callback
// //         '/logscreen': (context) => LogScreen(),
// //         '/finance': (context) => FinanceScreen(),
// //         '/social': (context) => SocialScreen(),
// //         '/chatList': (context) => ChatListScreen(),
// //         '/recentchat': (context) => RecentChatsScreen(),
// //       },
// //     );
// //   }
// // }
// @override
// Widget build(BuildContext context) {
//   return MaterialApp(
//     title: 'Life Manager',
//     theme: ThemeData(
//       primarySwatch: Colors.teal,
//       scaffoldBackgroundColor: Colors.grey[200],
//       textTheme: TextTheme(
//         bodyLarge: TextStyle(color: Colors.black),
//         bodyMedium: TextStyle(color: Colors.black87),
//       ),
//     ),
//     darkTheme: ThemeData(
//       primarySwatch: Colors.teal,
//       scaffoldBackgroundColor: const Color.fromARGB(221, 34, 26, 26),
//       textTheme: TextTheme(
//         bodyLarge: TextStyle(color: Colors.white),
//         bodyMedium: TextStyle(color: Colors.white70),
//       ),
//     ),
//     themeMode: _darkMode ? ThemeMode.dark : ThemeMode.light,
//     home: StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         }
//         if (snapshot.hasError) {
//           return Center(child: Text("Error: ${snapshot.error}")); // Handle error case
//         }
//         if (snapshot.hasData) {
//           final userId = snapshot.data!.uid; // Get the user's ID
//           return HomeScreen(userId: userId); // Pass userId to HomeScreen
//         }
//         return const LoginScreen(); // User is not logged in, show LoginScreen
//       },
//     ),
//     routes: {
//       '/login': (context) => const LoginScreen(),
//       '/register': (context) => const RegistrationScreen(),
//       '/dashboard': (context) => _getDashboardScreen(context),
//       '/home': (context) => _getHomeScreen(context),
//       '/health': (context) => _getHealthScreen(context),
//       '/chat': (context) => const ChatScreen(chatId: 'defaultChatId'),
//       '/tasks': (context) => const TaskListScreen(),
//       '/auth': (context) => const AuthScreen(),
//       '/profile': (context) => const ProfileScreen(),
//       '/settings': (context) => _getSettingsScreen(context),
//       '/logscreen': (context) => LogScreen(),
//       '/finance': (context) =>  FinanceScreen(),
//       '/social': (context) =>  SocialScreen(),
//       '/chatList': (context) =>  ChatListScreen(),
//       '/recentchat': (context) =>  RecentChatsScreen(),
//     },
//   );
// }

// Widget _getDashboardScreen(BuildContext context) {
//   final userId = _getUserId();
//   return userId != null ? DashboardScreen(userId: userId) : const LoginScreen();
// }

// Widget _getHomeScreen(BuildContext context) {
//   final userId = _getUserId();
//   return userId != null ? HomeScreen(userId: userId) : const LoginScreen();
// }

// Widget _getHealthScreen(BuildContext context) {
//   final userId = _getUserId();
//   return userId != null
//       ? HealthTrackingScreen(userId: userId, healthService: HealthService())
//       : const LoginScreen();
// }

// Widget _getSettingsScreen(BuildContext context) {
//   final userId = _getUserId();
//   return userId != null
//       ? SettingsScreen(onThemeChange: _updateTheme, userId: userId)
//       : const LoginScreen();
// }

// String? _getUserId() {
//   return FirebaseAuth.instance.currentUser?.uid; // Fetch userId
// }
// }
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:life_manager_app/screens/auth_screen.dart';
// import 'package:life_manager_app/screens/chat_list_screen.dart';
// import 'package:life_manager_app/screens/finance_screen.dart';
// import 'package:life_manager_app/screens/log_screen.dart';
// import 'package:life_manager_app/screens/profile_screen.dart';
// import 'package:life_manager_app/screens/recent_chats_screen.dart';
// import 'package:life_manager_app/screens/settings_screen.dart';
// import 'package:life_manager_app/screens/social_screen.dart';
// import 'package:life_manager_app/services/task_service.dart';
// import 'services/notification_service.dart';
// import 'screens/home_screen.dart';
// import 'screens/task_list_screen.dart';
// import 'screens/health_tracking_screen.dart';
// import 'screens/dashboard_screen.dart';
// import 'screens/login_screen.dart';
// import 'screens/registration_screen.dart';
// import 'screens/chat_screen.dart';
// import 'services/settings_service.dart';
// import 'services/health_service.dart';

// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
// final TaskService _taskService = TaskService();
// final HealthService _healthService = HealthService();

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   try {
//     await Firebase.initializeApp();
//     await Hive.initFlutter();
//     await NotificationService().init();
//     setupFCM();
//     runApp(MyApp());
//   } catch (e) {
//     print('Error during initialization: $e');
//   }
// }

// void setupFCM() {
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     print('Received a message: ${message.messageId}');
//     NotificationService().showNotification(
//       message.notification?.title ?? 'New Notification',
//       message.notification?.body ?? '',
//     );
//   });

//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//     print('Message clicked: ${message.messageId}');
//   });
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool _darkMode = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadSettings();
//   }

//   void _loadSettings() async {
//     final settingsService = SettingsService();
//     final userId = FirebaseAuth.instance.currentUser?.uid;

//     if (userId != null) {
//       try {
//         final settings = await settingsService.getSettings(userId);
//         setState(() {
//           _darkMode = settings.darkMode;
//         });
//       } catch (e) {
//         print("Error loading settings: $e");
//         setState(() {
//           _darkMode = false;
//         });
//       }
//     } else {
//       print("No user is logged in. Cannot load settings.");
//       setState(() {
//         _darkMode = false;
//       });
//     }
//   }

//   void _updateTheme(bool isDarkMode) {
//     setState(() {
//       _darkMode = isDarkMode;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Life Manager',
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//         scaffoldBackgroundColor: Colors.grey[200],
//         textTheme: TextTheme(
//           bodyLarge: TextStyle(color: Colors.black),
//           bodyMedium: TextStyle(color: Colors.black87),
//         ),
//       ),
//       darkTheme: ThemeData(
//         primarySwatch: Colors.teal,
//         scaffoldBackgroundColor: const Color.fromARGB(221, 34, 26, 26),
//         textTheme: TextTheme(
//           bodyLarge: TextStyle(color: Colors.white),
//           bodyMedium: TextStyle(color: Colors.white70),
//         ),
//       ),
//       themeMode: _darkMode ? ThemeMode.dark : ThemeMode.light,
//       home: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             return Center(child: Text("Error: ${snapshot.error}"));
//           }
//           if (snapshot.hasData) {
//             final userId = snapshot.data!.uid;
//             return HomeScreen(userId: userId);
//           }
//           return const LoginScreen();
//         },
//       ),
//       routes: {
//         '/login': (context) => const LoginScreen(),
//         '/register': (context) => const RegistrationScreen(),
//         '/dashboard': (context) => _getDashboardScreen(context),
//         '/home': (context) => _getHomeScreen(context),
//         '/health': (context) => _getHealthScreen(context),
//         '/chat': (context) => const ChatScreen(chatId: 'defaultChatId'),
//         '/tasks': (context) => const TaskListScreen(),
//         '/auth': (context) => const AuthScreen(),
//         '/profile': (context) => const ProfileScreen(),
//         '/settings': (context) => _getSettingsScreen(context),
//         '/logscreen': (context) => LogScreen(),
//         '/finance': (context) => FinanceScreen(),
//         '/social': (context) => SocialScreen(),
//         '/chatList': (context) => ChatListScreen(),
//         '/recentchat': (context) => RecentChatsScreen(),
//       },
//     );
//   }

//   Widget _getDashboardScreen(BuildContext context) {
//     final userId = _getUserId();
//     return userId != null ? DashboardScreen(userId: userId) : const LoginScreen();
//   }

//   Widget _getHomeScreen(BuildContext context) {
//     final userId = _getUserId();
//     return userId != null ? HomeScreen(userId: userId) : const LoginScreen();
//   }

//   Widget _getHealthScreen(BuildContext context) {
//     final userId = _getUserId();
//     return userId != null
//         ? HealthTrackingScreen(userId: userId, healthService: HealthService())
//         : const LoginScreen();
//   }

//   Widget _getSettingsScreen(BuildContext context) {
//     final userId = _getUserId();
//     return userId != null
//         ? SettingsScreen(onThemeChange: _updateTheme, userId: userId)
//         : const LoginScreen();
//   }

//   String? _getUserId() {
//     return FirebaseAuth.instance.currentUser?.uid;
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:life_manager_app/models/task.dart';
// import 'package:life_manager_app/screens/auth_screen.dart';
// import 'package:life_manager_app/screens/chat_list_screen.dart';
// import 'package:life_manager_app/screens/finance_screen.dart';
// import 'package:life_manager_app/screens/log_screen.dart';
// import 'package:life_manager_app/screens/profile_screen.dart';
// import 'package:life_manager_app/screens/recent_chats_screen.dart';
// import 'package:life_manager_app/screens/settings_screen.dart';
// import 'package:life_manager_app/screens/social_screen.dart';
// import 'package:life_manager_app/services/task_service.dart';
// import 'services/notification_service.dart';
// import 'screens/home_screen.dart';
// import 'screens/task_list_screen.dart';
// import 'screens/health_tracking_screen.dart';
// import 'screens/dashboard_screen.dart';
// import 'screens/login_screen.dart';
// import 'screens/registration_screen.dart';
// import 'screens/chat_screen.dart';
// import 'services/settings_service.dart';
// import 'services/health_service.dart';

// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
// final TaskService _taskService = TaskService();
// final HealthService _healthService = HealthService();

// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   try {
// //     await Firebase.initializeApp();
// //     await Hive.initFlutter();
// //     await NotificationService().init();
// //     Hive.registerAdapter(TaskAdapter());
// //     await Hive.openBox<Task>('tasks');
// //     setupFCM();
// //     runApp(MyApp());
// //   } catch (e) {
// //     print('Error during initialization: $e');
// //   }
// // }
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   try {
//     await Firebase.initializeApp();
//     await Hive.initFlutter();
//     await NotificationService().init();
//     Hive.registerAdapter(TaskAdapter());

//     // Initialize the Hive box once.
//     await Hive.openBox<Task>('taskBox');
//     await Hive.openBox<Task>('tasks');
    
//     setupFCM();
//     runApp(MyApp());
//   } catch (e) {
//     print('Error during initialization: $e');
//   }
// }


// // class HiveService {
// //   static late Box<Task> _taskBox;

// //   // Singleton method to get the Hive box
// //   static Future<Box<Task>> get taskBox async {
// //     if (_taskBox == null) {
// //       _taskBox = await Hive.openBox<Task>('tasks');
// //     }
// //     return _taskBox;
// //   }
// // }
// class HiveService {
//   static Box<Task>? _taskBox;

//   // Singleton method to get the Hive box
//   static Future<Box<Task>> get taskBox async {
//     // If the box isn't initialized, open it.
//     if (_taskBox == null) {
//       _taskBox = await Hive.openBox<Task>('tasks');
//     }
//     return _taskBox!;
//   }
// }




// void setupFCM() {
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     print('Received a message: ${message.messageId}');
//     NotificationService().showNotification(
//       message.notification?.title ?? 'New Notification',
//       message.notification?.body ?? '',
//     );
//   });

//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//     print('Message clicked: ${message.messageId}');
//   });
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool _darkMode = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadSettings();
//   }

//   void _loadSettings() async {
//     final settingsService = SettingsService();
//     final userId = FirebaseAuth.instance.currentUser?.uid;

//     if (userId != null) {
//       try {
//         final settings = await settingsService.getSettings(userId);
//         setState(() {
//           _darkMode = settings.darkMode;
//         });
//       } catch (e) {
//         print("Error loading settings: $e");
//         setState(() {
//           _darkMode = false;
//         });
//       }
//     } else {
//       print("No user is logged in. Cannot load settings.");
//       setState(() {
//         _darkMode = false;
//       });
//     }
//   }

//   void _updateTheme(bool isDarkMode) {
//     setState(() {
//       _darkMode = isDarkMode;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Life Manager',
//       navigatorKey: navigatorKey,  // Set navigatorKey for global navigation control
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//         scaffoldBackgroundColor: Colors.grey[200],
//         textTheme: const TextTheme(
//           bodyLarge: TextStyle(color: Colors.black),
//           bodyMedium: TextStyle(color: Colors.black87),
//         ),
//       ),
//       darkTheme: ThemeData(
//         primarySwatch: Colors.teal,
//         scaffoldBackgroundColor: const Color.fromARGB(221, 34, 26, 26),
//         textTheme: const TextTheme(
//           bodyLarge: TextStyle(color: Colors.white),
//           bodyMedium: TextStyle(color: Colors.white70),
//         ),
//       ),
//       themeMode: _darkMode ? ThemeMode.dark : ThemeMode.light,
//       home: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             return Center(child: Text("Error: ${snapshot.error}"));
//           }
//           if (snapshot.hasData) {
//             final userId = snapshot.data!.uid;
//             return HomeScreen(userId: userId);
//           }
//           return const LoginScreen();
//         },
//       ),
//       routes: {
//         '/login': (context) => const LoginScreen(),
//         '/register': (context) => const RegistrationScreen(),
//         // '/dashboard': (context) => _getDashboardScreen(context),
//         '/home': (context) => _getHomeScreen(context),
//         '/health': (context) => _getHealthScreen(context),
//         '/chat': (context) => const ChatScreen(chatId: 'defaultChatId'),
//         '/tasks': (context) => const TaskListScreen(),
//         '/auth': (context) => const AuthScreen(),
//         '/profile': (context) => const ProfileScreen(),
//         '/settings': (context) => _getSettingsScreen(context),
//         '/logscreen': (context) => LogScreen(),
//         '/finance': (context) => FinanceScreen(),
//         '/social': (context) => SocialScreen(),
//         '/chatList': (context) => ChatListScreen(),
//         '/recentchat': (context) => RecentChatsScreen(),
//       },
//     );
//   }

//   // Widget _getDashboardScreen(BuildContext context) {
//   //   final userId = _getUserId();
//   //   return userId != null ? DashboardScreen(userId: userId) : const LoginScreen();
//   // }

//   Widget _getHomeScreen(BuildContext context) {
//     final userId = _getUserId();
//     return userId != null ? HomeScreen(userId: userId) : const LoginScreen();
//   }

//   Widget _getHealthScreen(BuildContext context) {
//     final userId = _getUserId();
//     return userId != null
//         ? HealthTrackingScreen(userId: userId, healthService: HealthService())
//         : const LoginScreen();
//   }

//   Widget _getSettingsScreen(BuildContext context) {
//     final userId = _getUserId();
//     return userId != null
//         ? SettingsScreen(onThemeChange: _updateTheme, userId: userId)
//         : const LoginScreen();
//   }

//   String? _getUserId() {
//     return FirebaseAuth.instance.currentUser?.uid;
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:life_manager_app/screens/auth_screen.dart';
// import 'package:life_manager_app/screens/chat_list_screen.dart';
// import 'package:life_manager_app/screens/finance_screen.dart';
// import 'package:life_manager_app/screens/log_screen.dart';
// import 'package:life_manager_app/screens/profile_screen.dart';
// import 'package:life_manager_app/screens/recent_chats_screen.dart';
// import 'package:life_manager_app/screens/settings_screen.dart';
// import 'package:life_manager_app/screens/social_screen.dart';
// import 'package:life_manager_app/services/task_service.dart';
// import 'services/notification_service.dart';
// import 'screens/home_screen.dart';
// import 'screens/task_list_screen.dart';
// import 'screens/health_tracking_screen.dart';
// import 'screens/dashboard_screen.dart';
// import 'screens/login_screen.dart';
// import 'screens/registration_screen.dart';
// import 'screens/chat_screen.dart';
// import 'services/settings_service.dart';
// import 'services/health_service.dart';

// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
// final TaskService _taskService = TaskService();
// final HealthService _healthService = HealthService();

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   try {
//     // Initialize Supabase
//     await Supabase.initialize(
//       url: 'https://iowuqwgrqqsvuvincdxv.supabase.co',
//       anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imlvd3Vxd2dycXFzdnV2aW5jZHh2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzMxNTEwNjYsImV4cCI6MjA0ODcyNzA2Nn0.hNIo5mvCueatjK_Agbiv197w0qr46VjMOqZOTDP6ZJc',
//     );
//     runApp(MyApp());
//   } catch (e) {
//     print('Error during initialization: $e');
//   }
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool _darkMode = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadSettings();
//   }

//   void _loadSettings() async {
//     final settingsService = SettingsService();
//     final user = Supabase.instance.client.auth.currentUser;

//     if (user != null) {
//       try {
//         final settings = await settingsService.getSettings(user.id);
//         setState(() {
//           _darkMode = settings.darkMode;
//         });
//       } catch (e) {
//         print("Error loading settings: $e");
//         setState(() {
//           _darkMode = false;
//         });
//       }
//     } else {
//       print("No user is logged in. Cannot load settings.");
//       setState(() {
//         _darkMode = false;
//       });
//     }
//   }

//   void _updateTheme(bool isDarkMode) {
//     setState(() {
//       _darkMode = isDarkMode;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Life Manager',
//       navigatorKey: navigatorKey,
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//         scaffoldBackgroundColor: Colors.grey[200],
//         textTheme: const TextTheme(
//           bodyLarge: TextStyle(color: Colors.black),
//           bodyMedium: TextStyle(color: Colors.black87),
//         ),
//       ),
//       darkTheme: ThemeData(
//         primarySwatch: Colors.teal,
//         scaffoldBackgroundColor: const Color.fromARGB(221, 34, 26, 26),
//         textTheme: const TextTheme(
//           bodyLarge: TextStyle(color: Colors.white),
//           bodyMedium: TextStyle(color: Colors.white70),
//         ),
//       ),
//       themeMode: _darkMode ? ThemeMode.dark : ThemeMode.light,
//       home: StreamBuilder<AuthState>(
//         stream: Supabase.instance.client.auth.onAuthStateChange,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             return Center(child: Text("Error: ${snapshot.error}"));
//           }
//           if (snapshot.data?.event == AuthChangeEvent.signedIn) {
//             final userId = snapshot.data?.session?.user?.id;
//             return HomeScreen(userId: userId!);
//           }
//           return const LoginScreen();
//         },
//       ),
//       routes: {
//         '/login': (context) => const LoginScreen(),
//         '/register': (context) => const RegistrationScreen(),
//         '/home': (context) => _getHomeScreen(context),
//         '/health': (context) => _getHealthScreen(context),
//         '/chat': (context) => const ChatScreen(chatId: 'defaultChatId'),
//         '/tasks': (context) => const TaskListScreen(),
//         '/auth': (context) => const AuthScreen(),
//         '/profile': (context) => const ProfileScreen(),
//         '/settings': (context) => _getSettingsScreen(context),
//         '/logscreen': (context) => LogScreen(),
//         '/finance': (context) => FinanceScreen(),
//         '/social': (context) => SocialScreen(),
//         '/chatList': (context) => ChatListScreen(),
//         '/recentchat': (context) => RecentChatsScreen(),
//       },
//     );
//   }

//   Widget _getHomeScreen(BuildContext context) {
//     final user = Supabase.instance.client.auth.currentUser;
//     return user != null ? HomeScreen(userId: user.id) : const LoginScreen();
//   }

//   Widget _getHealthScreen(BuildContext context) {
//     final user = Supabase.instance.client.auth.currentUser;
//     return user != null
//         ? HealthTrackingScreen(userId: user.id, healthService: _healthService)
//         : const LoginScreen();
//   }

//   Widget _getSettingsScreen(BuildContext context) {
//     final user = Supabase.instance.client.auth.currentUser;
//     return user != null
//         ? SettingsScreen(onThemeChange: _updateTheme, userId: user.id)
//         : const LoginScreen();
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:life_manager_app/prehome_screen.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'home_screen.dart';
// import 'login_screen.dart';
// import 'profile_screen.dart';
// import 'settings_screen.dart';
// import 'upload_marks_screen.dart';
// import 'marks_display_screen.dart';
// import 'weekly_marks_screen.dart';
// import 'monthly_marks_screen.dart';
// import 'half_yearly_marks_screen.dart';
// import 'splash_screen.dart';
// // import 'yearly_marks_screen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Supabase.initialize(
//       url: 'https://iowuqwgrqqsvuvincdxv.supabase.co',
//       anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imlvd3Vxd2dycXFzdnV2aW5jZHh2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzMxNTEwNjYsImV4cCI6MjA0ODcyNzA2Nn0.hNIo5mvCueatjK_Agbiv197w0qr46VjMOqZOTDP6ZJc',
//   );
//   runApp(MyApp());
// }


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Marks App',
//       initialRoute: '/login',
//       routes: {
//         '/home': (context) => HomeScreen(),
//         '/login': (context) => LoginScreen(),
//         '/profile': (context) => ProfileScreen(),
//         '/settings': (context) => SettingsScreen(),
//         '/upload_marks': (context) => UploadMarksScreen(),
//         '/weekly_marks': (context) => WeeklyMarksScreen(),
//         '/monthly_marks': (context) => MonthlyMarksScreen(),
//         '/half_yearly_marks': (context) => HalfYearlyMarksScreen(),
//         '/splash': (context) => SplashScreen(),
//         // '/yearly_marks': (context) => YearlyMarksScreen(),

//       },
//     );
//   }
// }
// import 'package:flutter/material.dart';
// // import 'package:life_manager_app/prehome_screen.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'home_screen.dart';
// import 'login_screen.dart';
// import 'profile_screen.dart';
// import 'settings_screen.dart';
// import 'upload_marks_screen.dart';
// import 'marks_display_screen.dart';
// import 'weekly_marks_screen.dart';
// import 'monthly_marks_screen.dart';
// import 'half_yearly_marks_screen.dart';
// import 'splash_screen.dart';
// // import 'yearly_marks_screen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Supabase.initialize(
//     url: 'https://iowuqwgrqqsvuvincdxv.supabase.co',
//     anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imlvd3Vxd2dycXFzdnV2aW5jZHh2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzMxNTEwNjYsImV4cCI6MjA0ODcyNzA2Nn0.hNIo5mvCueatjK_Agbiv197w0qr46VjMOqZOTDP6ZJc',
//   );
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool _isDarkMode = false;

//   ThemeData _lightTheme = ThemeData(
//     brightness: Brightness.light,
//     primarySwatch: Colors.blue,
//     scaffoldBackgroundColor: Colors.white,
//     appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
//   );

//   ThemeData _darkTheme = ThemeData(
//     brightness: Brightness.dark,
//     primarySwatch: Colors.blueGrey,
//     scaffoldBackgroundColor: Colors.black,
//     appBarTheme: AppBarTheme(backgroundColor: Colors.blueGrey),
//   );

//   void _toggleTheme() {
//     setState(() {
//       _isDarkMode = !_isDarkMode;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Marks App',
//       theme: _isDarkMode ? _darkTheme : _lightTheme,
//       initialRoute: '/login',
//       routes: {
//         '/home': (context) => HomeScreen(),
//         '/login': (context) => LoginScreen(),
//         '/profile': (context) => ProfileScreen(),
//         '/settings': (context) => SettingsScreen(),
//         '/upload_marks': (context) => UploadMarksScreen(),
//         '/weekly_marks': (context) => WeeklyMarksScreen(),
//         '/monthly_marks': (context) => MonthlyMarksScreen(),
//         '/half_yearly_marks': (context) => HalfYearlyMarksScreen(),
//         '/splash': (context) => SplashScreen(),
//         // '/yearly_marks': (context) => YearlyMarksScreen(),
//       },
//     );
//   }
// }
// import 'package:flutter/material.dart';
// // import 'package:life_manager_app/prehome_screen.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'home_screen.dart';
// import 'login_screen.dart';
// import 'profile_screen.dart';
// import 'settings_screen.dart';
// import 'upload_marks_screen.dart';
// import 'marks_display_screen.dart';
// import 'weekly_marks_screen.dart';
// import 'monthly_marks_screen.dart';
// import 'half_yearly_marks_screen.dart';
// import 'splash_screen.dart';
// // import 'yearly_marks_screen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Supabase.initialize(
//     url: 'https://iowuqwgrqqsvuvincdxv.supabase.co',
//     anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imlvd3Vxd2dycXFzdnV2aW5jZHh2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzMxNTEwNjYsImV4cCI6MjA0ODcyNzA2Nn0.hNIo5mvCueatjK_Agbiv197w0qr46VjMOqZOTDP6ZJc',
//   );
//   runApp(MyApp());
// }


// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool _isDarkMode = false;
//   late SupabaseClient supabase;
//   bool _isLoggedIn = false;
//   bool _isLoading = true;
// @override
// void initState() {
//     super.initState();
//     supabase = Supabase.instance.client;
//     listenToAuthChanges();
//   }
//     void listenToAuthChanges() {
//     supabase.auth.onAuthStateChange.listen((event) {
//       setState(() {
//         _isLoggedIn = event.session != null; // Check if a user is logged in
//         _isLoading = false; // Stop the loading spinner
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Avyakta Murli Weekly Exam',
//       theme: _isDarkMode
//           ? ThemeData(brightness: Brightness.dark)
//           : ThemeData(brightness: Brightness.light),
//       home: StreamBuilder(
//         stream: Supabase.instance.client.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasData) {
//             return HomeScreen();
//           }
//           return LoginScreen();
//         },
//       ),
//       routes: {
//         '/login': (context) => LoginScreen(),
//         '/home': (context) => HomeScreen(),
//         '/profile': (context) => ProfileScreen(),
//         '/settings': (context) => SettingsScreen(),
//         '/upload_marks': (context) => UploadMarksScreen(),
//         '/weekly_marks': (context) => WeeklyMarksScreen(),
//         '/monthly_marks': (context) => MonthlyMarksScreen(),
//         '/half_yearly_marks': (context) => HalfYearlyMarksScreen(),
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:async'; // For StreamController

import 'login_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';
import 'upload_marks_screen.dart';
import 'weekly_marks_screen.dart';
import 'monthly_marks_screen.dart';
import 'half_yearly_marks_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    // url: 'https://your-supabase-url.supabase.co', // Replace with your Supabase URL
    // anonKey: 'your-supabase-anon-key', // Replace with your Supabase Anon key
    url: 'https://iowuqwgrqqsvuvincdxv.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imlvd3Vxd2dycXFzdnV2aW5jZHh2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzMxNTEwNjYsImV4cCI6MjA0ODcyNzA2Nn0.hNIo5mvCueatjK_Agbiv197w0qr46VjMOqZOTDP6ZJc',

  );

  runApp(MyApp());
}
final StreamController<Session?> _authStreamController = StreamController<Session?>.broadcast();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final StreamController<Session?> _authStreamController =
      StreamController<Session?>.broadcast();
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    listenToAuthChanges();
  }

  @override
  void dispose() {
    _authStreamController.close();
    super.dispose();
  }

  void listenToAuthChanges() {
    Supabase.instance.client.auth.onAuthStateChange.listen((event) {
      _authStreamController.add(event.session); // Send session info to the stream
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avyakta Murli Weekly Exam',
      theme: _isDarkMode
          ? ThemeData(brightness: Brightness.dark)
          : ThemeData(brightness: Brightness.light),
      home: StreamBuilder<Session?>(
        stream: _authStreamController.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            return HomeScreen();
          }
          return LoginScreen();
        },
      ),
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/profile': (context) => ProfileScreen(),
        '/settings': (context) => SettingsScreen(),
        '/upload_marks': (context) => UploadMarksScreen(),
        '/weekly_marks': (context) => WeeklyMarksScreen(),
        '/monthly_marks': (context) => MonthlyMarksScreen(),
        '/half_yearly_marks': (context) => HalfYearlyMarksScreen(),
      },
    );
  }
}


// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool _isDarkMode = false;

//   ThemeData _lightTheme = ThemeData(
//     brightness: Brightness.light,
//     primarySwatch: Colors.blue,
//     scaffoldBackgroundColor: Colors.white,
//     appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
//   );

//   ThemeData _darkTheme = ThemeData(
//     brightness: Brightness.dark,
//     primarySwatch: Colors.blueGrey,
//     scaffoldBackgroundColor: Colors.black,
//     appBarTheme: AppBarTheme(backgroundColor: Colors.blueGrey),
//   );

//   void _toggleTheme() {
//     setState(() {
//       _isDarkMode = !_isDarkMode;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Marks App',
//       theme: _isDarkMode ? _darkTheme : _lightTheme,
//       initialRoute: '/login',
//       routes: {
//         '/home': (context) => HomeScreen(),
//         '/login': (context) => LoginScreen(),
//         '/profile': (context) => ProfileScreen(),
//         '/settings': (context) => SettingsScreen(),
//         '/upload_marks': (context) => UploadMarksScreen(),
//         '/weekly_marks': (context) => WeeklyMarksScreen(),
//         '/monthly_marks': (context) => MonthlyMarksScreen(),
//         '/half_yearly_marks': (context) => HalfYearlyMarksScreen(),
//         '/splash': (context) => SplashScreen(),
//         // '/yearly_marks': (context) => YearlyMarksScreen(),
//       },
//     );
//   }
// }
