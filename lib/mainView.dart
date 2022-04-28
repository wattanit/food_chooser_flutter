import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'listView.dart';

class Place{
  String id;
  String name;
  String description;
  String location;
  List<String> history = [];

  Place(this.id , this.name, this.description, this.location);
}

class History{
  String placeId;
  String name;
  String time;

  History(this.placeId, this.name, this.time);
}

class MainViewWidget extends StatefulWidget {
  const MainViewWidget({Key? key}) : super(key: key);

  @override
  State<MainViewWidget> createState() => _MainViewWidgetState();
}

class _MainViewWidgetState extends State<MainViewWidget> {
  //DateTime.now().microsecondsSinceEpoch.toString()
  List<Place> places = <Place>[
    Place("1", "Instant Food", "Place A", "Here"),
    Place("2", "Noodles", "Place B", "There"),
    Place("3", "Italian Pizza Place", "Place C", "Anywhere"),
    Place("4", "Fried Chicken", "Place D", "Everywhere")
  ];

  List<History> history = <History>[
    History("4", "Fried Chicken", "08/03/2022 12:31"),
    History("3", "Italian Pizza Place", "06/03/2022 13:11"),
    History("2", "Noodles", "04/02/2022 12:43"),
    History("1", "Instant Food", "24/01/2022 13:52")
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // navigationBar: const CupertinoNavigationBar(
      //   middle: Text("Main View"),
      // ),
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          TopBar(places: places),
          const RollButton(),
          const Text("History", style: TextStyle(
              color: CupertinoColors.systemGrey
          )),
          const Divider(),
          HistoryList(history: history),
          // HistoryList()
        ],
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
    required this.places
  }) : super(key: key);

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.0,
      child: Center(
        child: CupertinoButton(
            child: const Icon(
              Icons.menu,
            ),
            onPressed: (){
              Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context)=> ListViewWidget(
                    places: places
                  ))
              );
            }
        ),
      ),
    );
  }
}

class RollButton extends StatelessWidget {
  const RollButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const Alignment(0.0, 0.0),
      height: 350.0,
      child: CustomPaint(
        painter: ButtonPainter(),
      ),
    );
  }
}

class ButtonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size){
    var bgColor = Paint()
      ..color = const Color(0xff3388ff)
      ..style = PaintingStyle.fill;

    var textPainter = TextPainter(
      text: const TextSpan(
          text: "Roll\nFor\nPlace",
          style: TextStyle(
            color: CupertinoColors.white,
            fontSize: 24.0
          )
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: 100
    );

    canvas.drawCircle(const Offset(0, 0), 100, bgColor);
    textPainter.paint(canvas, const Offset(-30, -35));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class HistoryList extends StatelessWidget {
  const HistoryList({
    Key? key,
    required this.history
  }) : super(key: key);

  final List<History> history;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: history.length,
        itemBuilder: (BuildContext context, int idx){
          return SizedBox(
            height: 50,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(history[idx].name),
                ),
                Text(history[idx].time, style: const TextStyle(
                    color: CupertinoColors.systemGrey
                ))
              ],
            ),
          );
        }
    );
  }
}
