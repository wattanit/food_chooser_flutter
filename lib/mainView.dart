import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainViewWidget extends StatelessWidget {
  const MainViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // navigationBar: const CupertinoNavigationBar(
      //   middle: Text("Main View"),
      // ),
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: const <Widget>[
          TopBar(),
          RollButton(),
          Text("History", style: TextStyle(
            color: CupertinoColors.systemGrey
          )),
          Divider(),
          HistoryList(),
          // HistoryList()
        ],
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 60.0,
      child: Center(
        child: Icon(
            Icons.menu
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
      height: 400.0,
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

class HistoryList extends StatefulWidget {
  const HistoryList({Key? key}) : super(key: key);

  @override
  State<HistoryList> createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  @override
  Widget build(BuildContext context) {
    final List<String> placeHistory = <String>[
      "Fried Chicken",
      "Italian Pizza Place",
      "Noodles",
      "Instant Food"
    ];

    final List<String> placeDateTime = <String>[
      "08/03/2022 12:30",
      "06/03/2022 13:11",
      "04/02/2022 12:43",
      "24/01/2022 13:52"
    ];

    return ListView.builder(
        shrinkWrap: true,
        itemCount: placeHistory.length,
        itemBuilder: (BuildContext context, int idx){
          return SizedBox(
            height: 50,
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text(placeHistory[idx])
                ),
                Text(placeDateTime[idx], style: const TextStyle(
                  color: CupertinoColors.systemGrey
                ))
              ],
            ),
          );
        }
    );
  }
}
