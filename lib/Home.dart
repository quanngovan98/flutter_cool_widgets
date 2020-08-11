import 'package:flutter/material.dart';
import 'package:flutter_cool_widgets/Widgets/dismissible.dart';
import 'package:flutter_cool_widgets/Widgets/draggable.dart';
import 'package:flutter_cool_widgets/Widgets/reorderable_listview.dart';
import 'package:flutter_cool_widgets/utils.dart';

import 'Widgets/value_listenable.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Utils().buildButton(text: "Dismissible", onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => DismissibleDemo()));
              }),
              Utils().buildButton(text: "ReorderableListView", onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ReorderableListViewDemo()));
              }),
              Utils().buildButton(text: "DraggableDemo", onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => DraggableDemo()));
              }),
              Utils().buildButton(text: "ValueListenableBuilder", onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ValueListenableBuilderDemo()));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
