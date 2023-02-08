//スタート用ボタン
//プレイ画面に遷移する．
public class StartButton extends Button{
  StartButton(){
    super(width/2, height/2, 100, 100, color(1020), "start");
  }
  
  @Override
  protected void rogic(){
    //スタートボタン押された時の挙動
    //プレイ画面に遷移する．
    if(this.isPushed())nowState.toSearch();//プレイ画面に遷移
  }
}
