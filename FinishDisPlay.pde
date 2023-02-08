public  class FinishDisplay{
  StartButton start = new StartButton(); 
  private  void showResult(){ 
    fill(0);
    textSize(30);
    textAlign(CENTER);
    text( "collect:" + count ,width/2, height/2);
   }
}
