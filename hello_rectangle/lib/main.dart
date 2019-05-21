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
class MyApp extends StatelessWidget {

/* ウィジェットが生成される時に呼び出されるメソッド
 * BuildContextは、組み込まれたウィジェットに関する機能
 * (ウィジェットが組み込まれている親や子の情報などに関する機能)
 * がまとめられている
 */
  Widget build(BuildContext context) { 
    /*
     * material VS cupertino
     * デフォルトで生成されるスクリプトでmaterial.dartが読み込まれるように
     * 設定されていることで、明示的にcupertino.dartを読み込まない限りは
     * マテリアルデザインベースでUIが構築される
     */
    /* MaterialAppインスタンスをreturnすることでマテリアルデザインによる
     * アプリが表示されるようになる。
     * 画面に表示されるウィジェットなどを引数に設定
     */
    return new MaterialApp(
      //アプリのタイトル
      title: 'Flutter Demo',
      //homeに,組み込まれるウィジェットを設定
      /*
       * Scaffoldは「足場」の意。アプリ作成の土台となる。
       * マテリアルデザインの基本的なデザインとレイアウトが組み込まれている。
       * これに必要なウィジェットを追加することで一般的なデザインのアプリが作成される。
       */
      home: Scaffold(
        //アプリケーションバー
        appBar: AppBar(
          title: Text('Hello, Flutter!'),
        ),
        /*
         * body
         * バーの下の空白エリア全体の表示を担当。
         * 実際のアプリの表示はこのbodyに組み込むと考えて良い。
         * 実際の開発では多数のウィジェットを配置するコンテナとしての
         * 働きを持つウィジェットを組み込んで利用することになる。
         */

        body: Text(
          'Hello, Flutter World!',
          style: TextStyle(fontSize: 32.0),
        ),
      )
    );
  }
}