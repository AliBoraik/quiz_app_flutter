import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/constants.dart';
import 'package:quiz/models/quiz_provider.dart';
import 'package:quiz/screens/welcome/welcome_screen.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});
  static const routeName = "/score";

  @override
  Widget build(BuildContext context) {
    QuizProvider quizProvider = Provider.of<QuizProvider>(context);
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              const Spacer(flex: 3),
              Text(
                quizProvider.userName.toUpperCase(),
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                "Score",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                "${quizProvider.numOfCorrectAns}/${quizProvider.data.length}",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Spacer(flex: 1),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      WelcomeScreen.routeName, (Route<dynamic> route) => false);
                },
                child: Container(
                  width: 200,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(kDefaultPadding * 0.75),
                  decoration: BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "Start Quiz Again",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
              const Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
