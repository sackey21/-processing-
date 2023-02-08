
   //終了時に何個押せたかとスタートへの遷移ボタンを記録して表示できたらいいな～
    

//ローディングの実装は，マウス非表示で図形を載せる．
long t_start;//開始時刻ms
long t_end;//終了時刻ms
float t;//経過時刻s
int count;
Status nowState;//状態
StartButton startButton;//開始用ボタン
SettingGameButtons gameButtons;
Clicked clicked;
Pattern1 test1;
Pattern6 test2;
TimeCheck time;
FinishDisplay finish;
void setup(){
  //画面の初期化
  size(800, 800);
  textSize(32);
  textAlign(CENTER);
  background(color(255,255,255));
  nowState = new Status();//ステータスの初期化
  startButton = new StartButton();
  gameButtons = new SettingGameButtons();
  test1 = new Pattern1();
  test2 = new Pattern6();
  clicked = new Clicked(); 
  time = new TimeCheck();
  finish = new FinishDisplay();
  count = 0;
}

//時間の計測はあとからかんがえる
void draw(){
  cursor();
  smooth();  
  background(color(255, 255, 255));
  size(800, 800);
  //状態判定をDisplayStatusの中でつくる
  if(nowState.isStart()){
    startButton.run();
    count = 0;
  }else if(nowState.isSearch()){
    time.run();
    gameButtons.run();
  }else if(nowState.isClicked()){
    time.run();    
    clicked.run();
    //正解クリック後の処理
    //ランダムでローディングを入れる(ローディング遷移) 
    //何回かやったら終了(Finished遷移)
    //正解のボタン変更(終了時は不要)
    //変更時はランダムでボタンを選んでcollectにかえる
    //回数に行ってなかったらもう一回サーチに戻る
    //ここで書くべきじゃないかもしれんけど，正解カウントにするか時間計測か
  }else if(nowState.isLoading()){
     noCursor();
     time.run();
    //ローディング中でも後ろにボタンたちは表示するようにしたい．
    //アニメーション
    //決まった時間ローディングアニメーションを入れる
    test1.run();
    //ここの詳細は後から詰める
    //完了後は状態をクリックに戻す
  }else if(nowState.isFinished()){
    finish.showResult();
  }
  
}
