
public class Pattern6{
   
  SettingGameButtons buttons;
  float phase = 0.0;
  float velocity = 0.2; // 速力度
  float radius = height / 20.0;
  PVector location = new PVector(0, 0);
  long start;
  
  public Pattern6(){
    this.start = 0;
  }
  
  protected void run(){//色形ベース
    if(this.start == 0) start = millis();
    if( millis() - this.start > 300){
      nowState.toSearch();
      this.start = 0;
      return;
    } //<>//
    buttons = new SettingGameButtons();
    buttons.runStatic();
    noFill();
    stroke(0, 0, 0);
    strokeWeight(10);
    arc( mouseX, mouseY, 45, 45, phase, PI*5/8 + phase );
    phase += velocity;    
 }
 
}
