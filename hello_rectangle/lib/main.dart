import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('App Name'),
          ),
        body:
          new Text(
          "Hello Flutter!",
          // TextStyle : テキストのスタイルを扱うクラス
            style: new TextStyle(fontSize:32.0,
            /**
             * Colorについて
             * ・定数扱いにしてconst Colorを使うと、例えば同じ値のColorを作成するような場合、同じインスタンスが
             * 参照されるようになり、メモリが節約できる。Colorでは、インスタンスを作成する際にはnewではなく、
             * constを使うのが一般的。
             * ・ARGBの値を個別に引数で指定してインスタンスを作成するメソッドも用意されている。
             * Color.fromARGB([A], [R], [G], [B])  引数には各値0~255を整数で指定。
             * ・Colorsクラスのプロパティを使って色を指定するという方法もある。ex. Colors.blue
             */
            color: const Color(0xFF000000),
            fontWeight: FontWeight.w700,
            fontFamily: "Roboto"),
          ),
    
      );
    }
}