import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';

class ListViewWidget extends StatefulWidget {
  const ListViewWidget({Key? key}) : super(key: key);

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  @override
  Widget build(BuildContext context) {
    final List<String> placeHistory = <String>[
      "Fried Chicken",
      "Italian Pizza Place",
      "Noodles",
      "Instant Food"
    ];

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Available Places"),
        trailing: GestureDetector(
          child: const Text("Add", style: TextStyle(color: CupertinoColors.activeBlue),),
          onTap: (){},
        )
      ),
      child: ListView.builder(
          itemCount: placeHistory.length,
          itemBuilder: (BuildContext context, int idx){
            return SwipeActionCell(
              key: ObjectKey(idx),
              trailingActions: <SwipeAction>[
                SwipeAction(
                  title: "Delete",
                  onTap: (CompletionHandler handler) async {},
                  color: CupertinoColors.destructiveRed
                ),
                SwipeAction(
                  title: "Edit",
                  onTap: (CompletionHandler handler) async {},
                  color: CupertinoColors.systemGrey
                ),
              ],
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(placeHistory[idx])
                    ),
                    const Icon(
                      Icons.arrow_forward_ios
                    )
                  ],
                ),
              ),
            );
          }
      )
    );
  }
}
