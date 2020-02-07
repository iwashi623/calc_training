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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(widget.numberOfQuestions.toString())),
    );
  }
}
