import 'package:flutter/material.dart';
import 'package:boothome/pages/calendar.dart';
import 'package:boothome/pages/notes.dart';
import 'package:boothome/pages/messages.dart';
import 'package:boothome/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CalendarPage(),
    NotesPage(),
    MessagesPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BootHome',
      theme: ThemeData(
        primarySwatch: _selectedIndex == 0 ? Colors.amber : _selectedIndex == 1 ? Colors.lightBlue : _selectedIndex == 2 ? Colors.yellow : Colors.green,

      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('BootHome'),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        extendBody: true, // Make the body go behind the navbar
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: Container(
            height: 56.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  onTap: () => _onItemTapped(0),
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: _selectedIndex == 0 ? Colors.amber : Colors.grey[300],
                    ),
                    child: Icon(Icons.home),
                  ),
                ),
                InkWell(
                  onTap: () => _onItemTapped(1),
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: _selectedIndex == 1 ? Colors.lightBlue : Colors.grey[300],
                    ),
                    child: Icon(Icons.calendar_today),
                  ),
                ),
                SizedBox(width: 40.0), // The dummy child
                InkWell(
                  onTap: () => _onItemTapped(2),
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: _selectedIndex == 2 ? Colors.yellow : Colors.grey[300]
                    ),
                    child: Icon(Icons.note),
                  ),
                ),
                InkWell(
                  onTap: () => _onItemTapped(3),
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: _selectedIndex == 3 ? Colors.green : Colors.grey[300],
                    ),
                    child: Icon(Icons.message),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            // Add your logic here
          },
        ),
      ),
    );
  }
}
