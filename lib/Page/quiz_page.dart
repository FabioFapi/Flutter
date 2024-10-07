import 'package:flutter/material.dart';
import 'package:my_app_flutter/Components/buttonComponent.dart';
import '../theme/colors.dart';
import 'package:my_app_flutter/Data/questionRepository.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var questionIndex = 0 ;
  final questions = QuestionRepository().getQuestions();
  String? selectedAnswer;
  bool isConfirmed = false;

  @override
  Widget build(BuildContext context) {
    var question = questions[questionIndex];
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            Image.network(question.imageUrl),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Column(
                children: [
                  Text(
                    question.title,
                    style: const TextStyle(color: questionTextColor, fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    question.text,
                    style: const TextStyle(color: hintTextColor, fontSize: 12),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ...question.anwers.map(
                        (answer) {
                      var buttonState = ButtonState.unselected;
                      if (answer == selectedAnswer) {
                        buttonState = ButtonState.selected;
                      }
                      if (isConfirmed && answer == question.rightAnswer) {
                        buttonState = ButtonState.right;
                      }
                      if (isConfirmed && answer == selectedAnswer) {
                        buttonState = ButtonState.wrong;
                      }

                      return AnswerButton(
                        answer,
                        onPressed: isConfirmed ? null : () {
                          setState(() {
                            selectedAnswer = answer;
                          });
                        },
                        buttonState: buttonState,
                      );
                    },
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FilledButton(
                    onPressed: selectedAnswer == null
                        ? null
                        : () {
                      setState(() {
                        isConfirmed = true;
                        if(questionIndex < questions.length -1){
                          selectedAnswer = null;
                          isConfirmed = false;
                          questionIndex++;
                        }
                      });
                    },
                    style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(confirmButtonColor)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        "Confirm",
                        style: TextStyle(color: confirmButtonTextColor, fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}