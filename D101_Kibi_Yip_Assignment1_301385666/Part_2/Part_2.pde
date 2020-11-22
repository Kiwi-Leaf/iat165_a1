color hoodie_B=color (92,120,169);
color dress= color(67,64,64);
color legs= color(105,99,91);
color skin= color(255,225,199);
color hair= color (51,52,56);
color iris= color(211,173,212);
color headphone= color(30,30,30);
color headphone_neon_B= color(0,184,255,150);

//variables


float arm_swing_rate=0.3;
float arm_swing_angle=-20;
float Blink_rate=0.1;
float Blink_time=0;
float Blink_Ylocation=0;
float Hair_movement_angle=0;
float Hair_movement_rate=0.1;
float Breathing_Animation_time=0;
float Breathing_Animation_rate=0.1;
float Breathing_Animation_Arm_Ylocation=5;
float Breathing_Animation_body_scale=1;
float Breathing_Animation_head_Ylocation=-30;


void setup(){
 size(800,520); 

}

void draw(){
  background(255);
  ellipseMode(CENTER);
  stroke(0);
  strokeWeight(1);
  pushMatrix();
  translate(width/2,height/2);
  float all_rotation_angle= map(mouseX,0,width,-45,45);
  float all_scale= map(mouseY,0,height,0.5,2);
  rotate(radians(all_rotation_angle));
  scale(all_scale);
  
  
  
  //legs_R 
  pushMatrix(); 
  translate(10,40);
  fill(legs);
  rect(-5,0,10,35); 
  popMatrix();
  
  //legs_L
  pushMatrix();
  translate(-10,40);
  fill(legs);
  rect(-5,0,10,35); 
  popMatrix();


  //hair_back
  pushMatrix();
  translate(0,-30);
  rotate(radians(Hair_movement_angle));
  Hair_movement_angle = Hair_movement_angle+Hair_movement_rate;
  if (Hair_movement_angle>5 ||Hair_movement_angle<-5) Hair_movement_rate*=-1;
  
  fill(hair);
  //rect(-30,0,60,70);
  beginShape();
  vertex(0,0);
  vertex(-30,10);
  vertex(-30,70);
  vertex(30,70);
  vertex(30,10);
  endShape(CLOSE);
  
  
  popMatrix();
  
  //dress
  fill(dress);
  triangle(0,-10,20,50,-20,50);
  
  
  //body
  pushMatrix();
  translate(0,0);
  scale(Breathing_Animation_body_scale);
  Breathing_Animation_body_scale = Breathing_Animation_body_scale+  Breathing_Animation_rate/200;
  fill(hoodie_B);
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
  fill(hoodie_B);
  triangle(0,0,5,30,-5,30);
  
  popMatrix();
  
  //Arms_L
  pushMatrix();
  
  translate(-9,Breathing_Animation_Arm_Ylocation);
  rotate(radians(-arm_swing_angle));
  fill(skin);
  ellipse(0,30,10,10);
  fill(hoodie_B);
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
   eye_movemoent_Xlocation = map(mouseX,0,width,10,20);
  translate(eye_movemoent_Xlocation,eye_movemoent_Ylocation);
  fill(iris);
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
  fill(255);
  noStroke();
  rect(-20,10,40,10);
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
  line(-7,15,7,25);
  line(7,15,-7,25);
  
  strokeWeight(1);
  
  //hair
  fill(hair);
  arc(0,0,60,60,radians(150),radians(330));
  arc(0,0,60,60,radians(240),radians(360),OPEN);
  
  
  
  
  popMatrix();//for head
  
  popMatrix();
}
