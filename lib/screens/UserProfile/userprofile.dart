import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news/dummydata.dart';
import 'package:news/model/user.dart';
import 'package:news/screens/UserProfile/editprofile.dart';
import 'package:news/screens/UserProfile/savedprofile.dart';
import 'package:news/screens/appdrawer.dart';

class UserProfile extends StatefulWidget {
  static final String routename = "/user-profile";

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  User user;
  GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _forrmkey = GlobalKey();
  bool _isedit = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = User(
        date: '03-03-2021',
        email: 'matariyasavanh@gmail.com',
        gender: 'Male',
        location:
            '102- ideal Palace, Near Krishna School,Ravapar Road, Morbi, Gujarat',
        name: 'Savan Matariya',
        phone: '+91-9537274877',
        pincode: '363641',
        profile: 'assets/images/news1.jpg');
  }

  @override
  Widget build(BuildContext context) {
    void _submit() {
      print("insubmit ");
      if (_isedit) {
        if (!_forrmkey.currentState.validate()) {
          return;
        }
        _forrmkey.currentState.save();
        setState(() {
          _isedit = false;
        });
      } else {
        setState(() {
          _isedit = true;
        });
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: _scaffoldState,
      drawer: drawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          var maxH = 672.0;
          //  SizeConfig.heightMultiplier * 100;
          var maxW = 360.0;
          //  SizeConfig.widthMultiplier * 100;
          return Column(
            children: [
              Container(
                height: maxH * 3 / 28,
                child: Container(
                  padding: EdgeInsets.only(
                      left: 8 * maxW / 360, bottom: 8 * maxW / 360),
                  width: maxW,
                  color: Colors.teal[900],
                  child: InkWell(
                    onTap: () => _scaffoldState.currentState.openDrawer(),
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
              Container(
                  height: maxH * 8 / 28,
                  child: Container(
                    width: maxW,
                    color: Colors.grey[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 52*maxH/672,
                          backgroundColor: Colors.deepOrange,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50*maxH/672),
                            child: Image.asset(
                              user.profile,
                              width: 100 * maxW / 360,
                              height: 100 * maxH / 672,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2 * maxH / 672,
                        ),
                        Flexible(
                          child: Text(
                            user.name,
                            style: TextStyle(
                                fontSize: 17 * maxH / 672,
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 10 * maxH / 672,
                        ),
                        InkWell(
                          onTap: _submit,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8 * maxW / 360,
                                vertical: 2 * maxH / 672),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey[300],
                                    width: 1 * maxW / 360),
                                top: BorderSide(
                                    color: Colors.grey[300],
                                    width: 1 * maxW / 360),
                                right: BorderSide(
                                    color: Colors.grey[300],
                                    width: 1 * maxW / 360),
                                left: BorderSide(
                                    color: Colors.grey[300],
                                    width: 1 * maxW / 360),
                              ),
                            ),
                            child: Text(
                              _isedit ? "Save Profile" : "Edit Profile",
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontSize: 10 * maxH / 672),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
              Expanded(
                // height: maxH*16/28,
                child: Container(
                  padding: EdgeInsets.only(
                      left: 18 * maxW / 360,
                      right: 24 * maxW / 360,
                      top: 20 * maxH / 672),
                  child: Form(
                    key: _forrmkey,
                    child: _isedit
                        ? EditProfile(maxH: maxH, maxW: maxW, user: user)
                        : SavedProfile(maxH: maxH, maxW: maxW, user: user),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
