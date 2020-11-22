void mouseClicked(){
  if( mouseButton ==RIGHT){
  R_sign_color_control+=1;
  color_change_character();
     }
}

void setup(){
 size(800,550); 
 
}
void draw(){
  drawBackground();
  
  drawCharacter(670,450-65,0.9,1);
  drawCharacter(180,450-60,0.8,4);
  drawCharacter(110,450-50,0.7,-2);
  drawCharacter(550,450-90,1.2,2);
  drawCharacter(width/2,450-75,1,0);
  drawCharacter(260,450-80,1.1,180);
  drawCharacter(450,450-35,0.5,-5);
  drawCharacter(345,450-30,0.4,-1);
  
  drawTopLayer();
  
}
