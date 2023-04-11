import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/constants.dart';
import 'package:quiz/models/quiz_provider.dart';
import 'package:quiz/screens/score/score_screen.dart';
import 'package:quiz/screens/quiz/quiz_screen.dart';
import 'package:quiz/screens/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: QuizProvider(),
      child: MaterialApp(
        title: kQuizAppTitle,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const WelcomeScreen(),
        routes: {
          WelcomeScreen.routeName: (context) => const WelcomeScreen(),
          Quiz.routeName: (context) => const Quiz(),
          ScoreScreen.routeName: (context) => const ScoreScreen(),
        },
      ),
    );
  }
}
