import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/constants.dart';
import 'package:quiz/provider/quiz_provider.dart';

class OptionItem extends StatelessWidget {
  final String text;
  final int index;
  final VoidCallback press;
  const OptionItem(
      {required this.text,
      required this.index,
      required this.press,
      super.key});

  @override
  Widget build(BuildContext context) {
    QuizProvider quiz = Provider.of<QuizProvider>(context);

    Color getTheRightColor() {
      if (quiz.isAnswered) {
        if (index == quiz.correctAns) {
          return kGreenColor;
        } else if (index == quiz.selectedAns &&
            quiz.selectedAns != quiz.correctAns) {
          return kRedColor;
        }
      }
      return kBlackColor;
    }

    IconData getTheRightIcon() {
      return getTheRightColor() == kRedColor ? Icons.close : Icons.done;
    }

    return InkWell(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.only(top: kDefaultPadding),
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          border: Border.all(color: getTheRightColor()),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${index + 1}. $text",
              style: TextStyle(color: getTheRightColor(), fontSize: 16),
            ),
            Container(
              height: 26,
              width: 26,
              decoration: BoxDecoration(
                color: getTheRightColor() == kGrayColor
                    ? Colors.transparent
                    : getTheRightColor(),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: getTheRightColor()),
              ),
              child: getTheRightColor() == kGrayColor
                  ? null
                  : Icon(getTheRightIcon(), size: 16),
            )
          ],
        ),
      ),
    );
  }
}
