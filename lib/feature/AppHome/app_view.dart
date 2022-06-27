import 'package:flutter/material.dart';
import 'package:on_boarding/feature/AppHome/switch_page_bottombar.dart';

import '../../core/model/tab_icon/tab_icon_model.dart';
import 'bottombar.dart';

class Home extends StatefulWidget {
  static const routName = "/Home";
  Widget screenView;


   Home(this.screenView);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>  with TickerProviderStateMixin{
  AnimationController? animationController;
  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    // tabBody = MyDiaryScreen(animationController: animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Color(0xFFF2F3F8),
      child: SafeArea(
        bottom: false,
        top: false,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: FutureBuilder<bool>(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (!snapshot.hasData) {
                return const SizedBox();
              } else {
                return Stack(
                  children: <Widget>[
                    widget.screenView,
                    bottomBar(),

                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {
          },
          changeIndex: (int index) {
            if (index == 0 ) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  widget.screenView =SwitchScreenPage(0);
                });
              });
            } else if (index == 1 ) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  widget.screenView =SwitchScreenPage(1);
                });
              });
            }else if (index == 2 ) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  widget.screenView =SwitchScreenPage(2);
                });
              });
            }else if (index == 3 ) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  widget.screenView =SwitchScreenPage(3);
                });
              });
            }
          },
        ),
      ],
    );
  }
}
