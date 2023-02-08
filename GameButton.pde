//ゲーム時に表示するボタンのロジック実装
//ボタン単体なので，まとめて表示するときにはリストにする必要あり
//スタイルは決定しているので，リストを作って位置関係整理してよびだしてもらう
public class GameButton extends Button{
  private boolean collect;//ボタンが正解か否か
  GameButton(float x, float y){//初期位置
    super( x, y, 100, 100,  color(50), "");
    this.collect = false; 
  }
  
  @Override
  protected void rogic(){
    //ゲームのボタン押された時の挙動
    if(this.isPushed()){
      //もし正解なら
      if(this.collect){
        count ++;
      //不正解に変えておく
        this.setInCollect(); //<>// //<>//
        nowState.toClicked();
      }
     
    }
  }
  
  //ボタンを正解に変更
  public void setCollect(){
    this.collect = true;
  }
  
  //ボタンを不正解に変更
  public void setInCollect(){
    this.collect = false;
  }
  
  //ボタンが正解か否か
  public boolean isCollect(){
    return this.collect;
  }
  
  //正解のボタンになっているなら，色をかえる．
  protected void setBaseColor(int col){//背景色変更
    this.baseCol = col;
  }
    
}
