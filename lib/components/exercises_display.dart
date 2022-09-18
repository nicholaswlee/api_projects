import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'fitness_data.dart';

class ExerciseDisplay extends StatefulWidget{
  final List<Exercise> exercises; 
  final bool isLoading;
  ExerciseDisplay({required this.exercises, required this.isLoading});
  @override
  State<ExerciseDisplay> createState() => _ExerciseDisplayState();
}

class _ExerciseDisplayState extends State<ExerciseDisplay> {

  @override
  Widget build(BuildContext context) {
    if(widget.isLoading == true){
      return Center(
        child: SizedBox(
                height: 10,
                child: LinearProgressIndicator(
                  minHeight: 3
                )
        ),
      );
    }else if(widget.exercises.length == 0){
      return Center(child: Text("Sorry we couldn't find that muscle group"));
    }else if(widget.exercises[0].id == -1){
      return Center(child: Text("Please enter a muscle"));
    }else{
    }
    return Container(
      height: 400,
      child: ListView(
        shrinkWrap: true,
            children: widget.exercises.map((Exercise exercise) {
              return ListTile(
                title: Container(

                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,  // red as border color
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.blue
                    ),
                    child: Column(
                        children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blue[800],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Text(exercise.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                  )
                          )
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black,  // red as border color
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            color: Colors.white
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                /*Container(
                                  padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                                  width: 200,*/
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Html(
                                      data: exercise.description,
                                        onLinkTap: (url, _, __, ___) async {
                                            if (await canLaunchUrl(Uri.parse(url!))) {
                                              await launchUrl(
                                                Uri.parse(url),
                                              );
                                            } 
                                          },
                                    )
                                  ]
                                )
                                )
                                ,
                                Expanded(
                                  flex: 1,
                                  child:ExerciseImage(exercise.imageUrls)
                                )
                              ],
                          )
                        )
                      ]
                    
                    )
                )


              );
            }).toList(),
          ),
    );
      
  }
}

class ExerciseImage extends StatelessWidget{
  final List<String> imgUrls;
  const ExerciseImage(this.imgUrls, {Key? key}) : super(key: key);


  List<Widget> makeImages(urls){
    List<Widget> images = [];
    for(var i = 0; i < urls.length; i++){
      Widget img =  Image.network(
                urls[i], 
                height: 100, 
                width: 100,
                fit: BoxFit.contain
              );
        images.add(img);
    }
    return images;
  }
  @override
  Widget build(BuildContext context) {
    if(imgUrls.length == 0){
      return const Center(child: Text("No image"));
    }else{
      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: makeImages(imgUrls)
        ),
      );
    }
  }}