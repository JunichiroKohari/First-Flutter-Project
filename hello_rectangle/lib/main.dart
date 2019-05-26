//flutter の画面は全てウィジェットを階層的に組み込んで作られている
//この組み込み構造を「ウィジェットツリー」と呼ぶ

//flutter のマテリアルデザインによるアプリのUIウィジェットをまとめたパッケージ
import 'package:flutter/material.dart';

/* main関数がアプリ起動時に呼び出される処理 */
//main関数においてrunAppでアプリを起動する
void main() => runApp(new MyApp());

/*
 * ウィジェットのクラスはステート(状態を表す値)を持つStatefulWidgetと、
 * ステートを持たないStatelessWidgetのいずれかを継承して作成する。
 * 全てのウィジェットはWidgetというクラスのサブクラスである。
 */
//Stateless⇨静的な表示
class MyApp extends StatelessWidget {

/* ウィジェットが生成される時に呼び出されるメソッド
 * BuildContextは、組み込まれたウィジェットに関する機能
 * (ウィジェットが組み込まれている親や子の情報などに関する機能)
 * がまとめられている
 */
  @override
  Widget build(BuildContext context) { 
    
    return new MaterialApp(
      //アプリのタイトル
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      //homeに,組み込まれるウィジェットを設定
      home: new MyHomePage(
        title: 'Flutterサンプルアプリ',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}): super(key: keys);
  final String title;
  
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

//ステートクラス
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter(){
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            )
          ],
        ),
      ),
      //フローティングアクションボタン。丸いアイコンを表示したボタン。常に右下に表示される
      //インスタンスを作成するには匿名クラスの要素としてこれらのプロパティを用意しておく。
      floatingActionButton: FloatingActionButton(
        //onPressed:ボタンをタップした時に呼び出されるメソッド
        onPressed: _incrementCounter,
        //tooltip:ツールチップとして表示するテキスト
        tooltip: 'set message.',
        //child:このウィジェット内に組み込まれているウィジェット類をまとめたもの
        child: Icon(Icons.star),
      ),
    );
  }
}