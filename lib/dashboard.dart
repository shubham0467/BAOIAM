import 'package:biaom_app/Help_widget.dart';
import 'package:biaom_app/About_Us.dart';
import 'package:biaom_app/setting_page.dart';
import 'package:flutter/material.dart';
import 'customer_service.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DarklightTheme();
  }
}

class DarklightTheme extends StatefulWidget {
  const DarklightTheme({
    Key? key,
  }) : super(key: key);

  @override
  State<DarklightTheme> createState() => _DarklightThemeState();
}

ThemeData _darkTheme = ThemeData(
  accentColor: Colors.red,
  brightness: Brightness.dark,
  primaryColor: Colors.amber,
);

ThemeData _lightTheme = ThemeData(
    accentColor: Colors.pink,
    brightness: Brightness.light,
    primaryColor: Colors.blue);
bool _light = true;

class _DarklightThemeState extends State<DarklightTheme> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _light ? _lightTheme : _darkTheme,
        darkTheme: _darkTheme,
        home: Scaffold(
          appBar: AppBar(
            title: const Text(" dashboard"),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.shopping_cart_rounded)),
              IconButton(onPressed: () {}, icon: Icon(Icons.person)),
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 0,
                    child: Text(" Settings"),
                  ),
                  PopupMenuItem(
                    value: 1,
                    child: Text(" About Us"),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text(" Help "),
                  )
                ],
                onSelected: (item) => SelectedItem(context, item),
              )
            ],
            backgroundColor: Colors.deepPurple,
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                const DrawerHeader(
                    decoration: BoxDecoration(color: Colors.deepPurple),
                    child: Icon(Icons.android_outlined)),
                const ListTile(
                  leading: Icon(Icons.tag_faces),
                  title: Text("Extra Curricular Activity"),
                ),
                const ListTile(
                  leading: Icon(Icons.image_search),
                  title: Text("Traking Report"),
                ),
                const ListTile(
                  leading: Icon(Icons.lightbulb_outline_rounded),
                  title: Text("Querty/Doubt Session"),
                ),
                const ListTile(
                  leading: Icon(Icons.assignment_returned_rounded),
                  title: Text("My download"),
                ),
                const ListTile(
                  leading: Icon(Icons.group),
                  title: Text("Scholarships"),
                ),
                const ListTile(
                  leading: Icon(Icons.emoji_events_sharp),
                  title: Text("Events"),
                ),
                ListTile(
                  leading: Icon(Icons.dark_mode),
                  title: Text("Dark Mode"),
                  trailing: Container(
                    child: Switch(
                        value: _light,
                        onChanged: (toggle) {
                          setState(() {
                            _light = toggle;
                          });
                        }),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.support_agent),
                  title: Text("Customer Support"),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => customer()));
                  },
                )
              ],
            ),
          ),
        ));
  }

  SelectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => setting()));
        break;
      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AboutUS()));
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Help()));
        break;
    }
  }
}
