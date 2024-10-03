import 'package:flutter/material.dart';
import 'colors.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  String? selectedAnswer;
  final answers = ["Big Hero 6", "Shrek", "Wall-E", "Gabibbo"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: quizBackgroundColor,
        body: Column(
          children: [
            Image.network(
                "https://upload.wikimedia.org/wikipedia/it/7/77/Shrek_%28film%29.png"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Column(
                children: [
                  const Text(
                    "What is the name of the Movies?",
                    style: TextStyle(
                        color: questionTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      "PLease choose one of the options "
                          "below and confirm your answer by clicking "
                          "the Confirm button",
                      style: TextStyle(
                          color: hintTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  ...answers.map((answer) => AnswerButton(
                    answer,
                    onPressed: () {
                      setState(() {
                        selectedAnswer = answer;
                      });
                    },
                    isSelected: selectedAnswer == answer,
                  )),
                ],
              ),
            ),
            const Spacer(flex: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                        backgroundColor:
                        WidgetStatePropertyAll(questionTextColor)),
                    child: const Text(
                      "Confirm",
                      style: TextStyle(
                          color: confirmButton,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ],
        ));
  }
}

class AnswerButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function() onPressed;

  const AnswerButton(this.text,
      {required this.onPressed, this.isSelected = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        child: Container(
            width: double.infinity,
            height: 44,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: buttonColor,
                border: Border.all(
                    color: isSelected
                        ? answerButtonCheckColor
                        : Colors.transparent,
                    width: 2)),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(text,
                      style:
                      const TextStyle(color: Colors.white, fontSize: 14)),
                  Opacity(
                      opacity: isSelected ? 1.0 : 0.2,
                      child: const Icon(Icons.check,
                          color: answerButtonCheckColor)),
                ],
              ),
            )),
      ),
    );
  }
}