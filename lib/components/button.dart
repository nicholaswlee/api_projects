import 'package:flutter/material.dart';
import 'package:random_animals_web_app/components/text_displays.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
class StyledButton extends StatelessWidget {
  const StyledButton({required this.child, required this.onPressed, super.key});
  final Widget child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.black),
            backgroundColor: Colors.blue[800],
          ),
        onPressed: onPressed,
        child: child,
      );
}

class LinkFooter extends StatelessWidget {
  LinkFooter({Key? key}) : super(key: key);

  @override
  final Uri linkedInUrl = Uri.parse('https://www.linkedin.com/in/nicholas-lee-7428a1216/');
  final Uri githubUrl = Uri.parse('https://github.com/nicholaswlee');
  Future<void> _launchUrl(_url) async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}
  Widget build(BuildContext context){
    return(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Body(text: "Nicholas Lee"),
        ),
        IconButton(onPressed: (){_launchUrl(githubUrl);}, icon:FaIcon(FontAwesomeIcons.github, size: 20)),
        IconButton(onPressed: (){_launchUrl(linkedInUrl);}, icon: FaIcon(FontAwesomeIcons.linkedin, size: 20)),

      ],
      )
    );
  }
}