import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


Minim minim;
AudioPlayer song;
AudioMetaData data;
BeatDetect beat;
FFT fft;

Button buttonPause;
float bgColor = 10;


void setup() {
  size(displayWidth,displayHeight);
  surface.setTitle("Music Arts");
  surface.setResizable(false);
  background(bgColor);
  minim = new Minim(this);
  
  // create a buttons
  buttonPause = new Button(loadImage("pauseMIn.png"), loadImage("pauseMOut.png"), new PVector(50,height-100),40);
  
}

void draw() {
}


void mousePressed() {
  if (buttonPause.MouseInside()) {
    buttonPause.setImage(loadImage("playMIn.png"),loadImage("playMOut.png"));
    //song.pause();
  } else {
    buttonPause.setImage(loadImage("pause.png"), loadImage("pauseMOut.png"));
    //song.play();
  }
}

void mouseMoved() {
  buttonPause.updateMouseIn();
}
