import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Heading extends StatelessWidget{
  final String title;
  final Color color;
  Heading({required this.title, this.color = Colors.black});
  @override
  Widget build(BuildContext context) {
    return(
      Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: (
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: color,
          )
        )
      ),
      )
    );

  }
}

class TitleHeading extends StatelessWidget{
  final String title;
  final Color color;
  TitleHeading({required this.title, this.color = Colors.black});
  @override
  Widget build(BuildContext context) {
    return(
      Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: (
        Text(

          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 36,
            color: color,
          ),
          textAlign: TextAlign.start
        )
      ),
      )
    );

  }
}

class SubHeading extends StatelessWidget{
  final String title;
  const SubHeading({required this.title});
  @override
  Widget build(BuildContext context) {
    return (Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
      child: (
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontStyle: FontStyle.italic,
            color: Colors.grey,
          )
        )
      ),
    )
    );
  }
}

class Body extends StatelessWidget{
  final String text;
  const Body({required this.text});
  @override
  Widget build(BuildContext context) {
    return( Padding(
      padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
      child: (
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
            
          )
        )
      ),
    )
    );
  }
}