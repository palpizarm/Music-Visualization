

Minim minim;
AudioPlayer song;
AudioMetaData data;
BeatDetect beat;
FFT fft;

Button buttonPause;
float bgColor = 10;
MenuBar menu;
Menu songItem;
MenuItem loadSong;


void setup() {
  size(displayWidth,displayHeight);
  surface.setTitle("Music Arts");
  surface.setResizable(false);
  background(bgColor);
  minim = new Minim(this);
  
  // create a buttons
  buttonPause = new Button(loadImage("pauseMIn.png"), loadImage("pauseMOut.png"), new PVector(50,height-100),40);
  
  // add menu bar
  menu = new MenuBar(); //<>//
  songItem = new Menu("Song");
  loadSong = new MenuItem("Search Song");
  loadSong.addActionListener(new ActionListener() {
    public void actionPerformed(ActionEvent e) {
      noLoop();
      selectInput("Select a song", "selectSong");
      loop();  
    }
  });
  songItem.add(loadSong);
  menu.add(songItem);
  PSurfaceAWT awtSurface = (PSurfaceAWT)surface;
  PSurfaceAWT.SmoothCanvas smoothCanvas = (PSurfaceAWT.SmoothCanvas)awtSurface.getNative();
  smoothCanvas.getFrame().setMenuBar(menu);
}

void draw() {
}


void mousePressed() {
  if (song != null) {
    if (buttonPause.MouseInside() && song.isPlaying()) {
      buttonPause.setImage(loadImage("playMIn.png"),loadImage("playMOut.png"));
      song.pause();
    } else {
      buttonPause.setImage(loadImage("pauseMIn.png"), loadImage("pauseMOut.png"));
      song.play();
    }
    buttonPause.updateMouseIn();
  }
}

void mouseMoved() {
  buttonPause.updateMouseIn();
}

void selectSong(File selection) {
  if (selection != null) {
    song = minim.loadFile(selection.getAbsolutePath());
    data = song.getMetaData();
    fft = new FFT(song.bufferSize(),song.sampleRate());
    beat = new BeatDetect(song.bufferSize(),song.sampleRate());
    beat.setSensitivity(5);
    song.play();
    print("beat beat");
  }
}
