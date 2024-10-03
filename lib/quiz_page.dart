import 'package:flutter/material.dart';
import 'package:my_app_flutter/colors.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: quizBackgroundColor,
      body: Column(
        children: [
          SizedBox(height: 50,),
          Image.network("https://upload.wikimedia.org/wikipedia/it/7/77/Shrek_%28film%29.png"),
          const Text("What is the name of the Movies?",
            style: TextStyle(
                color: questionTextColor,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
          const Text("PLease choose one of the options "
              "below and confirm your answer by clicking "
              "the Confirm button",
            style: TextStyle(
                color: hintTextColor,
                fontSize: 14,
                fontWeight: FontWeight.bold
            ),
          ),
          AnswerButton("Big Hero 6"),
          AnswerButton("Shrek"),
          AnswerButton("Wall-E"),
          AnswerButton("Gabibbo"),
          const Spacer(flex: 1,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FilledButton(onPressed: () {},
                  child: const Text("CONFERMACAZZO",
                      style: TextStyle(
                        color: orange ,
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                      ))
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AnswerButton extends StatelessWidget {

  final String text;

  final bool isSelected;

  const AnswerButton(this.text,{this.isSelected = false ,super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () {
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: double.infinity,
          height: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: buttonColor,
            border: Border.all(
              color: isSelected ? answerButtonCheckColor : Colors.transparent,
              width: 2
            )
            ),
          child: Padding(
            padding: const EdgeInsets.only(right: 8, left: 16),
          child: Row (
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [ Text(text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
            Opacity(
              opacity: isSelected ? 1.0 : 0.2,
              child : const Icon(Icons.check, color: answerButtonCheckColor,),
            ),
          ],
        ),
      ),
    ),
      ),
    );
  }
}