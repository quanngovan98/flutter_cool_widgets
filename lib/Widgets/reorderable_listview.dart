import 'package:flutter/material.dart';
import 'package:flutter_cool_widgets/utils.dart';

class ReorderableListViewDemo extends StatefulWidget {
  @override
  _ReorderableListViewDemoState createState() => _ReorderableListViewDemoState();
}

class _ReorderableListViewDemoState extends State<ReorderableListViewDemo> {
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

  void _updateItem(int oldIndex, int newIndex) {
    setState(() {
      if(newIndex > oldIndex) {
        items.insert(newIndex, items[oldIndex]);
        items.removeAt(oldIndex);
      } else if(newIndex < oldIndex){
        var temp = items[oldIndex];
        items.removeAt(oldIndex);
        items.insert(newIndex, temp);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ReorderableListView"),),
      body: ReorderableListView(
        header: Text("Drag to reorder", style: TextStyle(
          color: Colors.blue,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        )),
        onReorder: (oldIndex, newIndex) {
          setState(() {
            _updateItem(oldIndex, newIndex);
          });
        },
        children: items.map((e) => Utils().buildButton(index: int.parse(e),text: "$e", key: ValueKey(e))).toList(),
      ),
    );
  }
}
