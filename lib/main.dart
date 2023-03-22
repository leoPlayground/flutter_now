import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _timeString = '';
  String _dayString = '';

  @override
  void initState(){
    _timeString = _formatDateTime(DateTime.now());
    _dayString = _formatDateDay(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  void _getTime() {
    final String formattedDateTime = _formatDateTime(DateTime.now().toUtc().add(Duration(hours: 9)));
    final String formattedDayTime = _formatDateDay(DateTime.now().toUtc().add(Duration(hours: 9)));
    setState(() {
      _timeString = formattedDateTime;
      _dayString = formattedDayTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm:ss').format(dateTime);
  }

  String _formatDateDay(DateTime dateTime) {
    return DateFormat('yyy년 MM월 d일').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('한국의 현재 알려주는 앱'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '오늘 날짜',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                _dayString,
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                '현재시간',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                _timeString,
                style: TextStyle(fontSize: 50),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
