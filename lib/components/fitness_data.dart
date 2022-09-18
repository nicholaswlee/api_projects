import 'dart:convert';

import 'package:http/http.dart' as http;

String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(
      r"<[^>]*>",
      multiLine: true,
      caseSensitive: true
    );

    return htmlText.replaceAll(exp, '');
}

Future<String> getExerciseImage(String id) async{
  var response = await http.get(
    Uri.parse("https://wger.de/api/v2/exercise/?language=2&muscles=${id}"),
  );
  if(response.statusCode == 200){
  }
  final data = json.decode(response.body) as Map<String, dynamic>;
  final detail = data["detail"];
  if(detail == "Not found."){
    return "";
  }else{
    return data["image"];
  }
}
/**
 * Defines an Muscle Object and factory functions for easy creation
*/
String idNameEN(Map<String, dynamic> map){
  String name = map["name_en"];
  if(map["name_en"] == ""){
    name = map["name"];
  }
  return name;
}
class MuscleData{
   final String name;
   final String nameEN;
   final int id;
   MuscleData({
     required this.name,
      required this.nameEN,
      required this.id,
   });
   factory MuscleData.fromJson(Map<String, dynamic> json){
    return MuscleData(
      name: json["name"],
      nameEN: idNameEN(json),
      id: json["id"],
     );

   }

   factory MuscleData.fromMap(Map<String, dynamic> map){
     return MuscleData(
      name: map["name"],
      nameEN: idNameEN(map),
      id: map["id"],
     );
   }
 }

 class Exercise{
   final String name;
   final String description;
   final int id;
   final int exerciseBase;
   List<String> imageUrls = [];
   Exercise({
     required this.name,
      required this.description,
      required this.id,
      required this.exerciseBase
   });

   factory Exercise.fromJson(Map<String, dynamic> json){
    return Exercise(
      name: json["name"],
      description: removeAllHtmlTags(json["description"]),
      id: json["id"],
      exerciseBase: json["exercise_base"],
     );

   }

   factory Exercise.fromMap(Map<String, dynamic> map){
     return Exercise(
      name: map["name"],
      description: removeAllHtmlTags(map["description"]),
      id: map["id"],
      exerciseBase: map["exercise_base"],
     );
   }
   factory Exercise.empty(){
     return Exercise(
      name: "",
      description: "",
      id: -1,
      exerciseBase: -1,
     );
   }

  void setImageurl(List<String> urls){
      imageUrls = urls;
   }
 }

