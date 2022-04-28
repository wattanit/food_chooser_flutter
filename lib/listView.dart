import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';

import 'mainView.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    Key? key,
    required this.places
  }) : super(key: key);

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            middle: const Text("Available Places"),
            trailing: GestureDetector(
              child: const Text("Add", style: TextStyle(color: CupertinoColors.activeBlue),),
              onTap: (){},
            )
        ),
        child: ListView.builder(
            itemCount: places.length,
            itemBuilder: (BuildContext context, int idx){
              return SwipeActionCell(
                key: ObjectKey(places[idx].id),
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
                          child: Text(places[idx].name)
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
