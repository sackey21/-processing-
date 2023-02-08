//カーソル上に表示されるアニメーション
//継承先では，スタイルを指定するだけでよくする．
//1と6を実装する
abstract class corsorLoading extends Loading{
  
  corsorLoading(){
    super(10, mouseX, mouseY, 10, 20);
  }
  @Override
  abstract protected void style();//色形ベース
  
  protected void moveLoading(){//
    noCursor();
    //判定を1とかにして，ウィンドウ内で判定できるようにする
    if(width >= this.getPositionX() && 0 <=this.getPositionX() && height >= this.getPositionY() && 0 <=this.getPositionY()){
      this.setPosition();
      this.rotateAnimation();
      this.style();
    }
  }
  
  protected void setPosition(){
      this.setPositionX(mouseX);
      this.setPositionY(mouseY);
  }
  
  protected void rotateAnimation(){//回転させるやつ
    this.setRotatePositionStart();
    this.setRotatePositionEnd();
  };
  
}
