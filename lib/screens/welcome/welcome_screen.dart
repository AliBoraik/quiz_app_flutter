import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/provider/quiz_provider.dart';
import 'package:quiz/screens/quiz/quiz_screen.dart';
import '../../constants.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  static const routeName = "/welocome";

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _nameController = TextEditingController();
  bool _validate = false;
  late QuizProvider _quiz;

  void startQuiz() {
    final enterdName = _nameController.text;
    setState(() {
      enterdName.isEmpty ? _validate = true : _validate = false;
    });
    if (!_validate) {
      _quiz.setUserNameAndStartQuiz(enterdName);
      Navigator.of(context).pushNamed(Quiz.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    _quiz = Provider.of<QuizProvider>(context);
    if (_quiz.userName.isNotEmpty && !_validate) {
      _nameController.text = _quiz.userName;
    }

    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(
                  flex: 2,
                ),
                Text(
                  kWelcomeTitleText,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Text(kWelcomeTitleDescriptionText),
                const Spacer(),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black,
                    errorText: _validate ? kWelcomeErrorTextField : null,
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                    hintText: kWelcomeHintTextField,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: startQuiz,
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(kDefaultPadding * 0.75),
                    decoration: BoxDecoration(
                      gradient: kPrimaryGradient,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      kWelcomeButtonText,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
