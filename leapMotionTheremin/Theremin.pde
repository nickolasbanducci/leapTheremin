class Theremin {
  
float freq;
float amp;
int sound;

PImage square;
PImage tinySaw; //credit: KissClipArt
PImage sign;
PImage triforce; // credit: Hojo Clan?

Theremin (TriOsc tri_g, SinOsc sin_g, SqrOsc sqr_g, SawOsc saw_g) {
  
  setPitch();
  switchSound();
  mousePressed();
  
  sound = 1;

  tri = tri_g;
  sin = sin_g;
  sqr = sqr_g;
  saw = saw_g;
  
  square = loadImage ("square.png");
  tinySaw = loadImage ("tinySaw.png");
  sign = loadImage ("sign.png");
  triforce = loadImage ("triforce.png");
  
}

  void detectHand () {
    
    for (Hand hand : leap.getHands()) {

      fp   = hand.getPosition(); 
      if (fp.z <= 30) {
       points = new ArrayList<PVector>();
      }
 
      else if (fp.z > 30) {
       points.add(new PVector(fp.x, fp.y));
      }
    }
  }
  
  void setPitch () {
  
    for (int i = points.size()-1; i >= 0; i--) {
    PVector p = points.get(i);
    amp = map(width-p.x, 0, width, 1, .01);
    freq = map(height-p.y, 0, height, 40, 880);
    }
    // To match the colors with the moaods of the pitches
    //background((fp.x)/2.5,(width-fp.x)/3,fp.y-(height/3.5));
  
    //"loop antenna", aka "the left one that controls volume"
    
  
    //"upright antenna", aka "the right one that controls pitch"
    
    
  }

  void switchSound () {
 
    switch (sound) {
  
    case 0:
    println("It's dead, Jim.");
    break;
    
    case 1:
    tri.freq(freq);
    tri.amp(amp);
    tri.play();
    cursor(triforce);
    break;
    
    case 2:
    sqr.play();
    sqr.freq(freq);
    sqr.amp(amp);
    cursor(square);
    break;
    
    case 3:
    saw.play();
    saw.freq(freq);
    saw.amp(amp);
    cursor(tinySaw);
    break;
  
    case 4:
    sin.play();
    sin.freq(freq);
    sin.amp(amp);
    cursor(sign);
    break;
    
    case 5:
    exit();   
    
    }
  }

  void clickSwitch() {
   
    if (keyPressed) {
     
      if (key == 'w' || key == 'W') {
          sound = 1;
          sqr.stop();
          saw.stop();
          sin.stop();
      }
 
      if (key == 'a' || key == 'A') {
          sound = 2;
          tri.stop();
          saw.stop();
          sin.stop();
      }
 
      if (key == 's' || key == 'S') {
          sound = 3;
          tri.stop();
          sqr.stop();
          sin.stop();
      }

      if (key == 'd' || key == 'D') {
          sound = 4;
          tri.stop();
          saw.stop();
          sqr.stop();   
      }
    }
  }
}
