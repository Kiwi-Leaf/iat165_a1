/*Notes as at 9/9/2019:
Create animation for light emitting objects
Create animation for clouds
Add aesthetic element such as trash, graffiti,etc

*/
//Variables
float a= 0;
float an=0.2;
float star_rotate=0;
float star_rotate_rate= 0.005;
float star_light=1;
float star_light_Alpha= 75;
float star_light_Alpha_rate=1;
float L_neon_light_Alpha=150;
float L_neon_Light_Flickering= 1;
float L_neon_Light_Flickering_rate= 1;
float R_sign_color_control= 0;
float bin_animation_Yaxis=390;
float bin_animation_rate=0.1;
float bin_animation_time=0;



//color library

color BG_B_Building = color(134,147,157);
color BG_F_Building = color(110,121,130);
color Cloud= color(255,196,251,150);
color Sky1= color(73,47,122);
color Sky2= color(92,45,122);
color Sky3= color(117,42,120);
color Sky4= color(153,36,118);
color Sky5= color(173,33,117);
color Star = color(255,255,144,180);
color Star_Light= color(249,255,157,star_light_Alpha);
color Midground = color(60,78,101);
color Door_way= color(77,72,74);
color FG_Building = color(48,77,120);
color FG_Sign_L = color(8,64,79);
color FG_Sign_R_P =color(213,66,130);
color FG_Sign_R_G =color(11,127,144);
color FG_Sign_R_B =color(11,82,146);
color FG_Floor = color(9,25,51);
color FG_Window= color(106,150,185);
color MG_Sky_P = color (247,109,194,20);
color MG_Sky_G= color (0,255,159,20);
color MG_Sky_B= color (0,184,255,20);
color bin=color(119,124,126);

//for strokes
color S_sign= color (50,51,54);
color FG_Sign_L_Neon_B= color(11,189,199,150);
color FG_Sign_L_Neon_R=color(201,29,27,150);
color FG_Sign_R_Neon_P= color(247,109,194,150);
color FG_Sign_R_Neon_G= color(0,255,159,150);
color FG_Sign_R_Neon_B= color(0,184,255,150);
color FG_Sign_R_Neon_Center_Y= color(255,240,2,150);
color FG_Sign_R_Neon_Center_Pur= color(190,0,255,150);
color White_Light= color(255);
color Door_frame= color(211,219,220);


void setup(){
  size(800,520);
  
}
void mouseClicked(){
  if( mouseButton ==RIGHT)R_sign_color_control+=1;
     }
