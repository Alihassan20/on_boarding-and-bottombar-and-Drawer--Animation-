import 'package:flutter/material.dart';

class SwitchScreenPage extends StatefulWidget {
  int i;
  SwitchScreenPage(this.i);

  @override
  State<SwitchScreenPage> createState() => _SwitchScreenPageState();
}

class _SwitchScreenPageState extends State<SwitchScreenPage> {
  List<Widget> screens = [
    Container(color: Colors.white,),
    Container(color: Colors.redAccent,),
    Container(color: Colors.black38,),
    Container(color: Colors.white,),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:screens[widget.i] ,
    );
  }
}
