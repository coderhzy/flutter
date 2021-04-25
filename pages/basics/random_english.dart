import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

/// english_words包来生成随机字符串
class Random extends StatefulWidget {
  @override
  _RandomState createState() => _RandomState();
}

class _RandomState extends State<Random> {
  @override
  Widget build(BuildContext context) {
    // 生成随机字符串
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
  }
}
