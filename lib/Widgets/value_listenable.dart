import 'package:flutter/material.dart';
import 'package:flutter_cool_widgets/utils.dart';

class ValueListenableBuilderDemo extends StatefulWidget {
  @override
  _ValueListenableBuilderDemoState createState() => _ValueListenableBuilderDemoState();
}

class _ValueListenableBuilderDemoState extends State<ValueListenableBuilderDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ValueListenableBuilderDemo"),
      ),
      body: Builder(
        builder: (context) => Column(
          children: [

          ],
        ),
      ),
    );
  }
}
