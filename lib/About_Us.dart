import 'package:biaom_app/dashboard.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class AboutUS extends StatelessWidget {
  const AboutUS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(Homepage());
          },
          icon: const Icon(Icons.navigate_before),
        ),
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "AboutUs",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                height: 100,
                width: 200,
                child: Image.asset('assets/baoiam.jpg'),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 15, left: 15, right: 20, bottom: 20),
              child: const Text(
                "Baoiam is a fully-certified platform since 2020, helping millions of students through the entire world to achieve their personal and professional goals. It is a platform which provides various courses as well as the opportunities in the field of education and career.",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              alignment: Alignment.centerLeft,
              child: const Text(
                " Follows  us on",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: _fbURL,
                    icon: Image.asset(
                      'assets/fb.png',
                      scale: 1,
                    ),
                  ),
                  IconButton(
                    onPressed: _instaURL,
                    icon: Image.asset(
                      'assets/insta.jpg',
                      scale: 1,
                    ),
                  ),
                  IconButton(
                    onPressed: _twitterURL,
                    icon: Image.asset(
                      'assets/twitter.png',
                      scale: 1,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

_fbURL() async {
  const url = 'https://www.facebook.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_instaURL() async {
  const url = 'https://www.instagram.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_twitterURL() async {
  const url = 'https://twitter.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
