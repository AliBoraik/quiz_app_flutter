import 'package:flutter/material.dart';
import 'package:quiz/constants.dart';

class QuestionCount extends StatelessWidget {
  final int currentIndex;
  final int length;
  const QuestionCount({
    super.key,
    required this.currentIndex,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Text.rich(
                TextSpan(
                  text: "Question $currentIndex",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: kSecondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                  children: [
                    TextSpan(
                      text: " / $length",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        const Divider(
          height: 20,
          thickness: 1,
          indent: kDefaultPadding,
          endIndent: kDefaultPadding,
          color: Colors.black,
        ),
      ],
    );
  }
}
