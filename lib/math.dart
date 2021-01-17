
import 'package:flutter/material.dart';

import 'MainGridList.dart';
import 'constants.dart';

class math extends StatefulWidget {
  @override
 Matem createState() => Matem();
}

class Matem extends State<math> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: starsColorend,
        body: ListView(
          children: <Widget>[
            GridSubject(),
            MainGridList()
          ],
        )
    );
  }
}