import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_animals_web_app/components/text_displays.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget{
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return
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
            TitleHeading(title: 'About Me', color: Colors.white,),
            Expanded(
              child: (
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'images/profile.png',
                      width: 400,
                      fit: BoxFit.contain
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                      width: 400,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Hello, I am Nicholas Lee a second year at the University of Chicago studying Computer Science and Economics.'
                                    ' I built this web app all in Dart within the Flutter Environment. I used this',
                              style: GoogleFonts.oswald()
                            ),
                            TextSpan(
                              text: " API endpoint ",
                              style: GoogleFonts.oswald(
                                textStyle: TextStyle(
                                  color: Colors.blue
                                )
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                    final Uri url = Uri.parse('https://zoo-animal-api.herokuapp.com');
                                      if (!await launchUrl(url)) {
                                        throw 'Could not launch $url';
                                      }
                                },
                            ),
                            TextSpan(
                              text: 'to find data about zoo'
                                    ' animals and used the concept of state to allow a user to randomly generate an animal with every button click.'
                                    ' To learn more about me, you can checkout my website ',
                              style: GoogleFonts.oswald()
                            ),
                            TextSpan(
                              text: "here",
                              style: GoogleFonts.oswald(
                                textStyle: TextStyle(
                                  color: Colors.blue
                                )
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                    final Uri url = Uri.parse('https://nicholaswlee.github.io/personal-website/');
                                      if (!await launchUrl(url)) {
                                        throw 'Could not launch $url';
                                      }
                                },
                            ),
                            TextSpan(
                              text: ".",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ),
            ),
          ],
        ),
      );
  }
}
