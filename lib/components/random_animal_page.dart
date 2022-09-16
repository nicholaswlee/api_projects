
import 'dart:convert';

import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'animal_data.dart';
import 'animal_display.dart';
import 'button.dart';
import 'text_displays.dart';
class RandomAnimalPage extends StatefulWidget {
  const RandomAnimalPage({Key? key}) : super(key: key);


  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  State<RandomAnimalPage> createState() => _RandomAnimalPageState();
}

class _RandomAnimalPageState extends State<RandomAnimalPage> {
  @override
  AnimalData animal = AnimalData.blankAnimal();
  /**
   * Retrieves a random animal data.
   */
  Future<AnimalData> getData() async {
     var response = await http.get(
       Uri.parse("https://zoo-animal-api.herokuapp.com/animals/rand"),
     );
     if(response.statusCode == 200){
     }
     final data = json.decode(response.body) as Map<String, dynamic>;
     AnimalData animal = AnimalData.fromMap(data);
     return animal;
   }
   Widget build(BuildContext context) {
    return(
      Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.all(Radius.circular(20)
                          ),
        ),
        width: double.infinity,
        padding: EdgeInsets.all(20),
        margin:EdgeInsets.all(30) ,
        child: Column(
          children: [
            TitleHeading(title: "Find Me a Zoo Animal!", color: Colors.white),
            Expanded(
              child: Column(
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
              ),
            ),
          ],
        ),
      )
    );
  }
}

