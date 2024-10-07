import 'package:flutter/material.dart';
import 'package:my_app_flutter/Data/question.dart';

class QuestionRepository {

  List<Question> getQuestions() {
    return [
      Question(title: "What is the name of the Movie?",
          text: "Please choose one of the options "
          "below and confirm your answer by clicking "
          "the Confirm button",
          anwers: ["Big Hero 6", "Shrek", "Wall-E", "Gabibbo"],
          imageUrl: "https://upload.wikimedia.org/wikipedia/it/7/77/Shrek_%28film%29.png",
          rightAnswer: "Shrek"),
      Question(
          title: "Who is this villain?",
          text: "Please choose one of the options "
              "below and confirm your answer by clicking "
              "the Confirm button",
          imageUrl: "https://i.redd.it/7lcqa2ctykl31.png",
          anwers: ["Pinocchio", "Zenzy", "Ciuchino", "LordFarquaad"],
          rightAnswer: "LordFarquaad"
      ),
    ];
  }

}