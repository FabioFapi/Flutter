import 'package:flutter/material.dart';

class Question {
  final String text;
  final String imageUrl;
  final List<String> anwers;
  final String title;
  final String rightAnswer;

  Question({
    required this.title,
    required this.text,
    required this.anwers,
    required this.imageUrl,
    required this.rightAnswer
  }
      );
}
