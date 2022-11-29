/////Meditating Fish Zen Master/////
/*
Sept 15th 2019
 GAME 12805 Programming for Game Designers 1: Fundamentals
 Instructor: Blair Leggett
 Created by: Rui Fang
 
 The time of the day is controlled by the up and down movement of the mouse,
 The cloud is controlled by left and right movement of the mouse,
 the eye on the head of Fish Zen Master follows the movemennt of the mouse,
 clicking displays the line: "Be As Water My Friend."
 */


void setup() 
{
  //Setting the canvas size
  size(400, 400);
  smooth();
  //60fps limit
  frameRate(60);
}

void draw() 
{
  
  //background code
  //pointer movement along y-axis will shift day to night
  //changing mouseY changes opacity
  background(251,170,160); //colour of dusk sky
  
  //as the pointer moves down and brings the sun down, night sets in
  fill(34,39,77,(mouseY)/1.5);
  rect(0,0,400,400);
  
  //moving the pointer up brings the sun up along with day
  //opacity changes with mouseY
  fill(136,207,251,350-(mouseY*2));
  rect(0,0,400,400);
  
  
  //Sun code - the Sun tracks the pointer position
  //Sun's center is (200,140)
  noStroke();
  fill(255,231,109);
  ellipse(200,140+mouseY,280,280);
  
  /////Twinkling stars/////
  //Stars twinkle and fade in/out based on mouseY
  //mouseY divided by 2 then subtracted by various integers for a smooth fade when mouseY passes the midpoint to match sunset
  //opacity is calculated using sin and framecount to achieve a non-uniform, pulsing effect
  //these are multiplied together to ensure that the stars cannot apppear or twinkle during the daytime
  //framecount is multiplied by small fractions to result in dynamic twinkling
  //different variants used to avoid a boring, uniform night sky
  noStroke();
  fill(230,230,230,mouseY/2-35-60*sin(frameCount*0.05));
  ellipse(50,30,sin(frameCount*0.03)*3,12);
  ellipse(50,30,12,sin(frameCount*0.03)*3);
  ellipse(330,190,sin(frameCount*0.03)*3,10);
  ellipse(330,190,10,sin(frameCount*0.03)*3);
  ellipse(90,200,sin(frameCount*0.03)*3,4);
  ellipse(90,200,4,sin(frameCount*0.03)*3);
  
  fill(230,230,230,mouseY/2-30-90*sin(frameCount*0.01));
  ellipse(340,90,sin(frameCount*0.01)*2,5);
  ellipse(340,90,5,sin(frameCount*0.01)*2);
  ellipse(180,10,sin(frameCount*0.01)*2,14);
  ellipse(180,10,14,sin(frameCount*0.01)*2);
  ellipse(30,95,sin(frameCount*0.01)*2,9);
  ellipse(30,95,9,sin(frameCount*0.01)*2);
  
  fill(230,230,230,mouseY/2-30-70*sin(frameCount*0.03));
  ellipse(50,180,sin(frameCount*0.02)*2,8);
  ellipse(50,180,8,sin(frameCount*0.02)*2);
  ellipse(110,80,sin(frameCount*0.02)*2,3);
  ellipse(110,80,3,sin(frameCount*0.02)*2);
  ellipse(300,80,sin(frameCount*0.02)*2,13);
  ellipse(300,80,13,sin(frameCount*0.02)*2);
  
  /////Static Stars/////
  //Simple rectangles to represent non-flickering stars
  fill(255,255,255,mouseY/2-45);
  rect(70,120,3,3,10);
  rect(350,20,4,4,10);
  rect(110,30,5,5,10);
  rect(370,140,3,3,10);
  rect(20,50,4,4,10);
  rect(40,60,2,2,10);
  rect(90,100,2,2,10);
  rect(200,30,2,2,10);
  rect(350,50,5,5,10);
  rect(75,150,3,3,10);
  rect(130,130,3,3,10);
  rect(280,50,3,3,10);
  rect(390,220,4,4,10);
  rect(50,70,3,3,10);
  rect(25,230,2,2,10);
  rect(45,150,2,2,10);
  rect(345,100,4,4,10);
  rect(320,130,2,2,10);
  rect(285,155,4,4,10);
  rect(245,125,3,3,10);
  
  //Cloud Code - clouds follow pointer's movement along the x-axis
  //different clouds move at different rates to illustrate depth
  //clouds are made up of clusters of different shapes and opacities
  //Cloud Cluster 1 - closest cluster moves the fastest
  noStroke();
  fill(255,110);
  rect(20+pmouseX,50,80,40,15);
  fill(255,90);
  rect(0+pmouseX,70,40,30,12);
  rect(50+pmouseX,30,50,40,15);
  fill(255,95);
  rect(70+pmouseX,70,60,30,12);
  
  //Cloud Cluster 2
  //These clouds are farther away so the 0.5 multiplier of the x-coordinate makes them move slower
  noStroke();
  fill(255,100);
  rect(210+(pmouseX*0.5),10,20,20,15);
  rect(250+(pmouseX*0.5),40,20,10,40);
  fill(255,110);
  rect(220+(pmouseX*0.5),20,50,20,12);

  //Cloud Cluster 3
  //These clouds are in the middle so a 0.7 multiplier is used
  noStroke();
  fill(255,110);
  rect(310+(pmouseX*0.7),110,70,30,15);
  fill(255,90);
  rect(370+(pmouseX*0.7),120,20,20,12);
  rect(340+(pmouseX*0.7),90,40,30,15);
  fill(255,95);
  rect(300+(pmouseX*0.7),130,50,20,12);
  
  //Water
  //sin function used to constantly translate the water creating the illusion of motion
  //Background water comes before the Zen Master in order to appear behind him
  //Foreground water will be added after Zen Master to create a perception of depth through parallax
  //Bakground Water (Rear)
  fill(15,86,48,230);
  beginShape();
  vertex(450,400);
  vertex(-50,400);
  curveVertex(-50,280+20*sin(frameCount*PI/50));
  curveVertex(-50,280+20*sin(frameCount*PI/50));
 
  curveVertex(-70,280+20*sin(frameCount*PI/50));
  curveVertex(-40,280+20*sin((frameCount+10)*PI/50));
  curveVertex(-10,280+20*sin((frameCount+20)*PI/50));
  curveVertex(20,280+20*sin((frameCount+30)*PI/50));
 
  curveVertex(50,280+20*sin((frameCount+40)*PI/50));
  curveVertex(80,280+20*sin((frameCount+50)*PI/50));
  curveVertex(110,280+20*sin((frameCount+60)*PI/50));
  curveVertex(140,280+20*sin((frameCount+70)*PI/50));
 
  curveVertex(170,280+20*sin((frameCount+80)*PI/50));
  curveVertex(200,280+20*sin((frameCount+90)*PI/50));
  curveVertex(230,280+20*sin(frameCount*PI/50));
  curveVertex(260,280+20*sin((frameCount+10)*PI/50));
 
  curveVertex(290,280+20*sin((frameCount+20)*PI/50));
  curveVertex(320,280+20*sin((frameCount+30)*PI/50));
  curveVertex(350,280+20*sin((frameCount+40)*PI/50));
  curveVertex(380,280+20*sin((frameCount+50)*PI/50));
 
  curveVertex(410,280+20*sin((frameCount+60)*PI/50));
  curveVertex(440,280+20*sin((frameCount+70)*PI/50));
  curveVertex(470,280+20*sin((frameCount+80)*PI/50));
  curveVertex(500,280+20*sin((frameCount+90)*PI/50));
  curveVertex(500,280+20*sin(frameCount*PI/50));
  curveVertex(500,280+20*sin((frameCount+10)*PI/50));
  vertex(500,300);
  vertex(500,400);
  
  endShape();
  
  //Background Water (Front)
  fill(43,139,87,200);
  beginShape();
  vertex(450,400);
  vertex(-50,400);
  curveVertex(-25,290+30*sin(frameCount*PI/30));
  curveVertex(-25,290+30*sin(frameCount*PI/30));
 
  curveVertex(-70,290+30*sin(frameCount*PI/30));
  curveVertex(-40,290+30*sin((frameCount+6)*PI/30));
  curveVertex(-10,290+30*sin((frameCount+12)*PI/30));
  curveVertex(20,290+30*sin((frameCount+18)*PI/30));
 
  curveVertex(50,290+30*sin((frameCount+24)*PI/30));
  curveVertex(80,290+30*sin((frameCount+30)*PI/30));
  curveVertex(110,290+30*sin((frameCount+36)*PI/30));
  curveVertex(140,290+30*sin((frameCount+42)*PI/30));
 
  curveVertex(170,290+30*sin((frameCount+48)*PI/30));
  curveVertex(200,290+30*sin((frameCount+54)*PI/30));
  curveVertex(230,290+30*sin(frameCount*PI/30));
  curveVertex(260,290+30*sin((frameCount+6)*PI/30));
 
  curveVertex(290,290+30*sin((frameCount+12)*PI/30));
  curveVertex(320,290+30*sin((frameCount+18)*PI/30));
  curveVertex(350,290+30*sin((frameCount+24)*PI/30));
  curveVertex(380,290+30*sin((frameCount+30)*PI/30));
 
  curveVertex(410,290+30*sin((frameCount+36)*PI/30));
  curveVertex(440,290+30*sin((frameCount+42)*PI/30));
  curveVertex(470,290+30*sin((frameCount+48)*PI/30));
  curveVertex(500,290+30*sin((frameCount+54)*PI/30));
  curveVertex(500,290+30*sin(frameCount*PI/30));
  curveVertex(500,290+30*sin((frameCount+6)*PI/30));
  vertex(500,300);
  vertex(500,400);
  
  endShape();
  


  ///Main Character///

  //Fish Zen Master's body
  //Fish Zen Master's body shape
  noStroke();
  ellipseMode(CENTER);

  //left hand
  noStroke();
  fill(#a7e7f0);
  ellipse(
  (float)(89+Math.sin(frameCount*.03-.05)*8),
  (float)(222+Math.cos(frameCount*.06-.09)*8),
  28, 28);
  //right hand
  ellipse(
  (float)(317+Math.sin(frameCount*.03-.05)*8), 
  (float)(221+Math.cos(frameCount*.06-.09)*8),
  28, 28);
  //fingers
  beginShape(LINES);
  stroke(#a7e7f0);
  strokeWeight(8);
  //left hand fingers
  vertex(
  (float)(85+Math.sin(frameCount*.03-.05)*8), 
  (float)(214+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(66+Math.sin(frameCount*.03-.05)*8),
  (float)(217+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(94+Math.sin(frameCount*.03-.05)*8), 
  (float)(231+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(82+Math.sin(frameCount*.03-.05)*8), 
  (float)(239+Math.cos(frameCount*.06-.09)*8));
  //right hand fingers
  vertex(
  (float)(315+Math.sin(frameCount*.03-.05)*8),
  (float)(214+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(338+Math.sin(frameCount*.03-.05)*8),
  (float)(217+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(306+Math.sin(frameCount*.03-.05)*8),
  (float)(231+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(318+Math.sin(frameCount*.03-.05)*8), 
  (float)(239+Math.cos(frameCount*.06-.09)*8));
  endShape();

  noStroke();//for the rest of the body
  //back robe
  fill(#4f6a9e);
  ellipse(
  (float)(160+Math.sin(frameCount*.03-.05)*8),
  (float)(290+Math.cos(frameCount*.06-.09)*8),
  90, 50);
  ellipse(
  (float)(240+Math.sin(frameCount*.03-.05)*8),
  (float)(290+Math.cos(frameCount*.06-.09)*8),
  90, 50);

  //center body
  fill(#8599cb);
  ellipse(
  (float)(200+Math.sin(frameCount*.03-.05)*8), 
  (float)(207+Math.cos(frameCount*.06-.09)*8), 
  115, 144);

  //robe
  fill(#8599cb);
  ellipse(
  (float)(200+Math.sin(frameCount*.03-.05)*8),
  (float)(266+Math.cos(frameCount*.06-.09)*8), 
  90, 110);
  //legs
  ellipse(
  (float)(200+Math.sin(frameCount*.03-.05)*8),
  (float)(262+Math.cos(frameCount*.06-.09)*8), 
  190, 80);

  //arms
  fill(#8599cb);
  //left top half arm
  beginShape(TRIANGLES);
  vertex(
  (float)(159+Math.sin(frameCount*.03-.05)*8),
  (float)(156+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(130+Math.sin(frameCount*.03-.05)*8), 
  (float)(194+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(158+Math.sin(frameCount*.03-.05)*8), 
  (float)(221+Math.cos(frameCount*.06-.09)*8));
  //right top half arm
  vertex(
  (float)(241+Math.sin(frameCount*.03-.05)*8),
  (float)(156+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(270+Math.sin(frameCount*.03-.05)*8),
  (float)(194+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(242+Math.sin(frameCount*.03-.05)*8),
  (float)(221+Math.cos(frameCount*.06-.09)*8));
  endShape();

  //Fish Zen Master's neck
  noStroke();
  fill(#4f6a9e);
  triangle(
  (float)(181+Math.sin(frameCount*.03-.05)*8), 
  (float)(148+Math.cos(frameCount*.06-.09)*8), 
  (float)(219+Math.sin(frameCount*.03-.05)*8),
  (float)(148+Math.cos(frameCount*.06-.09)*8), 
  (float)(200+Math.sin(frameCount*.03-.05)*8),
  (float)(173+Math.cos(frameCount*.06-.09)*8));
  beginShape(LINES);
  stroke(#8a89c4);
  vertex(
  (float)(179+Math.sin(frameCount*.03-.05)*8),
  (float)(148+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(202+Math.sin(frameCount*.03-.05)*8),
  (float)(173+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(219+Math.sin(frameCount*.03-.05)*8),
  (float)(150+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(202+Math.sin(frameCount*.03-.05)*8),
  (float)(173+Math.cos(frameCount*.06-.09)*8));
  endShape();

  //Fish Zen Master's robe's detail outlines
  beginShape(LINES);
  strokeWeight(2);
  stroke(#5877b8);
  vertex(
  (float)(173+Math.sin(frameCount*.03-.05)*8),
  (float)(148+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(213+Math.sin(frameCount*.03-.05)*8), 
  (float)(190+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(228+Math.sin(frameCount*.03-.05)*8), 
  (float)(145+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(202+Math.sin(frameCount*.03-.05)*8),
  (float)(178+Math.cos(frameCount*.06-.09)*8));

  vertex(
  (float)(159+Math.sin(frameCount*.03-.05)*8),
  (float)(159+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(200+Math.sin(frameCount*.03-.05)*8),
  (float)(200+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(239+Math.sin(frameCount*.03-.05)*8), 
  (float)(156+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(213+Math.sin(frameCount*.03-.05)*8),
  (float)(190+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(241+Math.sin(frameCount*.03-.05)*8), 
  (float)(158+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(216+Math.sin(frameCount*.03-.05)*8),
  (float)(192+Math.cos(frameCount*.06-.09)*8));
  endShape();

  noFill();
  arc(
  (float)(181+Math.sin(frameCount*.03-.05)*8),
  (float)(214+Math.cos(frameCount*.06-.09)*8), 50,
  40, PI+HALF_PI+QUARTER_PI, TWO_PI+HALF_PI);
  arc(
  (float)(196+Math.sin(frameCount*.03-.05)*8),
  (float)(205+Math.cos(frameCount*.06-.09)*8),
  50,40, PI+HALF_PI+QUARTER_PI, TWO_PI+HALF_PI);
  
  //shadow on the body
  noStroke();
  fill(78,144,113,95-mouseY/2.5);
  ellipseMode(CENTER);
  ellipse(
  (float)(200+Math.sin(frameCount*.03-.04)*8),
  (float)(220+Math.cos(frameCount*.06-.09)*8),
  100,20);

  //belt
  noFill();
  strokeWeight(14);
  stroke(#171721);
  strokeCap(SQUARE);
  arc(
  (float)(200+Math.sin(frameCount*.03-.05)*8),
  (float)(140+Math.cos(frameCount*.06-.09)*8), 
  190, 180, 0+QUARTER_PI, PI-QUARTER_PI);

  //for rest of the lines
  strokeCap(ROUND);

  //bottom arms
  beginShape(QUADS);
  noStroke();
  fill(#8599cb);
  //left bottom half arm
  vertex(
  (float)(134+Math.sin(frameCount*.03-.05)*8),
  (float)(190+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(80+Math.sin(frameCount*.03-.05)*8),
  (float)(210+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(139+Math.sin(frameCount*.03-.05)*8), 
  (float)(290+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(150+Math.sin(frameCount*.03-.05)*8),
  (float)(200+Math.cos(frameCount*.06-.09)*8));
  //right bottom half arm
  vertex(
  (float)(266+Math.sin(frameCount*.03-.05)*8),
  (float)(190+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(328+Math.sin(frameCount*.03-.05)*8),
  (float)(210+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(261+Math.sin(frameCount*.03-.05)*8),
  (float)(290+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(250+Math.sin(frameCount*.03-.05)*8),
  (float)(200+Math.cos(frameCount*.06-.09)*8));
  endShape();

  //robe details
  beginShape(LINES);
  strokeWeight(2);
  stroke(#5877b8);
  vertex(
  (float)(149+Math.sin(frameCount*.03-.05)*8),
  (float)(199+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(146+Math.sin(frameCount*.03-.05)*8),
  (float)(231+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(254+Math.sin(frameCount*.03-.05)*8),
  (float)(231+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(251+Math.sin(frameCount*.03-.05)*8),
  (float)(199+Math.cos(frameCount*.06-.09)*8));
  
  //Fish Zen Master's fins
  noStroke();
  fill(#a7e7f0);
  ;
  beginShape(TRIANGLES);
  vertex(
  (float)(123+Math.sin(frameCount*.03-.05)*8),
  (float)(85+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(125+Math.sin(frameCount*.03-.05)*8),
  (float)(134+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(170+Math.sin(frameCount*.03-.05)*8),
  (float)(110+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(272+Math.sin(frameCount*.03-.05)*8),
  (float)(82+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(269+Math.sin(frameCount*.03-.05)*8), 
  (float)(134+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(224+Math.sin(frameCount*.03-.05)*8),
  (float)(108+Math.cos(frameCount*.06-.09)*8));
  endShape();

  ellipseMode(CENTER);  //Set ellipseMode to CENTER
  fill(#a7e7f0);  //Set fill to light blue colour
  ellipse(
  (float)(125+Math.sin(frameCount*.03-.05)*8),
  (float)(109+Math.cos(frameCount*.06-.09)*8),
  14, 46);
  ellipse(
  (float)(271+Math.sin(frameCount*.03-.05)*8),
  (float)(109+Math.cos(frameCount*.06-.09)*8), 
  12, 52);

  //the lines on the fins
  beginShape(LINES);
  strokeWeight(3);

  //left fin
  stroke(#668cb9);
  vertex(
  (float)(124+Math.sin(frameCount*.03-.05)*8),
  (float)(95+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(142+Math.sin(frameCount*.03-.05)*8),
  (float)(99+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(123+Math.sin(frameCount*.03-.05)*8),
  (float)(105+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(142+Math.sin(frameCount*.03-.05)*8),
  (float)(105+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(124+Math.sin(frameCount*.03-.05)*8),
  (float)(115+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(143+Math.sin(frameCount*.03-.05)*8),
  (float)(111+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(127+Math.sin(frameCount*.03-.05)*8),
  (float)(125+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(144+Math.sin(frameCount*.03-.05)*8),
  (float)(116+Math.cos(frameCount*.06-.09)*8));

  //right fin
  vertex(
  (float)(253+Math.sin(frameCount*.03-.05)*8),
  (float)(102+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(268+Math.sin(frameCount*.03-.05)*8),
  (float)(92+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(255+Math.sin(frameCount*.03-.05)*8),
  (float)(108+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(269+Math.sin(frameCount*.03-.05)*8),
  (float)(103+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(253+Math.sin(frameCount*.03-.05)*8),
  (float)(112+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(269+Math.sin(frameCount*.03-.05)*8),
  (float)(113+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(252+Math.sin(frameCount*.03-.05)*8), 
  (float)(117+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(267+Math.sin(frameCount*.03-.05)*8),
  (float)(124+Math.cos(frameCount*.06-.09)*8));
  endShape();


  //Overall shape of the Fish Zen Master's face
  noStroke();
  ellipseMode(CENTER);  //Set ellipseMode to CENTER
  fill(#a7e7f0);  //Set fill to light clue colour
  ellipse(
  (float)(200+Math.sin(frameCount*.03-.05)*8), 
  (float)(98+Math.cos(frameCount*.06-.09)*8), 
  125, 116);

  //Facial features of the Fish Zen Master
  //Eyes, eyebrows and nostrils
  noFill();
  strokeWeight(2);
  stroke(#171721);
  ellipseMode(CENTER);
  arc(
  (float)(172+Math.sin(frameCount*.03-.05)*8), 
  (float)(100+Math.cos(frameCount*.06-.09)*8), 
  24, 12, 0, PI);
  arc(
  (float)(226+Math.sin(frameCount*.03-.05)*8), 
  (float)(100+Math.cos(frameCount*.06-.09)*8), 
  24, 12, 0, PI);
  beginShape(LINES);
  vertex(
  (float)(182+Math.sin(frameCount*.03-.05)*8),
  (float)(92+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(181+Math.sin(frameCount*.03-.05)*8), 
  (float)(91+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(215+Math.sin(frameCount*.03-.05)*8),
  (float)(92+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(216+Math.sin(frameCount*.03-.05)*8), 
  (float)(91+Math.cos(frameCount*.06-.09)*8));
  
  //nostrils
  strokeWeight(3);
  vertex(
  (float)(194+Math.sin(frameCount*.03-.05)*8), 
  (float)(113+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(193+Math.sin(frameCount*.03-.05)*8), 
  (float)(112+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(205+Math.sin(frameCount*.03-.05)*8),
  (float)(112+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(204+Math.sin(frameCount*.03-.05)*8),
  (float)(113+Math.cos(frameCount*.06-.09)*8));
  
  //eyebrows
  strokeWeight(9);
  stroke(#224b75);
  vertex(
  (float)(173+Math.sin(frameCount*.03-.05)*8),
  (float)(75+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(177+Math.sin(frameCount*.03-.05)*8),
  (float)(79+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(222+Math.sin(frameCount*.03-.05)*8),
  (float)(75+Math.cos(frameCount*.06-.09)*8));
  vertex(
  (float)(218+Math.sin(frameCount*.03-.05)*8),
  (float)(79+Math.cos(frameCount*.06-.09)*8));
  endShape();
  
  //mouth and chin
  strokeWeight(2);
  stroke(#171721);
  fill(#4376ad);
  rect(
  (float)(172+Math.sin(frameCount*.03-.05)*8),
  (float)(123+Math.cos(frameCount*.06-.09)*8),
  54, 12, 40);
  line(
  (float)(178+Math.sin(frameCount*.03-.05)*8),
  (float)(129+Math.cos(frameCount*.06-.09)*8),
  (float)(220+Math.sin(frameCount*.03-.05)*8),
  (float)(129+Math.cos(frameCount*.06-.09)*8));
  ellipseMode(CENTER);
  noFill();
  arc(
  (float)(204+Math.sin(frameCount*.03-.05)*8),
  (float)(150+Math.cos(frameCount*.06-.09)*8),
  20,16, PI+QUARTER_PI, PI+HALF_PI);
  //eye on forehead
  //the pupil of the eye follows the direction of the pointer
  strokeWeight(2);
  stroke(#171721);
  ellipseMode(CENTER);
  fill(#f3f0fa);
  ellipse(
  (float)(198+Math.sin(frameCount*.03-.05)*8),
  (float)(58+Math.cos(frameCount*.06-.09)*8),
  30,16);
  //pupil
  //moves with the mouse
  fill(#171721);
  ellipse(
  (float)(194+mouseX*0.02+Math.sin(frameCount*.03-.05)*8),
  (float)(56+mouseY*0.015+Math.cos(frameCount*.06-.09)*8)
  , 15, 8);
  stroke(#f3f0fa);
  strokeWeight(5);
  point(
  (float)(191+mouseX*0.02+Math.sin(frameCount*.03-.05)*8),
  (float)(54+mouseY*0.015+Math.cos(frameCount*.06-.09)*8));
  
  noStroke();
  fill(85,186,132,180);
  beginShape();
  vertex(450,400);
  vertex(-50,400);
  curveVertex(-25,300+30*sin(frameCount*PI/30));
  curveVertex(-25,300+30*sin(frameCount*PI/30));
 
  curveVertex(-70,300+30*sin(frameCount*PI/30));
  curveVertex(-40,300+30*sin((frameCount+6)*PI/30));
  curveVertex(-10,300+30*sin((frameCount+12)*PI/30));
  curveVertex(20,300+30*sin((frameCount+18)*PI/30));
 
  curveVertex(50,300+30*sin((frameCount+24)*PI/30));
  curveVertex(80,300+30*sin((frameCount+30)*PI/30));
  curveVertex(110,300+30*sin((frameCount+36)*PI/30));
  curveVertex(140,300+30*sin((frameCount+42)*PI/30));
 
  curveVertex(170,300+30*sin((frameCount+48)*PI/30));
  curveVertex(200,300+30*sin((frameCount+54)*PI/30));
  curveVertex(230,300+30*sin(frameCount*PI/30));
  curveVertex(260,300+30*sin((frameCount+6)*PI/30));
 
  curveVertex(290,300+30*sin((frameCount+12)*PI/30));
  curveVertex(320,300+30*sin((frameCount+18)*PI/30));
  curveVertex(350,300+30*sin((frameCount+24)*PI/30));
  curveVertex(380,300+30*sin((frameCount+30)*PI/30));
 
  curveVertex(410,300+30*sin((frameCount+36)*PI/30));
  curveVertex(440,300+30*sin((frameCount+42)*PI/30));
  curveVertex(470,300+30*sin((frameCount+48)*PI/30));
  curveVertex(500,300+30*sin((frameCount+54)*PI/30));
  curveVertex(500,300+30*sin(frameCount*PI/30));
  curveVertex(500,300+30*sin((frameCount+6)*PI/30));
  vertex(500,300);
  vertex(500,400);
  
  endShape();
  
  fill(153,235,191,140);
  beginShape();
  vertex(450,400);
  vertex(-50,400);
  curveVertex(-50,325+20*sin(frameCount*PI/50));
  curveVertex(-50,325+20*sin(frameCount*PI/50));
 
  curveVertex(-70,325+20*sin(frameCount*PI/50));
  curveVertex(-40,325+20*sin((frameCount+10)*PI/50));
  curveVertex(-10,325+20*sin((frameCount+20)*PI/50));
  curveVertex(20,325+20*sin((frameCount+30)*PI/50));
 
  curveVertex(50,325+20*sin((frameCount+40)*PI/50));
  curveVertex(80,325+20*sin((frameCount+50)*PI/50));
  curveVertex(110,325+20*sin((frameCount+60)*PI/50));
  curveVertex(140,325+20*sin((frameCount+70)*PI/50));
 
  curveVertex(170,325+20*sin((frameCount+80)*PI/50));
  curveVertex(200,325+20*sin((frameCount+90)*PI/50));
  curveVertex(230,325+20*sin(frameCount*PI/50));
  curveVertex(260,325+20*sin((frameCount+10)*PI/50));
 
  curveVertex(290,325+20*sin((frameCount+20)*PI/50));
  curveVertex(320,325+20*sin((frameCount+30)*PI/50));
  curveVertex(350,325+20*sin((frameCount+40)*PI/50));
  curveVertex(380,325+20*sin((frameCount+50)*PI/50));
 
  curveVertex(410,325+20*sin((frameCount+60)*PI/50));
  curveVertex(440,325+20*sin((frameCount+70)*PI/50));
  curveVertex(470,325+20*sin((frameCount+80)*PI/50));
  curveVertex(500,325+20*sin((frameCount+90)*PI/50));
  curveVertex(500,325+20*sin(frameCount*PI/50));
  curveVertex(500,325+20*sin((frameCount+10)*PI/50));
  vertex(500,300);
  vertex(500,400);
  
  endShape();

  ///Shadow///

  //Creates a filter that covers the whole animation to create a consistent feeling of night
  //turns dark purple at night
  noStroke();
  fill(34,39,77,mouseY/2-70);
  rect(0,0,400,400);

  //shadow on the face and body
  noStroke();
  //Set ellipseMode to CENTER
  ellipseMode(CENTER);  
  fill(78,144,113,95-mouseY/2.5); 
  ellipse(
  (float)(200+Math.sin(frameCount*.03-.04)*8), 
  (float)(110+Math.cos(frameCount*.06-.09)*8), 
  110, 90);
  

  
}

void mousePressed()                                       
{
  println("'be as water my friend...' ");
}
