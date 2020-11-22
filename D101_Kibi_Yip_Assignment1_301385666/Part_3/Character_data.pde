color hoodie_B=color (0,40,75);
color dress= color(65,71,81);
color legs= color(105,99,91);
color legs_B= color(34,37,41);
color skin= color(255,233,203);
color hair= color (51,52,56);
color hair_B=color(143,162,164);
color hair_highlight=color(29,214,233);
color iris_P=color(235,100,159);
color iris= color(142,232,237);
color headphone= color(30,30,30);
color headphone_neon_B= color(0,184,255,150);
color hoodie_random= color(random(255),random(255),random(255));
color mask_B=color(6,57,74);
color mask=color(240,243,237);

//variables

float arm_swing_rate=0.3/8;
float arm_swing_angle=-20;
float Blink_rate=0.1/8;
float Blink_time=0;
float Blink_Ylocation=0;
float Hair_movement_angle=0;
float Hair_movement_rate=0.1/8;
float Breathing_Animation_time=0;
float Breathing_Animation_rate=0.1/8;
float Breathing_Animation_Arm_Ylocation=5;
float Breathing_Animation_body_scale=1;
float Breathing_Animation_head_Ylocation=-30;
float Walking_animation_leg_rotation_control=0;
float Walking_animation_leg_rotation=0;
float Walking_animation_leg_rotation_rate=0.5/8;
float Walking_animation_distant=2;
//float Colour_change_control=0;
float char_x= 400;


void color_change_character(){
  hoodie_random= color(random(255),random(255),random(255));
}

