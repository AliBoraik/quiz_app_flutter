import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/constants.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/provider/quiz_provider.dart';
import 'package:quiz/screens/quiz/components/option_item.dart';

class OptionList extends StatelessWidget {
  final Question question;
  const OptionList({
    super.key,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    QuizProvider quizProvider = Provider.of<QuizProvider>(context);
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          // padding: const EdgeInsets.all(kDefaultPadding),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              ListView.builder(
                itemCount: question.options.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) => OptionItem(
                  index: index,
                  text: question.options[index].optionName,
                  press: () {
                    quizProvider.checkAns(question, index, context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
