// Rainbow_Theremin
// Demonstrates understanding of sound implementation and classes in Processing
// by Nick B.
// 11/01/2018
//copyright Nick B.
import processing.sound.*;
import de.voidplus.leapmotion.*; 
LeapMotion leap;
Theremin rainbowTheremin;

ArrayList<PVector> points; 
PVector fp;

TriOsc tri;
SinOsc sin;
SqrOsc sqr;
SawOsc saw;

void setup () {
  
  size(640,800);
  
  leap = new LeapMotion(this);
  points = new ArrayList<PVector>();  // Create an empty ArrayList
  
  tri = new TriOsc(this);    
  sin = new SinOsc(this);
  sqr = new SqrOsc(this);
  saw = new SawOsc(this);
    
  rainbowTheremin = new Theremin(tri, sin, sqr, saw);
  
}

void draw() {
  
  rainbowTheremin.clickSwitch();
  rainbowTheremin.setPitch();
  rainbowTheremin.switchSound();
  rainbowTheremin.detectHand();
  
}
