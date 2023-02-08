//ボタンをリストで管理
public class SettingGameButtons{
   private ArrayList<GameButton> Buttons;
   SettingGameButtons(){//コンストラクタ
   //リストの初期化
   Buttons = new ArrayList<GameButton>();
   //リストに要素ほりこむ(座標設定)
   Buttons.add(new GameButton(width/3 * 2 , height/3));//上段右
   Buttons.add(new GameButton(width/2 , height/3));//上段中央
   Buttons.add(new GameButton(width/3 , height/3));//上段左
   Buttons.add(new GameButton(width/3 * 2 , height/2));//中央右
   Buttons.add(new GameButton(width/2 , height/2));//センター
   Buttons.add(new GameButton(width/3 , height/2));//中央左
   Buttons.add(new GameButton(width/3 * 2, height/3 * 2));//下段右
   Buttons.add(new GameButton(width/2 , height/3 * 2));//下段中央
   Buttons.add(new GameButton(width/3 , height/3 * 2));//下段左
   }
   
   public void run(){//呼び出し
   //もしリストの中に正解がいなかったら
   if(!this.existCollect()) setCollectButton();
    Buttons.get(0).run();
    Buttons.get(1).run();
    Buttons.get(2).run();
    Buttons.get(3).run();
    Buttons.get(4).run();
    Buttons.get(5).run();
    Buttons.get(6).run();
    Buttons.get(7).run();
    Buttons.get(8).run();
   }
   public void runStatic(){//ローディング用の呼び出し
     for(int i=0;i<Buttons.size();i++){
       Buttons.get(i).setBaseColor(245);
     }
    Buttons.get(0).run();
    Buttons.get(1).run();
    Buttons.get(2).run();
    Buttons.get(3).run();
    Buttons.get(4).run();
    Buttons.get(5).run();
    Buttons.get(6).run();
    Buttons.get(7).run();
    Buttons.get(8).run();
   }
   //正解いるかいないか判定
   private boolean existCollect(){
     for(GameButton Button : this.Buttons){
       if(Button.isCollect()) return true;
     }
     return false;
   }
   
   //正解ボタン設定(ランダム)
   private void setCollectButton(){
     
     int index = (int)random(9);
     Buttons.get(index).setCollect();
     for(int i=0;i<Buttons.size();i++){
       if(index == i)Buttons.get(i).setBaseColor(50);
       else Buttons.get(i).setBaseColor(245);
     }
   }
   
}
