// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hello_rectangle/main.dart';

void main() {
  /**
   * testWidgets関数：引数に説明のテキストとコールバック関数を用意
   * 関数内に実行するテストの内容を記述
   */
  /**
   * WidgetTester：Flutterのウィジェットをテストするためのクラス。
   * この引数で渡されるWidgetTester内から、テストに必要なメソッドなどを呼び出してテストを行う。
   */
  /**
   * 【非同期処理】について
   *  非同期処理：処理に時間がかかる場合、処理に終了を待たずに次の処理へと進む方式のこと
   *  ❶非同期メソッドの定義
   *    メソッド(引数) async {...}
   *  ❷非同期メソッドの呼び出し
   *   方法⑴
   *    Future<?> 変数 = メソッド ();
   *    [Future].then(...);
   *  ・非同期メソッドでは、戻り値にFutureという、将来的な戻り値を予約するためのクラスのインスタンスが返される。
   *  実行時にはまだ処理が完了していない⇨「将来、この戻り値を返します」ということを予約しておくための特殊な値を返す。
   *  Future<String>は、将来Stringの値が返されるということ。
   *  ・非同期の処理が完了し、値が返されると、Futureのthenメソッドが呼び出される。引数は通常、関数になっている。
   *   非同期メソッドの戻り値がその関数に引数として渡される。この引数を使って必要な処理を行う。
   *   方法⑵
   *     await メソッド();
   *    処理を完了するまで待つ、つまり、非同期処理を無理やり同期処理に変える。
   */
  testWidgets('hello_rectangle sample test', (WidgetTester tester) async {
    // ベースとなるウィジェットのインスタンスを作成し、UIを生成させる。
    //この作業が問題なく行えるかチェックする。
    await tester.pumpWidget( new MyApp());
    //一定時間を置いてフレームにトリガーを送る。トリガーを送ることでウィジェットの描画などが行われる。
    await tester.pump();

    /**
     * expect(対象,値)⇨ウィジェットの内容チェックを行う関数
     * 第一引数の対象が、第二引数の値と同じかどうかを確認する。
     * 同じなら通過、異なるならエラー
     * 第一引数に指定する対象はfindメソッドで取得するのが一般的
     */
    /**
     * 例えば、Textウィジェットならfind.text(テキスト)で取り出す
     * find.text('hello')⇨helloと表示されているウィジェットを取り出せる
     * findは、Finderというクラスのインスタンスとして検索したウィジェットの情報を返す
     */
    //findsOneWidgetは、一つのウィジェットが見つかったことを示す定数
    expect(find.text('0'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}
