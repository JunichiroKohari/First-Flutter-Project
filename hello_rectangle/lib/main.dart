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
  final title = 'Flutterサンプル';

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
      //homeに,組み込まれるウィジェットを設定
      home: new MyHomePage(
        title: this.title,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({this.title}): super();
  final String title;
  
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

//ステートクラス
class _MyHomePageState extends State<MyHomePage> {
  String _message;

  //プロパティの初期化。Stateクラスに専用のメソッドとして用意されている。
  /**
   * initStateは、インスタンスが作成され、ウィジェットのツリー構造への
   * 組み込みが完了した時点で呼び出される。
   * コンストラクタではウィジェットツリーが完了していない為にエラーになるような
   * 処理(他のウィジェットの参照など)もinitStateでは問題なく実行できる。
   */
  @override
  void initState(){
    super.initState();
    _message = 'Hello!';
  }

  void _setMessage(){

    //setStateメソッドはステートの更新をステートクラスに知らせる働きをする。
    //このメソッドに、必要な値の変更処理を用意する。引数は関数。
    setState(() {
      _message = 'タップしました！';
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      
      body: Text(
        _message,
        style: TextStyle(fontSize: 32.0),
      ),
      //フローティングアクションボタン。丸いアイコンを表示したボタン。常に右下に表示される
      //インスタンスを作成するには匿名クラスの要素としてこれらのプロパティを用意しておく。
      floatingActionButton: FloatingActionButton(
        //onPressed:ボタンをタップした時に呼び出されるメソッド
        onPressed: _setMessage,
        //tooltip:ツールチップとして表示するテキスト
        tooltip: 'set message.',
        //child:このウィジェット内に組み込まれているウィジェット類をまとめたもの
        child: Icon(Icons.star),
      ),
    );
  }
}