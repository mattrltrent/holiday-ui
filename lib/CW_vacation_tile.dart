import 'package:flutter/material.dart';
import 'package:fluttershowcase2/vacation_screen.dart';

class VacationTile extends StatelessWidget {

  final String destination;
  final String imagePath;

  const VacationTile({Key key, @required this.destination, @required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => VacationScreen()),
          );
        },
        child: Stack(
          children: <Widget>[
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(2, 1),
                    blurRadius: 8,
                  ),
                ],
                color: Colors.grey,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              child: Container(
                width: double.infinity,
                height: 200,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                      child: Container(
                        color: Colors.white,
                        height: 60,
                        width: double.infinity,
                        child: Center(
                          child: Text(destination, style: TextStyle(fontFamily: 'Ub', fontSize: 15, fontWeight: FontWeight.w500),),
                        ),
                      ),
                    ),
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