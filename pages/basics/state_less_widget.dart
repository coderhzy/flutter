import 'package:flutter/material.dart';

/// StatelessWidget
class Echo extends StatelessWidget {
  const Echo({
    Key key,
    @required this.text,
    this.backgroundColor: Colors.green,
  }) :super(key: key);


  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context){
    return Center(
      child: Container(
        color: Colors.blue,
        child: Text(text),
      ),
    );
  }
}
