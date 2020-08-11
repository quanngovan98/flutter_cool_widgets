import 'package:flutter/material.dart';
import 'package:flutter_cool_widgets/utils.dart';

class DismissibleDemo extends StatefulWidget {
  @override
  _DismissibleDemoState createState() => _DismissibleDemoState();
}

class _DismissibleDemoState extends State<DismissibleDemo> {
  List<String> items = List.generate(20, (index) => "$index");
  Widget buildBackgroundLeft() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(10)),
      width: double.maxFinite,
      margin: EdgeInsets.only(top: 10, right: 10, left: 10),
      height: 60,
      alignment: Alignment.centerLeft,
      child: Icon(Icons.delete),
    );
  }
  Widget buildBackgroundRight() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(10)),
      width: double.maxFinite,
      margin: EdgeInsets.only(top: 10, right: 10, left: 10),
      height: 60,
      alignment: Alignment.centerRight,
      child: Icon(Icons.check),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dismissible"),),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                print("remove index $index");
                setState(() {
                  items.removeAt(index);
                });
              },
              child: Utils().buildButton(index: index,text: "$index", margin: 0),
              background: buildBackgroundLeft(),
              secondaryBackground: buildBackgroundRight(),
            );
          },
        ),
      ),
    );
  }
}
