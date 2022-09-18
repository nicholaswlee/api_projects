import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:random_animals_web_app/components/animal_display.dart';
import 'package:random_animals_web_app/components/button.dart';
import 'package:http/http.dart' as http;
import 'package:random_animals_web_app/components/text_displays.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/animal_data.dart';
import 'components/navigation_menu.dart';

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nicholas\s API Projects!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.oswaldTextTheme()
      ),
      home: const HomePage(title: 'Find Me A Zoo Animal!'),
    );
  }
}
/**
 * Defines the home page for the website
 */
class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NavigationBarSide(),
            /*Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return AnimalDisplay(
                            animal: animal
                          );
                  }
                ),
                StyledButton(
                  child: Heading(title: "Find me a zoo animal!", color: Colors.white), 
                  onPressed: () async {
                    AnimalData randAnimal = await getData();
                    setState(() {
                      animal = randAnimal;
                    });
                  }
                
                )
              ],
            )*/
    );
  }
}
