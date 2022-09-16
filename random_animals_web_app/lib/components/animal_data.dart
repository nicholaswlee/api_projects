/**
 * Defines an AnimalData Object and factory functions for easy creation
*/
class AnimalData{
   final String name;
   final String latinName;
   final String animalType;
   final String activeTime;
   final String lifespan;
   final String habitat;
   final String diet;
   final String imageUrl;
   final String geoRange;
   AnimalData({
     required this.name,
     required this.latinName,
     required this.animalType,
     required this.activeTime,
     required this.lifespan,
     required this.habitat,
     required this.diet,
     required this.imageUrl,
     required this.geoRange,

   });

   factory AnimalData.fromJson(Map<String, dynamic> json){
     return AnimalData(
       name: json["name"],
       latinName: json["latin_name"],
       animalType: json["animal_type"],
       activeTime: json["active_time"],
       lifespan: json["lifespan"],
       habitat: json["habitat"].toString().toLowerCase(),
       diet: json["diet"].toString().toLowerCase(),
       imageUrl: json["image_link"],
       geoRange: json["geo_range"],

     );

   }

   factory AnimalData.fromMap(Map<String, dynamic> map){
     return AnimalData(
       name: map["name"],
       latinName: map["latin_name"],
       animalType: map["animal_type"],
       activeTime: map["active_time"],
       lifespan: map["lifespan"],
       habitat: map["habitat"].toString().toLowerCase(),
       diet: map["diet"].toString().toLowerCase(),
       imageUrl: map["image_link"],
       geoRange: map["geo_range"],
     );
   }
   factory AnimalData.blankAnimal(){
     return AnimalData(
       name: "",
      latinName: "",
       animalType: "",
       activeTime: "",
       lifespan: "",
       habitat: "",
       diet: "",
       imageUrl: "",
       geoRange: "",
     );
   }

 }