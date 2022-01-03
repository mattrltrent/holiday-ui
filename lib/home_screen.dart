import 'package:flutter/material.dart';
import 'CW_vacation_tile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 15, left: 15, right: 15),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.add_location,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                  Container(
                    width: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.lightBlue, width: 2),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Container(
                        width: 30,
                        child: Image.asset('images/person.png'),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.more_horiz,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Discover new horizons',
                      style: TextStyle(fontFamily: 'Ub', fontSize: 22),
                    ),
                    Text(
                      'More than 50 adventures await',
                      style: TextStyle(
                          fontFamily: 'Ub', fontSize: 15, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                width: double.infinity,
                height: 2,
                color: Colors.grey,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      VacationTile(imagePath: 'images/vacation1.jpg', destination: 'Hawaii, America'),
                      VacationTile(imagePath: 'images/vacation2.jpg', destination: 'Nassau, Bahamas'),
                      VacationTile(imagePath: 'images/vacation3.jpg', destination: 'Varadero, Cuba'),
                      VacationTile(imagePath: 'images/vacation4.jpg', destination: 'Cancun, Mexico'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


