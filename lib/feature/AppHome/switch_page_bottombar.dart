import 'package:flutter/material.dart';

import '../shared_screen/feedback_screen.dart';
import '../shared_screen/help_screen.dart';
import '../shared_screen/home_screen.dart';
import '../shared_screen/invite_friend_screen.dart';


class SwitchScreenPage extends StatefulWidget {
  int i;
  SwitchScreenPage(this.i);

  @override
  State<SwitchScreenPage> createState() => _SwitchScreenPageState();
}

class _SwitchScreenPageState extends State<SwitchScreenPage> {
  List<Widget> screens = [
    MyHomePage(),
    HelpScreen(),
    InviteFriend(),
    FeedbackScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:screens[widget.i] ,
    );
  }
}
