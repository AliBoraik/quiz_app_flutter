import 'option.dart';

class Question {
  final int id, answer;
  final String question;
  final List<Option> options;
  Question({
    required this.id,
    required this.answer,
    required this.question,
    required this.options,
  });
}
