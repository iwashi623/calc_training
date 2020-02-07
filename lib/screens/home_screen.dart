import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<DropdownMenuItem<int>> _menuItems = List();
  int _numberOfQuestion = 0;

  @override
  void initState() {
    super.initState();
    setMenuItems();
    _numberOfQuestion = _menuItems[0].value;

  }

  void setMenuItems() {
    _menuItems.add(DropdownMenuItem(value: 10, child: Text("10"),));
    _menuItems.add(DropdownMenuItem(value: 20, child: Text("20"),));
    _menuItems.add(DropdownMenuItem(value: 30, child: Text("30"),));

//    _menuItems = [
//      DropdownMenuItem(value: 10, child: Text("10"),),
//      DropdownMenuItem(value: 20, child: Text("20"),),
//      DropdownMenuItem(value: 30, child: Text("30"),)
//    ];

//    _menuItems
//        ..add(DropdownMenuItem(value: 10, child: Text("10"),))
//        ..add(DropdownMenuItem(value: 20, child: Text("20"),))
//        ..add(DropdownMenuItem(value: 30, child: Text("30"),));
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    //コンソールに画面幅を表示
    print("横幅のピクセル: $screenWidth");
    print("縦幅のピクセル: $screenHeight");

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Image.asset("assets/images/image_title.png"),
                SizedBox(height: 20.0,),
                Text(
                  "問題数を選択し、「スタート」ボタンを押してください",
                  style: TextStyle(fontSize: 12.0),
                ),
                SizedBox(height: 100,),
                DropdownButton(
                  items: _menuItems,
                  value: _numberOfQuestion,
                  onChanged: (selectedValue){
                    setState(() {
                      _numberOfQuestion = selectedValue;
                    });
                  },
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.only(bottom: 30),
                    child: RaisedButton.icon(
                      color: Colors.brown,
                      onPressed: () => print("ボタンの押したで〜"),
                      label: Text("スタート"),
                      icon: Icon(Icons.skip_next),
                      //↑マテリアルアイコンの挿入
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
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
