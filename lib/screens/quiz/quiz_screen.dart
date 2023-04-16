import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/provider/quiz_provider.dart';
import 'package:quiz/screens/quiz/components/option_list.dart';
import 'package:quiz/screens/quiz/components/question_card.dart';

import 'components/question_count.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});
  static const routeName = "/quiz";

  @override
  Widget build(BuildContext context) {
    QuizProvider quiz = Provider.of<QuizProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: PageView.builder(
          controller: quiz.pageController,
          itemCount: quiz.data.length,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: quiz.updateTheQnNum,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                QuestionCard(
                  questionText: quiz.data[index].question,
                ),
                QuestionCount(
                  currentIndex: index + 1,
                  length: quiz.data.length,
                ),
                OptionList(
                  question: quiz.data[index],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
