
public class Pattern1{
  
  SettingGameButtons buttons;
  float phase = 0.0;
  float velocity = 8.0; // 速力度
  float radius = height / 25.0;
  PVector location = new PVector(0, 0);
  long start;
  
  public Pattern1(){
    this.start = 0;
  }
  
  protected void run(){//色形ベース
  if(this.start == 0) start = millis();
  if(millis() - this.start > 2000){
    nowState.toSearch();
    this.start = 0;
    return;
  }
  buttons = new SettingGameButtons();
  buttons.runStatic();
  circles();
  
 }
 
 private void circles(){
  phase += velocity;    
  translate(mouseX, mouseY);
  this.circle(0, 0);
  this.circle(2*PI/8,100);
  this.circle(4*PI/8,200);
  this.circle(6*PI/8,230);
  this.circle(8*PI/8,255);
  this.circle(10*PI/8,230);
  this.circle(12*PI/8, 200);
  this.circle(14*PI/8,100);
 }
 
 protected void circle(float rad, int col){
  noStroke(); 
  location.x = cos(radians(phase) + rad) * radius;
  location.y = sin(radians(phase) +rad) * radius;
  fill(col,col, col);
  ellipse(location.x, location.y, 15, 15);
 }
}
