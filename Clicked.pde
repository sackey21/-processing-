    //正解クリック後の処理
    //ランダムでローディングを入れる(ローディング遷移) 
    //何回かやったら終了(Finished遷移)
    //正解のボタン変更(終了時は不要)
    //変更時はランダムでボタンを選んでcollectにかえる
    //回数に行ってなかったらもう一回サーチに戻る
    //ここで書くべきじゃないかもしれんけど，正解カウントにするか時間計測か
public class Clicked{
  
  Clicked(){//コンストラクタ
  
  }
  
  public void run(){
    this.selectStatus();
  }
  private void selectStatus(){
    //ランダムでロードか戻るかを選ぶ
    int select = (int)random(2);
    if(select == 1){
      nowState.toSearch();
      return;
    }
   
   nowState.toLoading();
  }
}
