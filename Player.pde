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


void setup() {
  size(displayWidth,displayHeight,P3D);
  surface.setTitle("Music Arts");
  surface.setResizable(false);
  minim = new Minim(this);
}

void draw() {
  
}
