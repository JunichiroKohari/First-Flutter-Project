// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
/**
 * flutter の操作は、「ウィジェットの操作(pump,test)」と「状態のチェックの組み合わせ(expect)」で行う。
 * ウィジェットは操作する処理を実行し、pumpでトリガーを送ることで、実際に操作したのと同じ状態で再現できる。
 * こうして操作を行い、その結果どのように状態が変化したのかをexpectで確認する、を繰り返す。
 */
/**
 * 主なWidgetTesterの操作メソッド
 * ・テキスト入力 enterText([finder], [String]);
 * ・前のページに戻る pageback();
 * ・トリガーを送る pump();
 * ・ウィジェットを実行する pumpWidget([Widget]);
 * ・ドラッグする drag([finder], [offset]); dragFrom([finder], [offset]);
 * ・長押し longPress([finder]); longPressAt([Offset]);
 * ・タップする tap([finder]); tapAt([Offset]);
 * 
 * Offsetについて Offset([x], [y]); 引数はdouble
 * 位置を扱う際の基本のクラス。縦横の位置を指定してインスタンスを作成して使う。
 */

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
  testWidgets('Counter increments smoke test',
   (WidgetTester tester) async {
    // ベースとなるウィジェットのインスタンスを作成し、UIを生成させる。
    //この作業が問題なく行えるかチェックする。
    await tester.pumpWidget( new MyApp());

    //Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    //Tap the '+' icon and trigger a frame.
    // tester.tapというメソッドでアイコンをタップ。tapは引数で指定したウィジェットをタップする働きをする。そしてpumpでトリガーを送り表示を更新する。これで0だった表示が1に変わる。
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
