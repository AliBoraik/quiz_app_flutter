import 'package:flutter/material.dart';

const kSecondaryColor = Color(0xFF1A2330);
const kGreenColor = Color(0xFF44AF29);
const kRedColor = Color(0xFFE92E30);
const kGrayColor = Color(0xFFC1C1C1);
const kBlackColor = Color(0xFF101010);
const kDividerColor = Color.fromARGB(255, 69, 69, 69);
const kPrimaryGradient = LinearGradient(
  colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

const double kDefaultPadding = 20.0;

///
///     ##### string constants ######
///

// main page
const kQuizAppTitle = "Quiz App";
// welcome page
const kWelcomeTitleText = "Let's Play Quiz,";
const kWelcomeTitleDescriptionText = "Enter your information below";
const kWelcomeHintTextField = "Full Name";
const kWelcomeErrorTextField = "Name Can't be empty!";
const kWelcomeButtonText = "Let's Start Quiz";
// quiz page
const kQuestionStimulationText = "Answer and get points";
// score page
const kScoreStartAgainText = "Start Quiz Again";