void drawCharacter(float x, int y, float scale, float rotation){

  ellipseMode(CENTER);
  stroke(0);
  strokeWeight(1);
  pushMatrix();
  if(scale==1&&rotation==0&&x==400)  translate(char_x,y);
    
  else{
    translate(x,y);
  }
  if(scale==1&&rotation==0)
    {Walking_animation_leg_rotation_control=1;
    }

  rotate(radians(rotation));
  scale(scale);
  //controlled walking animation
  if (Walking_animation_leg_rotation<-5 ||Walking_animation_leg_rotation>5)  Walking_animation_leg_rotation_rate*=-1;

   if(mousePressed && mouseButton==LEFT&&rotation==0&&scale==1&&mouseX<char_x&&Walking_animation_leg_rotation_control==1){
       char_x = char_x - Walking_animation_distant;
     }    
    else if (mousePressed && mouseButton==LEFT&&rotation==0&&scale==1&&mouseX>char_x&&Walking_animation_leg_rotation_control==1){
      char_x= char_x +Walking_animation_distant;
      }
     
  //legs_R 

  pushMatrix(); 
  translate(10,40);
  //walk_leg_animation
    if(mousePressed && mouseButton==LEFT&&Walking_animation_leg_rotation_control==1){
    Walking_animation_leg_rotation+=Walking_animation_leg_rotation_rate;
       rotate(radians(Walking_animation_leg_rotation));}
   
  if(scale==1&&rotation==0&&x==400)  {fill(legs_B);}
  
  else  fill(legs); 
  
  rect(-5,0,10,35); 
  popMatrix();
  
  //legs_L
  pushMatrix();
  translate(-10,40);
  //walk_leg_animation
 if(mousePressed && mouseButton==LEFT&&Walking_animation_leg_rotation_control==1){
    Walking_animation_leg_rotation+=Walking_animation_leg_rotation_rate;
       rotate(radians(-Walking_animation_leg_rotation));}
    
  if(scale==1&&rotation==0&&x==400)  {fill(legs_B);}
  
  else  fill(legs); 
  rect(-5,0,10,35); 
  popMatrix();

  //hair_back
  pushMatrix();
  translate(0,-30);
  rotate(radians(Hair_movement_angle));
  Hair_movement_angle = Hair_movement_angle+Hair_movement_rate;
  if (Hair_movement_angle>5 ||Hair_movement_angle<-5) Hair_movement_rate*=-1;
  
  if(scale==1&&rotation==0&&x==400)  {fill(hair_B);}
  
  else  fill(hair);
  
  beginShape();
  vertex(0,0);
  vertex(-30,10);
  vertex(-30,70);
  vertex(30,70);
  vertex(30,10);
  endShape(CLOSE);
  if(scale==1&&rotation==0&&x==400)  {
  stroke(hair_highlight);
  strokeWeight(3);
  line(-20,10,-20,68);
  stroke(0);
  strokeWeight(1);
  }
  
  popMatrix();
  
  //dress
   fill(dress);
  triangle(0,-10,20,50,-20,50);
  
  
  //body
  pushMatrix();
  translate(0,0);
  scale(Breathing_Animation_body_scale);
  Breathing_Animation_body_scale = Breathing_Animation_body_scale+  Breathing_Animation_rate/200;
  if(scale==1&&rotation==0&&x==400)  fill(hoodie_B);
    
  else  fill(hoodie_random);
  triangle(0,-20,20,40,-20,40);
  line(-6,30,6,30);
  curve(-10,20,-6,30,-10,40,-15,50);
  curve(10,20,6,30,10,40,15,50);
  
  popMatrix();
  
  
  
  //Arms_R
  pushMatrix();
  
  translate(9,Breathing_Animation_Arm_Ylocation);
  
  Breathing_Animation_time= Breathing_Animation_time +Breathing_Animation_rate;
  if (Breathing_Animation_time<0 || Breathing_Animation_time>6)  Breathing_Animation_rate *=-1;
  
  if (Breathing_Animation_time>2&&Breathing_Animation_time<4) Breathing_Animation_Arm_Ylocation= Breathing_Animation_Arm_Ylocation +-Breathing_Animation_rate;
 
  rotate(radians(arm_swing_angle));
  arm_swing_angle= arm_swing_angle +arm_swing_rate;
  if (arm_swing_angle>-20||arm_swing_angle<-30)  arm_swing_rate*=-1;
 
  
  fill(skin);
  ellipse(0,30,10,10);
  if(scale==1&&rotation==0&&x==400)  fill(hoodie_B);
    
  else  fill(hoodie_random);
  triangle(0,0,5,30,-5,30);
  
  popMatrix();
  
  //Arms_L
  pushMatrix();
  
  translate(-9,Breathing_Animation_Arm_Ylocation);
  rotate(radians(-arm_swing_angle));
  fill(skin);
  ellipse(0,30,10,10);
  if(scale==1&&rotation==0&&x==400)  fill(hoodie_B);
    
  else  fill(hoodie_random);
  triangle(0,0,5,30,-5,30);
  
  popMatrix();
  
  
  //head
  pushMatrix();
  translate(0,Breathing_Animation_head_Ylocation);
  Breathing_Animation_head_Ylocation= Breathing_Animation_head_Ylocation+ Breathing_Animation_rate/5;
  
  //headphone
  noFill();
  stroke(headphone);
  strokeWeight(4);
  arc(0,0,70,70,radians(180),radians(360));

  
  fill(headphone);
  rect(-40,-15,20,30);
  rect(40,-15,-20,30);
  strokeWeight(5);
  stroke(headphone_neon_B);
  
  line(-35,-15,-35,15);
  line(35,-15,35,15);
  
  strokeWeight(3);
  stroke(255);
  line(-35,-15,-35,15);
  line(35,-15,35,15);
  
  strokeWeight(1);
  stroke(0);
  
  
   //face
  fill(skin);
  ellipse(0,0,60,60);
  
  //eye
  noStroke();
  fill(255);
  arc(15,0,20,20,radians(0),radians(180));
  stroke(0);
  
  // iris

  pushMatrix();
  float eye_movemoent_Xlocation=15;
  float eye_movemoent_Ylocation=0;
  if (mouseX<x+15) eye_movemoent_Xlocation = map(mouseX,0,x+15,10,15);
  else if (mouseX>x+15) eye_movemoent_Xlocation = map(mouseX,x+15,width,15,20);
  
  translate(eye_movemoent_Xlocation,eye_movemoent_Ylocation);

  
 if(scale==1&&rotation==0&&x==400)  fill(iris_P);
    
  else  fill(iris);
  ellipse(0,0,10,13);
  fill(0);
  ellipse(0,0,5,5);
  fill(255);
  ellipse(3,2,3,3);
  popMatrix();
  
  //eye_lid
  pushMatrix();
  translate(15,Blink_Ylocation);
  Blink_time= Blink_time+Blink_rate;
  if (Blink_time <0|| Blink_time>30)  Blink_rate*=-1;
  if (Blink_time >=10&&Blink_time<=11)  Blink_Ylocation =10;
  else Blink_Ylocation=0;
  
  
  fill(skin);
  noStroke();
  rect(-10,0,20,-17);
  //arc(0,0,20,20,radians(-180),radians(0));
  stroke(0);
  strokeWeight(2);
  line(-10,0,10,0);
  strokeWeight(1);
  popMatrix();
  
  //Mask
  if(scale==1&&rotation==0&&x==400)  fill(mask_B);
    
  else  fill(mask);
  noStroke();
  rect(-20,10,40,13);
  arc(0,20,40,20,radians(0),radians(180));
  noFill();
  stroke(0);
  //line for mask
  line(-20,10,20,10);
  line(-20,10,-20,20);
  line(20,10,20,20);
  arc(0,20,40,20,radians(0),radians(180));
  line(-20,10,-30,5);
  line(20,10,30,5);
  strokeWeight(4);
  if(scale==1&&rotation==0&&x==400)  stroke(0,255,255);
  line(-7,15,7,25);
  line(7,15,-7,25);
  
  
  strokeWeight(1);
  stroke(0);
  //hair
  if(scale==1&&rotation==0&&x==400)  fill(hair_B);
    
  else  fill(hair);
  arc(0,0,60,60,radians(150),radians(330));
  arc(0,0,60,60,radians(240),radians(360),OPEN);
  if(scale==1&&rotation==0&&x==400)  {
  stroke(hair_highlight);
  strokeWeight(3);
  curve(0,20,15,-20,-25,12,20,20);
  curve(50,10,10,-25,-25,12,20,20);
  stroke(1);
  strokeWeight(1);
  }
  
  
  popMatrix();//for head
  
  popMatrix();
}