void draw(){
  background(50,50,124);
  noStroke();
  ellipseMode(CORNER);
  
  //sky
  
  //skycolour
  fill(Sky1);
  rect(0,50,800,50);
  fill(Sky2);
  rect(0,100,800,50);
  fill(Sky3);
  rect(0,150,800,50);
  fill(Sky4);
  rect(0,200,800,50);
  fill(Sky5);
  rect(0,250,800,50);
  
  
  pushMatrix();
  
  //clouds
  translate(a,0);
  a= a + an;
  if( a<0 ||a>50)  an*=-1;
      
  fill(Cloud);
  ellipse(200,20,90,25);
  ellipse(50,30,140,30);
  ellipse(250,25,150,25);
  ellipse(450,20,180,20);
  ellipse(540,30,200,25);
  popMatrix();
  
  //stars
  pushMatrix();
  fill(Star);
  translate(500,30);
  rotate(-star_rotate);
  star_rotate+= star_rotate_rate;
  triangle(0,-10,-10,5,10,5);
  triangle(0,10,-10,-5,10,-5);
  //triangle(500,20,490,35,510,35);
  //triangle(500,40,490,25,510,25);
  popMatrix();
  
  pushMatrix();
  translate(420,50);
  rotate(star_rotate);
  star_rotate+= star_rotate_rate;
  triangle(0,-10,-10,5,10,5);
  triangle(0,10,-10,-5,10,-5);
  //triangle(420,40,410,55,430,55);
  //triangle(420,60,410,45,430,45);
  popMatrix();
  
  //star light
  fill(249,255,157,star_light_Alpha);
  ellipseMode(CENTER);
  ellipse(420,50,50,50);
  ellipse(420,50,40,40);
  ellipse(420,50,30,30);
  ellipse(420,50,20,20);
  
  ellipse(500,30,40,40);
  ellipse(500,30,30,30);
  ellipse(500,30,20,20);
  ellipse(500,30,10,10);
  star_light_Alpha = star_light_Alpha + star_light_Alpha_rate;
  if (star_light_Alpha<10 || star_light_Alpha>100)  star_light_Alpha_rate*=-1;
  ellipseMode(CORNER);
  
  //BG_back building(L to R)
  fill(BG_B_Building);
  rect(200,100,50,200);
  rect(290,30,80,300);
  rect(405,65,60,300);
  rect(500,70,60,300);
  rect(600,40,70,300);
  
  
  //BG_front building(L to R)
  fill(BG_F_Building);
  rect(100,40,100,300);
  rect(250,65,50,300);
  rect(320,50,80,300);
  rect(420,90,70,300);
  rect(550,60,80,300);
  rect(660,50,75,300);

  //Midground_sky
  if (R_sign_color_control>= 3) R_sign_color_control =0;
     else if (R_sign_color_control==0||R_sign_color_control==3)  fill(MG_Sky_P);
     else if (R_sign_color_control==1)  fill(MG_Sky_G);
     else if (R_sign_color_control==2)  fill(MG_Sky_B);
  
  rect(0,0,800,800);
  rect(0,50,800,800);
  rect(0,100,800,800);
  rect(0,150,800,800);
  rect(0,200,800,800);
  rect(0,250,800,800);
  
  
  //Midground
  fill(Midground);
  rect(0,300,800,350);

  
  //bin
  pushMatrix();
  ellipseMode(CENTER);
  translate(615,bin_animation_Yaxis);
  bin_animation_time =  bin_animation_time + bin_animation_rate;
  if (bin_animation_time <0|| bin_animation_time >40) bin_animation_rate *=-1;
  if (bin_animation_time >10&& bin_animation_time<30) bin_animation_Yaxis +=bin_animation_rate;
  
    //cat
  fill(0);
  ellipse(0,0,30,20);
  triangle(-2,0,-15,-18,-15,0);
  triangle(2,0,15,-18,15,0);
  
  fill(bin);
  rect(-25,-16,50,-8);
  rect(-5,-24,10,-4);
  stroke(255);
  strokeWeight(3);
  point(5,-2);
  point(-5,-2);
  strokeWeight(2);
  line(-18,1,-10,1);
  line(-17,-1,-10,0);
  line(-17,3,-10,2);
  line(18,1,10,1);
  line(17,-1,10,0);
  line(17,3,10,2);  
  noStroke();
  popMatrix();
  
  fill(bin);
  quad(630,450,600,450,590,400,640,400);
  ellipseMode(CENTER);
  fill(0);
  ellipse(600,400,10,10);
  ellipse(630,400,10,10);
  ellipseMode(CORNER);
 
  //Foreground_Building
  // Sign support
  strokeWeight(30);
  stroke(S_sign);
  line(160,170,180,170);
  strokeWeight(20);
  line(500,205,660,205);
  noStroke();
  
  //Building body_int
  fill(Door_way);
  rect(0,0,160,600);
  rect(650,0,200,600);
  fill(FG_Building);
  rect(120,0,40,600);
  rect(650,0,40,600);
  //door frame
  stroke(Door_frame);
  strokeWeight(20);
  line(120,300,120,450);
  line(690,300,690,690);
  noStroke();
  
 
  
  
  
  //Foreground_signs_L
  fill(FG_Sign_L);
  rect(180,0,135,250,10);
  
   //Foreground_signs_R
   //BackLight
    noFill();
    stroke(255,20);
    strokeWeight(20);
    ellipse(470,130,150,150);
    strokeWeight(30);
    ellipse(470,130,150,150);
    noStroke();
    
    
     if (R_sign_color_control>= 3) R_sign_color_control =0;
     else if (R_sign_color_control==0)  fill(FG_Sign_R_P);
     else if (R_sign_color_control==1)  fill(FG_Sign_R_G);
     else if (R_sign_color_control==2)  fill(FG_Sign_R_B);
  

  
  ellipse(470,130,150,150);
    
  //Sign decor
  //L
  //Neon_Frame
  noFill();
  stroke(FG_Sign_L_Neon_B);
  strokeWeight(15);
  line(200,0,200,220);
  line(200,230,295,230);
  line(295,220,295,0);
  
  //Neon_Words
  //"E-"
  stroke(FG_Sign_L_Neon_R);
  curve(195,0,235,10,215,50,155,30);
  line(230,45,230,85);
  line(245,15,275,15);
  line(275,15,275,50);
  line(240,32,280,32);
  line(245,50,275,50);
  curve(255,10,260,15,250,85,215,65);
  
  //"-den"
  //Sign_Light_Animation_Flickering
  
  stroke(201,29,27,L_neon_light_Alpha);
  L_neon_Light_Flickering= L_neon_Light_Flickering+ L_neon_Light_Flickering_rate;
  if (L_neon_Light_Flickering<0 || L_neon_Light_Flickering>200)  L_neon_Light_Flickering_rate*=-1;
  if (L_neon_Light_Flickering<=20 && L_neon_Light_Flickering>=15) L_neon_light_Alpha=0;
  else if(L_neon_Light_Flickering ==31|| L_neon_Light_Flickering==33||L_neon_Light_Flickering==36)  L_neon_light_Alpha=0;
  else L_neon_light_Alpha=150;
  
  curve(190,100,235,110,215,150,190,120);
  line(234,130,275,130);
  curve(260,140,275,130,275,200,265,190);
  line(275,200,260,190);
  rect(235,150,25,25,ROUND);
  line(235,162,260,162);
  line(247,150,247,175);

noStroke();
noFill();

  //R_Sign
  if (R_sign_color_control>= 3) R_sign_color_control =0;
     else if (R_sign_color_control==0)  stroke(FG_Sign_R_Neon_P);
     else if (R_sign_color_control==1)  stroke(FG_Sign_R_Neon_G);
     else if (R_sign_color_control==2)  stroke(FG_Sign_R_Neon_B);
  strokeWeight(14);
  ellipseMode(CENTER);
  arc(545,205,130,130,radians(10),radians(170));
  arc(545,205,130,130,radians(190),radians(350));
  ellipseMode(CORNER);
  
  stroke(FG_Sign_R_Neon_Center_Y);
  quad(505,170,585,170,585,240,505,240);
  stroke(FG_Sign_R_Neon_Center_Pur);
  quad(545,245,545,165,585,205,505,205);
  

  
  
  
  
  //White light
  //L_ Frame
  stroke(White_Light);
  strokeWeight(6);
  line(200,0,200,220);
  line(200,230,295,230);
  line(295,220,295,0);
  
  //Words
  //rect(180,0,135,250)
  //"E-"
  curve(195,0,235,10,215,50,155,30);
  line(230,45,230,85);
  line(245,15,275,15);
  line(275,15,275,50);
  line(240,32,280,32);
  line(245,50,275,50);
  curve(255,10,260,15,250,85,215,65);
  
  
  //"-den"
  if (L_neon_Light_Flickering<=20 && L_neon_Light_Flickering>=15) stroke(0);
  else if(L_neon_Light_Flickering ==31|| L_neon_Light_Flickering==33||L_neon_Light_Flickering==36)  stroke(0);
  else stroke(255);
  curve(190,100,235,110,215,150,190,120);
  line(234,130,275,130);
  curve(260,140,275,130,275,200,265,190);
  line(275,200,260,190);
  rect(235,150,25,25,ROUND);
  line(235,162,260,162);
  line(247,150,247,175);

 //R_Sign
 stroke(White_Light);
 strokeWeight(7);
 ellipseMode(CENTER);
 arc(545,205,130,130,radians(10),radians(170));
 arc(545,205,130,130,radians(190),radians(350));
 ellipseMode(CORNER);
 
 
 quad(545,245,545,165,585,205,505,205);

 quad(505,170,585,170,585,240,505,240);
 //line(505,170,585,170);
 //line(585,240,505,240);
 noStroke();


 //Top Layer_ Building
  fill(FG_Building);
  //L
  rect(0,0,120,300);
  rect(0,0,30,450);
  
  //R
  rect(690,0,600,300);
  rect(780,0,600,450);
  
  //Door frame
  //L
  stroke(Door_frame);
  strokeWeight(20);
  line(30,300,30,450);
  line(30,300,120,300);
  //R
  line(780,300,780,690);
  line(690,300,780,300);
  noStroke();
  
//Building Window
 noStroke();
  //L
  fill(FG_Window);
  rect(0,10,70,70,3);
  rect(80,10,70,70,3);
  rect(0,90,70,70,3);
  rect(80,90,70,70,3);
  rect(0,170,70,70,3);
  rect(80,170,70,70,3);
  
  //R
  rect(660,10,70,70);
  rect(740,10,70,70);
  rect(660,90,70,70);
  rect(740,90,70,70);
  rect(660,170,70,70);
  rect(740,170,70,70);
  
 
  
  
  noStroke();
  //Foreground_Floor
  fill(FG_Floor);
  rect(0,450,800,300);
  
}
