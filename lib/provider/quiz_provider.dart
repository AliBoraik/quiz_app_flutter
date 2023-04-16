import 'package:flutter/material.dart';
import 'package:quiz/models/option.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/screens/welcome/welcome_screen.dart';

import '../screens/score/score_screen.dart';

class QuizProvider with ChangeNotifier {
  late int _questionNumber;
  late bool _isAnswered = false;
  late int _correctAns;
  late int _selectedAns;
  late String _userName = "";
  late int _numOfCorrectAns;
  final PageController _pageController = PageController(initialPage: 0);

  // gets
  bool get isAnswered => _isAnswered;
  int get correctAns => _correctAns;
  int get selectedAns => _selectedAns;
  int get questionNumber => _questionNumber;
  int get numOfCorrectAns => _numOfCorrectAns;
  PageController get pageController => _pageController;

  String get userName {
    return _userName;
  }

  List<Question> get data {
    return sampleData
        .map(
          (e) => Question(
              id: e["id"],
              answer: e["answer_index"],
              question: e["question"],
              options: (e["options"] as List<String>)
                  .map((e) => Option(e))
                  .toList()),
        )
        .toList();
  }

  // funtions
  void checkAns(Question question, int selectedIndex, BuildContext context) {
    if (!_isAnswered) {
      _isAnswered = true;
      _correctAns = question.answer;
      _selectedAns = selectedIndex;
      if (_correctAns == _selectedAns) _numOfCorrectAns++;
      notifyListeners();
      Future.delayed(const Duration(seconds: 2), () {
        _nextQuestionPage(context);
      });
    }
  }

  void setUserNameAndStartQuiz(String name) {
    if (userName != name) {
      _userName = name;
    }
    _questionNumber = 1;
    _numOfCorrectAns = 0;
    notifyListeners();
  }

  void _nextQuestionPage(BuildContext context) {
    _isAnswered = false;
    if (_hasQuestions()) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      Navigator.pushNamed(context, ScoreScreen.routeName);
    }
    notifyListeners();
  }

  void setIsAnswered(bool newIsAnsweaed) {
    _isAnswered = newIsAnsweaed;
    notifyListeners();
  }

  void updateTheQnNum(int index) {
    _questionNumber = index + 1;
    notifyListeners();
  }

  bool _hasQuestions() {
    return questionNumber != data.length;
  }
}

final List sampleData = [
  {
    "id": 1,
    "question":
        "Flutter is an open-source UI software development kit created by ______ ?",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "When google release Flutter ?",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "A memory location that holds a single letter or number ?",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "What command do you use to output data to the screen ?",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": 2,
  },
];
