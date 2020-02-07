import 'package:flutter/material.dart';

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
  int numberOfRemaining;
  int numberOfCorrect;
  int numberOfRate;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
      ),
    );
  }

  Widget _scorePart() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0,top: 30.0, right: 8.0),
      child: Table(
        children: [
          TableRow(
            children: [
              Center(child: Text("のこり問題数", style: TextStyle(fontSize: 10.0),)),
              Center(child: Text("正解数", style: TextStyle(fontSize: 10.0),)),
              Center(child: Text("正答率", style: TextStyle(fontSize: 10.0),))
            ]
          ),
          TableRow(
            children:[
              Center(child: Text(numberOfRemaining.toString(), style: TextStyle(fontSize: 20.0),)),
              Center(child: Text(numberOfCorrect.toString(), style: TextStyle(fontSize: 20.0),)),
              Center(child: Text(numberOfRate.toString(), style: TextStyle(fontSize: 20.0),))
            ]
          )
        ],
      ),
    );
  }

  Widget _questionPart() {
    return Container();
  }

  Widget _calcButtons() {
    return Container();
  }

  Widget _answerCheckButton() {
    return Container();
  }

  Widget _backButton() {
    return Container();
  }
}
