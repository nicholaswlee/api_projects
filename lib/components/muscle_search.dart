import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:random_animals_web_app/components/exercises_display.dart';
import 'package:random_animals_web_app/components/text_displays.dart';
import 'button.dart';
import 'fitness_data.dart';

class MuscleSearchPage extends StatefulWidget{

  @override
  State<MuscleSearchPage> createState() => _MuscleSearchPageState();
}

class _MuscleSearchPageState extends State<MuscleSearchPage> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_MuscleFormState');
  final _controller = TextEditingController();
  bool loading = false;
  String exerciseName = "";
  List<Exercise> exercises = [Exercise.empty()];
  @override
  Future<List<Exercise>> getExercise(String muscleName) async {
    setState(() {
      loading = true;
    });
    int id = await getMuscleID(muscleName);
    if(id == -1){
      setState(() {
      loading = false;
    });
      return [];
    }
    var response = await http.get(
      Uri.parse("https://wger.de/api/v2/exercise/?language=2&muscles=${id}"),
    );
    if(response.statusCode == 200){
    }
    final data = json.decode(response.body) as Map<String, dynamic>;
    List<Exercise> exercises = [];
    int length = data["results"].length;
    if(length > 10){
      length = 10;
    }
    for(var i =0; i < length; i++){
      var ex = Exercise.fromMap(data["results"][i]);
      print(ex.exerciseBase);
      if(ex.description == "" && length < data["count"] - 1){
        length++;
        continue;
      }
      var urls = await getImageUrls(ex.exerciseBase);
      
      ex.setImageurl(urls);
      exercises.add(ex);
    }
    setState(() {
      loading = false;
    });
    return exercises;
  }
  Widget build(BuildContext context) {
      return Container(
        
        decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.all(Radius.circular(20)
                            ),
          ),
          constraints: BoxConstraints(
                minHeight: 300, minWidth: 500),
          width: double.infinity,
          padding: EdgeInsets.all(20),
          margin:EdgeInsets.all(30) ,
        child: Column(
          children: [
            TitleHeading(title: "What muscle group would you like to work on?", color: Colors.white),
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: TextFormField(
                          controller: _controller,
                          decoration: const InputDecoration(
                            hintText: 'Enter a muscle group you would like to work on i.e. Biceps, Triceps, Abs',
                          ),
                          validator: (value) {
                            if (value!.isEmpty || value == "" || value == " ") {
                              return 'Please enter a muscle you would like to research';
                            }
                            return null;
                          },
                      ),
                    ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 30),
                            child: StyledButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  var exercisesList = await getExercise(_controller.text);
                                  setState(() {
                                    exercises = exercisesList;
                                  });
                                }
                              },
                              child: const Text(
                                'Search',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              
                              ),
                            ),

                          ),
                        ),
                        
                      ],
                    ),
                    Container(
                          /*width: double.infinity,*/
                          child: ExerciseDisplay(exercises: exercises, isLoading: loading),
                        )
                  ],
                ),
              ),
            ),
          
          ],
        ),
      );
  }
}

Future<int> getMuscleID(String muscleName) async {
  muscleName = processMuscleName(muscleName);
  var response = await http.get(
    Uri.parse("https://wger.de/api/v2/muscle/?language=2&name_en=$muscleName"),
  );
  int id = -1;
  if(response.statusCode == 200){
  }
  var data = json.decode(response.body) as Map<String, dynamic>;
  if(data["count"] == 0){
    response = await http.get(
      Uri.parse("https://wger.de/api/v2/muscle/?language=2&name=$muscleName"),
    );
    if(response.statusCode == 200){
    }
    data = json.decode(response.body) as Map<String, dynamic>;
    if(data["count"] == 0){
      print("Here");
      return id;
    }else{
      id = id = data["results"][0]["id"];
    }
    
  }else{
    id = data["results"][0]["id"];
  }
  
  return id;
}

Future<List<String>> getImageUrls(int exercise_base) async {
  List<String> urls = [];
  var response = await http.get(
    Uri.parse("https://wger.de/api/v2/exerciseimage/?exercise_base=${exercise_base}"),
  );
  if(response.statusCode == 200){
  }
  final data = json.decode(response.body) as Map<String, dynamic>;
  for(var i = 0; i < data["results"].length; i++){
    urls.add(data["results"][i]["image"]);
  }
  return urls;
}


extension StringExtension on String {
    String capitalize() {
      return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
    }
}
String makePlural(String word){
  int length = word.length;
  if(word[length-1] != 's'){
    word = "${word}s";
  }
  return word;
}
String processMuscleName(String muscle){
  muscle = muscle.capitalize();
  muscle = makePlural(muscle);

  switch(muscle){
    case "Traps":
      return "Trapezius";
    case "Trap":
      return "Trapezius";
    case "Core":
      return "Abs";
    case "Delts":
      return "Shoulders";
    case "Obliques":
      return "Obliquus externus abdominis";
    case "Oblique":
      return "Obliquus externus abdominis";
  }
  return muscle;
}