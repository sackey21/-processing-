public abstract class Button {
  //クリックの前状態を保存して，それを判定してリリースにする．
  private int buttonState;
  final int cursorFree = 0;//カーソルが無関係の状態
  final int cursorSet = 1;//カーソルが乗っている状態
  final int pushed = 2;//プッシュ時
  boolean isPushing;
  
  protected float x, y;
  protected float sizeX, sizeY;
  
  protected color baseCol;
  final float corsorFreeBrightness = 1;
  final float corsorSetBrightness = 0.8;
  final float pushedBrightness = 0.6;
  
  String buttonStr;//ボタン上のテキスト 
  
  //コンストラクタ
  public Button(float x, float y, float sizeX, float sizeY, color baseCol, String buttonStr){
    //座標
    this.x = x;
    this.y = y;
    //サイズ
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    //ボタン背景色
    this.baseCol = baseCol;
    //文字
    this.buttonStr = buttonStr;
    this.isPushing = false;
  }
  
  public void run(){//呼び出し
    checkButtonState();//ボタンの状態セット
    display();//基本レイアウト呼び出し
    rogic();//動作
  }
  
  private void display(){//ボタンのレイアウト
    noStroke();
    changeColor();//状態によっての色変更
    rect(this.x - (this.sizeX/2), this.y - (this.sizeY/2), sizeX, sizeY);
    
    textSize(32);
    fill(0);
    textAlign(CENTER);
    text(buttonStr, this.x, this.y - sizeY);

  }
  
  private void changeColor(){//状態判定，それによって色を変更
    if(this.isCursorFree()){
      fill(hue(baseCol), saturation(baseCol), brightness(baseCol)* corsorFreeBrightness);
      return;
    }
    if(this.isCursorSet()){
      strokeWeight(5);
      stroke(hue(baseCol), saturation(baseCol), brightness(baseCol)* pushedBrightness);
      fill(hue(baseCol), saturation(baseCol), brightness(baseCol)* corsorSetBrightness);
      return;
    }
    if(this.isPushed()){
      fill(hue(baseCol), saturation(baseCol), brightness(baseCol)* pushedBrightness);
      return;
    }
    
    return; 
  }
  
  private void checkButtonState(){//ボタンの状態遷移
    //ボタンに含まれる座標を計算
    float buttonRangeSmallX = this.x - (this.sizeX/2);//X座標の最小値
    float buttonRangeMaxX = this.x + (this.sizeX/2);//X座標の最大値
    float buttonRangeSmallY = this.y - (this.sizeY/2);//Y座標の最小値
    float buttonRangeMaxY = this.y + (this.sizeY/2);//Y座標の最大値

    //押し続けられてたら

    if( mouseX >= buttonRangeSmallX && mouseX <= buttonRangeMaxX && mouseY >= buttonRangeSmallY && mouseY <= buttonRangeMaxY ){//もしボタン上にカーソルがあれば
       if(!mousePressed && isPushing){//もしマウスがはなされたら
       //押しっぱなしのときはクリックと扱いを変える
           this.buttonState = this.pushed;
       }else {
       this.buttonState = this.cursorSet;
       }
    }else{
    this.buttonState = this.cursorFree; 
    }
    isPushing = mousePressed;
  }
  
  //ボタンの状態を返す
  public boolean isCursorFree(){
    return this.buttonState == this.cursorFree;
  }
  public boolean isCursorSet(){
    return this.buttonState == this.cursorSet;
  }
  public boolean isPushed(){
    return this.buttonState == this.pushed;
  }
  
  
  
  //ボタンごとのロジック処理
   abstract protected void rogic();
}
