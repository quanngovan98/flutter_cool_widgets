import 'package:flutter/material.dart';
import 'package:flutter_cool_widgets/utils.dart';

class DraggableDemo extends StatefulWidget {
  @override
  _DraggableDemoState createState() => _DraggableDemoState();
}

class _DraggableDemoState extends State<DraggableDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DraggableDemo"),
      ),
      body: Builder(
        builder: (context) => Column(
          children: [
            Draggable<Color>(
              dragAnchor: DragAnchor.child,
              data: Colors.red,
              child: Utils().buildButton(text: "child"),
              onDragStarted: () {},
              onDragCompleted: () {},
              onDragEnd: (d) {},
              childWhenDragging: Utils().buildButton(text: "childWhenDragging"),
              feedback: Utils().buildButton(
                  text: "feedback", width: MediaQuery.of(context).size.width),
            ),
            SizedBox(
              height: 300,
            ),
            DragTarget<Color>(
              onWillAccept: (value) => value != Colors.black,
              onAccept: (value) {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Accept"),
                ));
              },
              onLeave: (value) {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Leave"),
                ));
              },
              builder: (context, candidates, rejects) {
                return candidates.length > 0
                    ? Utils().buildButton(text: "will accept")
                    : Utils().buildButton(text: "target");
              },
            )
          ],
        ),
      ),
    );
  }
}
