Minim minim;
AudioPlayer song;
AudioMetaData data;
BeatDetect beat;
FFT fft;

Button buttonPause, buttonMusic;
float bgColor = 10;
MenuBar menu;
Menu songItem;
MenuItem loadSong;
Visualization animation;


void setup() {
  size(1080,720,P3D);
  surface.setTitle("Music Arts");
  surface.setResizable(false);
  background(bgColor);
  minim = new Minim(this);
  
  // create a buttons
  buttonPause = new Button(loadImage("pause.png"), loadImage("pause.png"), new PVector(50,height-100),40);
  buttonMusic = new Button(loadImage("music.png"),loadImage("music.png"),new PVector(50,50),40); //<>// //<>//
}

void draw() {
  background(10);
  buttonPause.updateMouseIn();
  buttonMusic.updateMouseIn();
  // progress line
  stroke( 100, 100 ,100);
  fill(255);
  line( 200, height - 100, width-200, height - 100);

  if (song != null) {
     fft.forward(song.mix);
     beat.detect(song.mix);
     noStroke();
     
     // render the visualization
     animation.update();
     
     // time
     textSize(18);
     fill(255);
     text(
      TimeToString(song.length()),
      width-100, height - 100    
     );
  }
}


void mousePressed() {
  if (song != null) {
    if (buttonPause.MouseInside() && song.isPlaying()) {
      buttonPause.setImage(loadImage("play.png"),loadImage("play.png"));
      song.pause();
    } else {
      buttonPause.setImage(loadImage("pause.png"), loadImage("pause.png"));
      song.play();
    }
    buttonPause.updateMouseIn();
  }
  if (buttonMusic.MouseInside()) {
    if (song != null) {
      if (song.isPlaying()) {
        song.pause();
      }
    }
    noLoop();
    selectInput("Select a song", "selectSong"); 
    buttonMusic.updateMouseIn();
  }
}


void keyPressed() {
  if (keyCode == 32) {
    if (song != null && buttonPause.MouseInside()) {
      if (song.isPlaying()) {
        buttonPause.setImage(loadImage("play.png"),loadImage("play.png"));
        song.pause();
      } else {
        buttonPause.setImage(loadImage("pause.png"), loadImage("pause.png"));
        song.play();
      }
      buttonPause.updateMouseIn();
    }
  }
  else if (keyCode == 77) {
    if (song != null) {
      if (song.isPlaying()) {
        song.pause();
      } 
    }
    noLoop();
    selectInput("Select a song", "selectSong");
    buttonMusic.updateMouseIn();
  }
}


void selectSong(File selection) {
  if (selection != null) {
    song = minim.loadFile(selection.getAbsolutePath());
    data = song.getMetaData();
    fft = new FFT(song.bufferSize(),song.sampleRate());
    beat = new BeatDetect(song.bufferSize(),song.sampleRate());
    beat.setSensitivity(100);
    
    animation = new Visualization(50,50);    
  }
  song.play();
  loop();
}


void stop() {
  song.close();
  minim.stop();
  super.stop();
}
