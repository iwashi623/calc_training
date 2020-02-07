import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class TestScreen extends StatefulWidget {
  final numberOfQuestions;

  //varだと値を変えられるからだめ
  //finalとconstは値が設定されるタイミングが違う。
  //（constはアプリが作成された段階で値が決まってしまう）

  TestScreen({this.numberOfQuestions});

  //コンストラクタの作成と、クラス属性の追加{}

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int numberOfRemaining = 0;
  int numberOfCorrect = 0;
  int numberOfRate = 0;

  int questionLeft = 0;
  int questionRight = 0;
  String operator = "";
  String answerString = "";

  Soundpool soundpool;
  int soundIdCorrect = 0;
  int soundIdInCorrect = 0;

  @override
  void initState() {
    super.initState();
    numberOfCorrect = 0;
    numberOfRate = 0;
    numberOfRemaining = widget.numberOfQuestions;
    //StatefulWidgetのインスタンスを使う方法？

    //initState内では非同期処理できないためメソッドにして、
    // initState外で処理を書く
    _initSounds();

    setQuestion();
  }

  void _initSounds() async {
    try {
      soundpool = Soundpool();
      soundIdCorrect = await loadSound("assets/sounds/sound_correct.mp3");
      soundIdInCorrect = await loadSound("assets/sounds/sound_incorrect.mp3");
      setState(() {});
    } on IOException catch (error) {
      print("エラーの内容は：$error");
    }
  }

  Future<int> loadSound(String soundPath) {
    return rootBundle.load(soundPath).then((value) => soundpool.load(value));
  }

  @override
  void dispose() {
    super.dispose();
    soundpool.release();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          //Stackは上に書いてあるものが画面上では下になる
          children: <Widget>[
            Column(
              children: <Widget>[
                //スコア表示部分
                _scorePart(),
                //問題表示部分
                _questionPart(),
                //電卓部分
                _calcButtons(),
                //答え合わせ部分
                _answerCheckButton(),
                //戻るボタン部分
                _backButton()
              ],
            ),
            //○✕マーク
            _correctIncorrectImage(),
            //終了メッセージ
            _endMessage()
          ],
        ),
      ),
    );
  }

  Widget _scorePart() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 30.0, right: 8.0),
      child: Table(
        children: [
          TableRow(children: [
            Center(
                child: Text(
              "のこり問題数",
              style: TextStyle(fontSize: 10.0),
            )),
            Center(
                child: Text(
              "正解数",
              style: TextStyle(fontSize: 10.0),
            )),
            Center(
                child: Text(
              "正答率",
              style: TextStyle(fontSize: 10.0),
            ))
          ]),
          TableRow(children: [
            Center(
                child: Text(
              numberOfRemaining.toString(),
              style: TextStyle(fontSize: 20.0),
            )),
            Center(
                child: Text(
              numberOfCorrect.toString(),
              style: TextStyle(fontSize: 20.0),
            )),
            Center(
                child: Text(
              numberOfRate.toString(),
              style: TextStyle(fontSize: 20.0),
            ))
          ])
        ],
      ),
    );
  }

  Widget _questionPart() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 80.0),
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  questionLeft.toString(),
                  style: TextStyle(fontSize: 36.0),
                ),
              )),
          Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  operator,
                  style: TextStyle(fontSize: 30.0),
                ),
              )),
          Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  questionRight.toString(),
                  style: TextStyle(fontSize: 36.0),
                ),
              )),
          Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "=",
                  style: TextStyle(fontSize: 30.0),
                ),
              )),
          Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  answerString,
                  style: TextStyle(fontSize: 60.0),
                ),
              ))
        ],
      ),
    );
  }

  Widget _calcButtons() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 50.0),
        child: Table(
          children: [
            TableRow(children: [
              _calcButton("7"),
              _calcButton("8"),
              _calcButton("9"),
            ]),
            TableRow(children: [
              _calcButton("4"),
              _calcButton("5"),
              _calcButton("6"),
            ]),
            TableRow(children: [
              _calcButton("1"),
              _calcButton("2"),
              _calcButton("3"),
            ]),
            TableRow(children: [
              _calcButton("0"),
              _calcButton("-"),
              _calcButton("C"),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _calcButton(String numString) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: RaisedButton(
        color: Colors.brown,
        onPressed: null,
        child: Text(numString, style: TextStyle(fontSize: 24.0)),
      ),
    );
  }

  Widget _answerCheckButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: RaisedButton(
          color: Colors.brown,
          onPressed: null,
          child: Text(
            "こたえあわせ",
            style: TextStyle(fontSize: 14.0),
          ),
        ),
      ),
    );
  }

  Widget _backButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: RaisedButton(
          onPressed: null,
          child: Text(
            "もどる",
            style: TextStyle(fontSize: 14.0),
          ),
        ),
      ),
    );
  }

  Widget _correctIncorrectImage() {
    return Center(child: Image.asset("assets/images/pic_correct.png"));
  }

  Widget _endMessage() {
    return Center(
      child: Text("テスト終了", style: TextStyle(fontSize: 60.0)),
    );
  }

  void setQuestion() {}
}
