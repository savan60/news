import 'package:flutter/material.dart';
import 'package:news/dummydata.dart';
import 'package:news/screens/appdrawer.dart';
import 'package:news/screens/homepage/newslist.dart';
import 'package:news/utils/size_config.dart';

class HomePage extends StatelessWidget {
  static final String routename = "/home-page";
  GlobalKey<ScaffoldState> _scaffoldState2 = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldState2,
        drawer: drawer(),
        body: LayoutBuilder(builder: (context, constraints) {
          SizeConfig().init(constraints);
          var maxH = constraints.maxHeight;
          var maxW = constraints.maxWidth;

          return Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.only(
                      left: 8 * maxW / 360, bottom: 8 * maxW / 360),
                  width: maxW,
                  color: Colors.teal[900],
                  child: InkWell(
                    onTap: () {
                      print("here");
                      _scaffoldState2.currentState.openDrawer();
                    },
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        height: 30 * maxH / 672,
                        width: 30 * maxW / 360,
                        child: Image.asset(
                          "assets/images/ham.png",
                          fit: BoxFit.contain,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 24,
                child: ListView.builder(
                  itemBuilder: (ctx, i) {
                    return NewsList(index: i,);
                  },
                  itemCount: DUMMY_NEWS.length,
                ),
              )
            ],
          );
        }));
  }
}
