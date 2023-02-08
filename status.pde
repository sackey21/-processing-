//状態遷移
//状態判定メソッドと，状態遷移メソッドだけほりこんでる
class Status{
  final int start = 0;//開始画面
  final int search = 1;//プレイ中
  final int clicked = 2;//ボタンクリック時
  final int loading = 3;//ローディングアニメーション
  final int finished = 4;//完了
  private int state;
  
  public int getStatus(){
    return this.state;
  }
  public Status(){//初期化
    this.state = this.start;
  }
  //状態遷移メソッド
  void toStart(){
     this.state = this.start;
  }
  void toSearch(){
    this.state = this.search;
  }
  void toClicked(){
    this.state = this.clicked;
  }
  void toLoading(){
    this.state = this.loading;
  }
  void toFinished(){
    this.state = this.finished;
  }
  //判定処理//
  public boolean isStart(){
    return this.state == this.start;
  }
  
  public boolean isSearch()
  {
    return this.state == this.search;
  }
  
  public boolean isClicked(){
    return this.state == this.clicked;
  }
  public boolean isLoading(){
    return this.state == this.loading;
  }
  public boolean isFinished(){
    return this.state == this.finished;
  }  
  //
}
