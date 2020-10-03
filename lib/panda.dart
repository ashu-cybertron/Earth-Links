import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_universe/drawer/drawer.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String pass = "admin"; // the correct pass

  String animationType = "idle"; //just to pass vakue

  final passwordController =
      TextEditingController(); // to controll the password
  final passwordFocusNode =
      FocusNode(); // to see if user is focusing on password

  @override
  void initState() {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        setState(() {
          animationType = "test";
        });
      } else {
        setState(() {
          animationType = "idle";
        });
      }
    });
    super.initState();
  }

  // Future letsGo() async{
  //   Widget response = await MaterialPageRoute(builder: (context)=> Drawer())
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.black,
                child: Image.asset(
                  //"assets/earth1.png",
                  "assets/earth2.gif",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 30,
                  width: 200,
                ),
                Center(
                  child: Container(
                      height: 300,
                      width: 250,
                      child: CircleAvatar(
                        child: new FlareActor(
                          "assets/teddy_test.flr",
                          alignment: Alignment.center,
                          fit: BoxFit.contain,
                          animation: animationType,
                        ),
                        backgroundColor: Colors.transparent,
                      )),
                ),
                SizedBox(
                  height: 30,
                  width: 10,
                ),
                Container(
                  height: 140,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "User name",
                            contentPadding: EdgeInsets.all(20)),
                      ),
                      Divider(),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            contentPadding: EdgeInsets.all(20)),
                        controller: passwordController,
                        focusNode: passwordFocusNode,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 350,
                  height: 70,
                  padding: EdgeInsets.only(top: 20),
                  child: RaisedButton(
                      color: Colors.pink,
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30),
                      ),
                      onPressed: () {
                        if (passwordController.text.compareTo(pass) == 0) {
                          setState(() {
                            animationType = "success";
                          });
                          Future.delayed(const Duration(milliseconds: 500), () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DrawerPage()));
                          });
                        } else {
                          setState(() {
                            animationType = "fail";
                          });
                        }
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
