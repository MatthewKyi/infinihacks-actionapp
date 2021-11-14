import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ActionApp',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Nav(),
    );
  }
}

class Nav extends StatefulWidget {
  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<Nav> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [const Home(), const About()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC8E6C9),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ActionApp"),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.white,
        backgroundColor: Colors.green,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.lightbulb,
                color: Colors.white,
              ),
              label: "About"),
        ],
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Column(
          children: <Widget>[
            const Text(
              "The Planet Needs You \n",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 45,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 90,
              width: 350,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const generated()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                child: const Text(
                  "What Can I Do?",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 60, left: 20, right: 20),
        child: Column(
          children: const <Widget>[
            Text(
              "Action App\n\n This app was designed to make it quick and easy to contribute to solving worldwide environmental problems. With just the click\n of a button, ActionApp shows you a way you can help!",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class generated extends StatelessWidget {
  const generated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ActionApp',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: help(),
    );
  }
}

class help extends StatelessWidget {
  List<String> helpArr = [
    'Protect orcas from whale-watching and fishing boats\n',
    'Help stop Plastic Pollution\n',
    'Help nature thrive\n',
    'Help create sustainable communities\n',
    'Donate to 350.org\n',
    'Help Prevent oil spills\n'
  ];
  List<String> helpLinkArr = [
    'https://davidsuzuki.org/action/protect-orcas-from-whale-watching-and-fishing-boats/',
    'https://davidsuzuki.org/action/stop-plastic-pollution/',
    'https://davidsuzuki.org/action/help-nature-thrive/',
    'https://davidsuzuki.org/action/help-create-sustainable-communities/',
    'https://act.350.org/donate/web_banner_main_nav_v1/?amount=10&source=web_banner',
    'https://act.stand.earth/page/34153/petition/1?ea.tracking.id=act-page',
  ];
  int randomIndex = Random().nextInt(6);
  help({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC8E6C9),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ActionApp"),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Nav()),
            );
          },
        ),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 60, left: 20, right: 20),
          child: Column(
            children: <Widget>[
              Text(
                helpArr[randomIndex],
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: 250,
                height: 100,
                child: TextButton(
                    onPressed: () async {
                      const url = 'https://google.com';

                      launch(helpLinkArr[randomIndex]);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    child: const Text(
                      "Visit",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  width: 250,
                  height: 100,
                  child: TextButton(
                      onPressed: () async {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => help()));
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                      ),
                      child: const Text(
                        "Find Another Way",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
