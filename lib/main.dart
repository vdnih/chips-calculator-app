import 'package:flutter/material.dart';

void main() {
  runApp(UserPointsApp());
}

class UserPointsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Points App',
      home: UserPointsScreen(),
    );
  }
}

class UserPointsScreen extends StatefulWidget {
  @override
  _UserPointsScreenState createState() => _UserPointsScreenState();
}

class _UserPointsScreenState extends State<UserPointsScreen> {
  List<int> userPoints = [0, 0, 0, 0]; // 初期のポイントはすべて0として設定
  List<String> userNames = [
    'User 1',
    'User 2',
    'User 3',
    'User 4'
  ]; // 初期のユーザー名を設定

  void _addPoints(int userIndex, int pointsToAdd) {
    setState(() {
      userPoints[userIndex] += pointsToAdd;
    });
  }

  void _subtractPoints(int userIndex, int pointsToSubtract) {
    setState(() {
      userPoints[userIndex] -= pointsToSubtract;
    });
  }

  Color _getUserColor(int userIndex) {
    switch (userIndex) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.green;
      case 3:
        return Colors.yellow;
      default:
        return Colors.grey;
    }
  }

  int _calculateTotalPoints() {
    return userPoints.reduce((value, element) => value + element);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Points App'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // 合計ポイント表示
              Text(
                'Total Points: ${_calculateTotalPoints()}',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              // ユーザーエリア
              Row(
                children: List.generate(4, (index) {
                  return Expanded(
                    child: Card(
                      color: _getUserColor(index),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFormField(
                              initialValue: userNames[index],
                              onChanged: (value) {
                                setState(() {
                                  userNames[index] = value;
                                });
                              },
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            // Text(
                            //   'User ${index + 1} Points:',
                            //   style: TextStyle(
                            //       fontSize: 18.0, fontWeight: FontWeight.bold),
                            // ),
                            SizedBox(height: 10.0),
                            Text(
                              '${userPoints[index]}',
                              style: TextStyle(fontSize: 24.0),
                            ),
                            SizedBox(height: 20.0),
                            ElevatedButton(
                              onPressed: () {
                                _addPoints(index, 1000);
                              },
                              child: Text('+1000'),
                            ),
                            SizedBox(height: 10.0),
                            ElevatedButton(
                              onPressed: () {
                                _addPoints(index, 5000);
                              },
                              child: Text('+5000'),
                            ),
                            SizedBox(height: 10.0),
                            ElevatedButton(
                              onPressed: () {
                                _addPoints(index, 10000);
                              },
                              child: Text('+10000'),
                            ),
                            SizedBox(height: 10.0),
                            ElevatedButton(
                              onPressed: () {
                                _subtractPoints(index, 1000);
                              },
                              child: Text('-1000'),
                            ),
                            SizedBox(height: 10.0),
                            ElevatedButton(
                              onPressed: () {
                                _subtractPoints(index, 5000);
                              },
                              child: Text('-5000'),
                            ),
                            SizedBox(height: 10.0),
                            ElevatedButton(
                              onPressed: () {
                                _subtractPoints(index, 10000);
                              },
                              child: Text('-10000'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
