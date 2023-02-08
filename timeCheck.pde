public class TimeCheck{//時間カウント用クラス
//カウントダウンで制限時間内にできるだけ多くのボタンを押す
//ローディングの時は進める(実装が楽な方で)
//イライラを最優先に考える
//プレイ中の右上にこれを表示する 
//スタート時のミリ秒から，今の時間を引いた秒数をいい感じに表示する．
 private long startTime;//スタートした時間の記録．
   final int limit = 20000;//1分間
 TimeCheck(){
   this.startTime = -10;
 }
 
 public void run(){
   if(this.startTime == -10)this.start();
   this.showTime();
   this.isFinish();
 }
 private void showTime(){//表示
  fill(0);
  textSize(30);
  textAlign(LEFT);
  String time = String.format("limit        %d.%d", (((this.limit - (millis() - startTime) ))/ 1000), (((this.limit - (millis() - startTime) ))% 1000));
   text( time ,width*3/5, height/5);
   
  fill(0);
  textSize(30);
  textAlign(LEFT);
   text( String.format("collect   %d" , count),width*3/5, height/6);
 }
 private void start(){
  startTime = millis();
 } 
 
 private void isFinish(){
   if(millis() - startTime > this.limit){ 
     nowState.toFinished();
     this.startTime = 0;
   }
 }
 
}
