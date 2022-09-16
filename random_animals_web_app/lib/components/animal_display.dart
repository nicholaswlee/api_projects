import 'package:flutter/material.dart';
import 'package:random_animals_web_app/components/animal_data.dart';

import 'text_displays.dart';

/**
 * Defines the animal display which displays info about the animal 
 * given the animal.
*/
class AnimalDisplay extends StatefulWidget {
  const AnimalDisplay({Key? key, required this.animal}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final AnimalData animal;

  @override
  State<AnimalDisplay> createState() => _AnimalDisplayState();
}

class _AnimalDisplayState extends State<AnimalDisplay> {
  @override
  Widget build(BuildContext context) {
    switch(widget.animal.name){
      case "":
        return(
          Heading(title: "Press the button for an animal!", color: Colors.white)
        );
      default:
        return(
          Column(
            children: <Widget>[
                Heading(title: "The ${widget.animal.name}"),
                SubHeading(title: widget.animal.latinName),
                Image.network(widget.animal.imageUrl, 
                  height: 200, 
                  fit: BoxFit.contain
                ),
                SizedBox(
                  width: 300,
                  child: Body(
                          text: '''The ${widget.animal.name} has a lifespan of ${widget.animal.lifespan} years. They are ${widget.animal.activeTime}. They primarily eat ${widget.animal.diet}. They live in the ${widget.animal.habitat}.'''
                  )
                )
            ],
          )
        );
          

    }
    
  }
}