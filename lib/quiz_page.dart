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
                  child: const Text("CONFERMACAZZO")
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

  const AnswerButton(this.text,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: FilledButton(onPressed: () {},
        child: Text(text),
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(buttonColor)
        ),
      ),
    ) ;
  }
}
