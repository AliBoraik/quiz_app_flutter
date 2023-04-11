import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/constants.dart';
import 'package:quiz/models/question.dart';
import 'package:quiz/models/quiz_provider.dart';
import 'package:quiz/screens/quiz/components/option_item.dart';

class OptionList extends StatelessWidget {
  const OptionList({
    super.key,
    required this.q,
  });

  final Question q;

  @override
  Widget build(BuildContext context) {
    QuizProvider quizProvider = Provider.of<QuizProvider>(context);
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        // padding: const EdgeInsets.all(kDefaultPadding),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) => OptionItem(
                index: index,
                text: q.options[index],
                press: () {
                  quizProvider.checkAns(q, index, context);
                },
              ),
              itemCount: q.options.length,
            ),
          ],
        ),
      ),
    );
  }
}
