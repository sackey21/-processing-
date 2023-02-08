//load画面実装用
//離散的なやつ
//連続した奴
//こいつつかわんかも
abstract public class Loading{
  private float size;//円の直径
  private float positionX;//X座標
  private float positionY;//Y座標
  private int deg1;//始点の回転速度
  private int deg2;//終点の回転速度
  private final int deg1First;//固定
  private final int deg2First;//固定
  private int rotatePositionStart;//始点の角度
  private int rotatePositionEnd;//終点の角度
  
  //始点終点が一定に回るとき
  Loading(float size, float positionX, float positionY, int deg){//ンストラクタ
  //ここでサイズ，色とかのベースを決定しておく
    this.size = size;
    this.positionX = positionX;
    this.positionY = positionY;
    this.deg1 = deg;
    this.deg2 = deg;
    this.deg1First = deg;
    this.deg2First = deg;
    this.rotatePositionStart = -90;
    this.rotatePositionEnd = -90;
  }
 
    //始点終点の回転速度が違うとき
  Loading(float size, float positionX, float positionY, int deg1,int deg2){//コンストラクタ
  //ここでサイズ，色とかのベースを決定しておく
    this.size = size;
    this.positionX = positionX;
    this.positionY = positionY;
    this.deg1 = deg1;
    this.deg2 = deg2;
    this.deg1First = deg1;
    this.deg2First = deg2;
  }
  
  public void run(){
    this.moveLoading();//動かすやつ全般をまとめるやつ
  }//呼び出し用メソッド
   
  abstract protected void moveLoading();//以下のを全部まとめてうごかすやつ
  abstract protected void style();//みため
  abstract protected void rotateAnimation();//回転
  abstract protected void setPosition();//ローディング表示位置
  
  protected float getSize(){
    return this.size;
  }
  
  protected void setPositionX(float positionX){
    this.positionX = positionX;
  }
  
  protected void setPositionY(float positionY){
    this.positionY = positionY;
  }
  
  protected float getPositionX(){
    return this.positionX;
  }
  
  protected float getPositionY(){
    return this.positionY;
  }
  
  protected void setRotatePositionStart(){
    this.rotatePositionStart += (PI/180)* this.deg1;
    if(rotatePositionStart == (PI/180) * 360) deg1 = this.deg1First;
  }
  
  protected void setRotatePositionEnd(){
    this.rotatePositionEnd += (PI/180) * this.deg2;
    if(this.rotatePositionStart == (PI/180) * 360) this.deg2 = this.deg2First;
  }
  
  protected float getRotatePositionStart(){
    return this.rotatePositionStart;
  }
  
  protected float getRotatePositionEnd(){
    return this.rotatePositionEnd;
  }
  
}
