import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:random_animals_web_app/components/about_me.dart';
import 'package:random_animals_web_app/components/random_animal_page.dart';
import 'button.dart';
import 'text_displays.dart';

class NavigationBarSide extends StatefulWidget {
  const NavigationBarSide({Key? key}) : super(key: key);


  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  State<NavigationBarSide> createState() => _NavigationBarSideState();
}

class _NavigationBarSideState extends State<NavigationBarSide> {
  
  Widget build(BuildContext context) {
    PageController page = PageController();
    List<SideMenuItem> items = [
      SideMenuItem(
        // Priority of item to show on SideMenu, lower value is displayed at the top
        priority: 0,
        title: 'Home',
        onTap: () => page.jumpToPage(0),
        icon: Icon(Icons.home),
      ),
      SideMenuItem(
        priority: 1,
        title: 'About',
        onTap: () => page.jumpToPage(1),
        icon: Icon(Icons.person),
      ),
    ];
    return(
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            // Page controller to manage a PageView
            controller: page,
            // Will shows on top of all items, it can be a logo or a Title text
            title: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Column(
                children: [
                  Heading(title: "Find Me A Zoo Animal!"),
                  Image.asset('lion.png', width: 400,),
                ],
              ),
            ),
            // Will show on bottom of SideMenu when displayMode was SideMenuDisplayMode.open
            footer: LinkFooter(),
            // Notify when display mode changed
            onDisplayModeChanged: (mode) {
              print(mode);
            },
            // List of SideMenuItem to show them on SideMenu
            items: items,
            style: SideMenuStyle(
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: Colors.blue[100],
              selectedColor: Colors.blue[600],
              selectedTitleTextStyle: TextStyle(color: Colors.white),
              selectedIconColor: Colors.white,
              unselectedIconColor: Colors.white70,
              unselectedTitleTextStyle: TextStyle(color: Colors.white70),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 79, 117, 134),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ]),
              backgroundColor: Color.fromARGB(255, 79, 117, 134),
              // openSideMenuWidth: 200
            ),
          ),
          Expanded(
            child: PageView(
              controller: page,
              children: [
                Container(
                  child: RandomAnimalPage()
                ),
                Container(
                  child: Center(
                    child: AboutPage(),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
  
}