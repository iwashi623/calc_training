import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Image.asset("assets/images/image_title.png"),
                Text("問題数を選択し、「スタート」ボタンを押してください"),
                //TODO
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomCenter,
//                  padding: EdgeInsets.only(bottom: 10),
                    child: RaisedButton.icon(
                      color: Colors.brown,
                      onPressed: () => print("ボタンの押したで〜"),
                      label: Text("スタート"),
                      icon: Icon(Icons.skip_next),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
