import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JankenPage(),
    );
  }
}

class JankenPage extends StatefulWidget {
  const JankenPage({Key? key}) : super(key: key);

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
//StatefulWidgetは変数を扱える
//変数は@overrideよりも上に書く
//ホットリロードの対象外であるので右上のリロードボタンを押す
String computerHand = '✊';
String myHand = '✋';
String result ='引き分け';

//文字列の変数はStringという型で定義する　最初は小文字で次は大文字

//関数の定義
void selectHnd(String selectHnd) {
  myHand =selectHnd;
  //print(selectHnd);
  generateComputerHand();
  judge();
  setState(() {});
}


void generateComputerHand() {
  final randomNumber = Random().nextInt(3);
  computerHand = randomNumberToHand(randomNumber);
  print(randomNumberToHand(randomNumber));
}

String randomNumberToHand(int randomNumber) {
  switch (randomNumber) {
    case 0:
      return '✊';
    case 1:
      return '✌';
    case 2:
      return '✋';
    default:
      return '✊';
  }
  
}


//  void judge() {
//    if (computerHand == myHand) {
//      result ='引き分け';
//    } else if ( myHand == '✊' && computerHand == '✌') {
//        result = '勝ち';
//    } else if ( myHand == '✌' && computerHand == '✋') {
//        result = '勝ち';
//    } else if ( myHand == '✋' && computerHand == '✊') {
//        result = '勝ち';
//    }
//  }
 void judge() {
   if (computerHand == myHand) {
     result ='引き分け';
   } else if ( myHand == '✊' && computerHand == '✌'||
       myHand == '✌' && computerHand == '✋'||
       myHand == '✋' && computerHand == '✊') {
       result = '勝ち';
   }else {
    result = '負け';
   }
 }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('じゃんけん'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,//縦のcenerに縦並び
          children: [
            Text(
              result,
              style: TextStyle(
                fontSize: 50,
              ),
              ),
              SizedBox(
                height: 40
                ,
              ),
              CircleAvatar(
                radius: 80,
                backgroundImage://　アイコンを変更　//URLの画像に設定
                NetworkImage('https://pbs.twimg.com/media/Fah55h5agAADfhX?format=jpg&name=large'),
                
              ),
              SizedBox(
                height: 30
                ,
              ),
            Text(
              computerHand,
              style: TextStyle(
                fontSize: 50,
              ),
              ),
              SizedBox(
                height: 60
                ,
              ),
            Text(
              myHand,
              style: TextStyle(
                fontSize: 60,
              ),
              ),
              SizedBox(
                height: 50,//columとRawの間に隙間を取る
              ),
            Row(//横並び
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,//等間隔に中央揃え
              children: [
                ElevatedButton(
                  onPressed: (){
                    selectHnd('✊');
                    // myHand ='✊';//変数に代入
                    // print('✊');
                    // setState(() {});//画面上で変数の変更を表示させる
                  },
                  child: Text('✊'),
                ),
                            ElevatedButton(
                  onPressed: (){
                    selectHnd('✌');
                    // myHand ='✌';
                    // print('✌');
                    // setState(() {});
                  },
                  child: Text('✌'),
                ),
                            ElevatedButton(
                  onPressed: (){
                    selectHnd('✋');
                    // myHand ='✋';
                    // print('✋');
                    // setState(() {});
                  },
                  child: Text('✋'),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}