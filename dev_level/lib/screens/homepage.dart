import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int questionNo = 1;
  int selectedValue = -1;
  String textValue = '';
  String radio1 = '';
  String radio2 = '';
  String radio3 = '';
  String radio4 = '';
  List<int> marks = List.filled(16, 0);

  @override
  void initState() {
    textvalue(questionNo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dev Level',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text('Marks ${totalMarks()}'),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: SizedBox(
              height: 72,
              child: Text(
                textValue,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
                softWrap: true,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 72,
                      child: RadioListTile(
                        value: 1,
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(
                            () {
                              selectedValue = value!;
                              marks[questionNo] = selectedValue;
                            },
                          );
                        },
                        title: Text(radio1),
                      ),
                    ),
                    SizedBox(
                      height: 72,
                      child: RadioListTile(
                        value: 2,
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(
                            () {
                              selectedValue = value!;

                              marks[questionNo] = selectedValue;
                            },
                          );
                        },
                        title: Text(radio2),
                      ),
                    ),
                    SizedBox(
                      height: 72,
                      child: RadioListTile(
                        value: 3,
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(
                            () {
                              selectedValue = value!;

                              marks[questionNo] = selectedValue;
                            },
                          );
                        },
                        title: Text(radio3),
                      ),
                    ),
                    SizedBox(
                      height: 72,
                      child: RadioListTile(
                        value: 4,
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(
                            () {
                              selectedValue = value!;

                              marks[questionNo] = selectedValue;
                            },
                          );
                        },
                        title: Text(radio4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: const SizedBox(
              height: 10,
            ),
          ),
          Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (questionNo > 1 && questionNo <= 15) {
                          questionNo--;
                        }

                        textvalue(questionNo);
                        selectedValue = -1;
                      });
                    },
                    child: Text(
                      '<',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Visibility(
                    visible: questionNo <= 14,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (questionNo >= 1 && questionNo <= 14) {
                            questionNo++;
                          }

                          textvalue(questionNo);
                          selectedValue = -1;
                        });
                      },
                      child: Text(
                        '>',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Visibility(
            visible: (questionNo == 15),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    showResultDialog(totalMarks());
                  });
                },
                child: Text('Done'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  showResultDialog(int totalMarks) {
    String level = '';

    if (totalMarks < 30) {
      level = '👶 Beginner';
    } else if (totalMarks < 60) {
      level = '🧱 Junior Developer';
    } else if (totalMarks < 85) {
      level = '🚀 Mid-Level Developer';
    } else {
      level = '🧠 Senior Developer';
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Column(
            children: [
              Text(level),
              SizedBox(
                height: 10,
              ),
              Text('Total Marks: $totalMarks/150'),
            ],
          ),
        );
      },
    );
  }

  void increment() {
    setState(() {
      questionNo++;
    });
  }

  void decrement() {
    setState(() {
      questionNo--;
    });
  }

  int totalMarks() {
    int total = 0;
    for (int i = 1; i < marks.length; i++) {
      if (marks[i] == 1) {
        total += 0;
      } else if (marks[i] == 2) {
        total += 3;
      } else if (marks[i] == 3) {
        total += 6;
      } else if (marks[i] == 4) {
        total += 10;
      }
    }
    return total;
  }

  void textvalue(int num) {
    switch (num) {
      case 1:
        textValue = 'How many Flutter apps have you built?';
        radio1 = 'None';
        radio2 = '1-2 apps';
        radio3 = '3-5 apps';
        radio4 = '5+ apps';
        break;
      case 2:
        textValue =
            'Have you ever published an app to the Play Store or App Store?';
        radio1 = 'No';
        radio2 = 'Yes, with help';
        radio3 = 'Yes, independently';
        radio4 = 'Multiple apps on both stores';
        break;
      case 3:
        textValue = 'Which state management libraries have you used?';
        radio1 = 'Only setState';
        radio2 = 'Provider or Riverpod';
        radio3 = 'BLoC / GetX';
        radio4 = 'Multiple with architecture pattern';
        break;
      case 4:
        textValue = 'Can you build a UI from Figma or design reference?';
        radio1 = 'Not really';
        radio2 = 'Somewhat';
        radio3 = 'Yes, pixel-perfect';
        radio4 = 'Yes, with responsiveness and animation';
        break;
      case 5:
        textValue = 'How do you store local data in your apps?';
        radio1 = 'I don\'t';
        radio2 = 'SharedPreferences';
        radio3 = 'Hive or SQLite';
        radio4 = 'Repository abstraction with DB';
        break;
      case 6:
        textValue = 'How familiar are you with Firebase?';
        radio1 = 'Never used';
        radio2 = 'Tried in tutorials';
        radio3 = 'Used in real app';
        radio4 = 'Use multiple Firebase services';
        break;
      case 7:
        textValue = 'Have you ever written tests in Flutter?';
        radio1 = 'No';
        radio2 = 'Basic unit tests';
        radio3 = 'Unit & widget tests';
        radio4 = 'Full test coverage including integration tests';
        break;
      case 8:
        textValue = 'Do you use Git and GitHub in your projects?';
        radio1 = 'No';
        radio2 = 'Basic usage (push only)';
        radio3 = 'Use branches, commits, PRs';
        radio4 = 'Collaborated in teams via Git';
        break;
      case 9:
        textValue =
            'Do you understand Flutter architecture patterns (like MVVM, Clean)?';
        radio1 = 'No';
        radio2 = 'Somewhat';
        radio3 = 'Yes, used in projects';
        radio4 = 'Yes, and I apply architecture properly';
        break;
      case 10:
        textValue = 'Can you build a REST API-integrated app from scratch?';
        radio1 = 'No';
        radio2 = 'With tutorial help';
        radio3 = 'Yes, independently';
        radio4 = 'Yes, with error handling and clean structure';
        break;
      case 11:
        textValue = 'What platform experience do you have?';
        radio1 = 'Only Android';
        radio2 = 'Android & iOS';
        radio3 = 'Also built for Web/Desktop';
        radio4 = 'Built for all platforms with responsive UI';
        break;
      case 12:
        textValue = 'Do you use CI/CD or automation tools?';
        radio1 = 'No';
        radio2 = 'Explored a bit';
        radio3 = 'Used GitHub Actions or Codemagic';
        radio4 = 'Use full CI/CD in production';
        break;
      case 13:
        textValue =
            'Have you ever debugged performance (FPS, memory, widget rebuilds)?';
        radio1 = 'Never';
        radio2 = 'Only console logs';
        radio3 = 'Used Flutter DevTools';
        radio4 = 'Analyze and optimize performance actively';
        break;
      case 14:
        textValue =
            'Have you ever contributed to open-source or worked with a team?';
        radio1 = 'No';
        radio2 = 'Team project (informal)';
        radio3 = 'Formal team collaboration';
        radio4 = 'Open-source contributor';
        break;
      case 15:
        textValue = 'Do you follow best practices (SOLID, Clean Code, DRY)?';
        radio1 = 'No';
        radio2 = 'Trying to learn';
        radio3 = 'Followed in real apps';
        radio4 = 'Follow and teach them';
        break;
      default:
        textValue = 'Question not found';
        radio1 = radio2 = radio3 = radio4 = '';
    }
  }
}
