class Visualization {
  float[] x,y;
  float[] angle1, angle2;
  float transPos1, transPos2, zTransPos;
  
  
Visualization (float pTransPos1, float pTransPos2, float pZTransPos) {
    this.angle1 = new float[fft.specSize()];
    this.angle2 = new float[fft.specSize()];
    this.x = new float[fft.specSize()];;
    this.y = new float[fft.specSize()];
    this.transPos1 = pTransPos1;
    this.transPos2 = pTransPos2;
    this.zTransPos = pZTransPos;
  }
  
  void update() {
    /*
    // beat meter
    colorMode(HSB, 360, 100, 100);
    pushMatrix();
    translate(width*.50, height*.30, 0);
    int r = 225;
    float r2;
    for (int i = 0; i < 360; ++i) {
      int j = round(map(i, 0, 360, 50, fft.specSize()/3));
      r2 = min(226 + fft.getBand(j)*2, 275);
      float xbar = r * cos(radians(i));
      float xbar2 = r2 * cos(radians(i));
      float ybar = r * sin(radians(i));
      float ybar2 = r2 * sin(radians(i));
      stroke(i, 100, 100);
      line(ybar, -xbar, ybar2, -xbar2);
    }
    popMatrix();*/
    
    noStroke();
    colorMode(RGB,255,255,255);
    
     // big circle
    pushMatrix();
    translate(width/2, height-300, this.zTransPos);
    for (int i = 0; i < fft.specSize(); i++) {
      this.x[i] = fft.getFreq(i)/500;
      this.y[i] = this.y[i]+fft.getBand(i)/1000;
      this.angle1[i] = this.angle1[i] + fft.getFreq(i)/3000;
      rotateY(cos(this.angle1[i]/2));
      fill(fft.getFreq(i)*5, 55, fft.getBand(i)*5);
      pushMatrix();
      translate(this.x[i]+400,this.y[i]+50);
      // bars
      rect(-fft.getBand(i)/5, -fft.getBand(i)/5,fft.getBand(i)/5,fft.getBand(i)/5);
      // squares
      rect(-fft.getFreq(i)/2, -fft.getFreq(i)/2,fft.getFreq(i)/50,fft.getFreq(i)/10);
      popMatrix();  
    }
    popMatrix();
    
    // center sphere 
    pushMatrix();
    translate(width*.50, height*.25, this.zTransPos);
    for (int index = 0; index < fft.specSize(); index++) {
      this.angle1[index] = this.angle1[index] + fft.getFreq(index)/2000;
      rotateX(sin(this.angle1[index]/5)/transPos1);
      rotateY(cos(this.angle1[index]/5)/transPos2);
      fill(20,255-fft.getFreq(index)*2,255-fft.getBand(index)*2);
      pushMatrix();
      translate((this.x[index]+this.transPos1),(this.y[index] + this.transPos2));
      box(fft.getFreq(index)/75 + fft.getFreq(index)/75);
      popMatrix();
      pushMatrix();
      translate((this.x[index]+this.transPos1),(this.y[index] - this.transPos2));
      box(fft.getFreq(index)/50 + fft.getFreq(index)/50);
      popMatrix();
      fill(fft.getFreq(index)*5, 55, fft.getBand(index)*5);
      pushMatrix();
      translate((this.x[index]-this.transPos1),(this.y[index] + this.transPos2));
      box(fft.getFreq(index)/25 + fft.getFreq(index)/25);
      popMatrix();
      
    }
    popMatrix();

    // left sphere 
    pushMatrix();
    translate(width*.45, height*.35, this.zTransPos);
    for (int index = 0; index < fft.specSize(); index++) {
      this.angle1[index] = this.angle1[index] + fft.getFreq(index)/2000;
      rotateX(sin(this.angle1[index]/5)/transPos1);
      rotateY(cos(this.angle1[index]/5)/transPos2);
      fill(fft.getFreq(index)*80, 45, fft.getBand(index)*25);
      pushMatrix();
      translate((this.x[index]+this.transPos1+5),(this.y[index] + this.transPos2));
      box(fft.getFreq(index)/60 + fft.getFreq(index)/75);
      popMatrix();
      pushMatrix();
      translate((this.x[index]+this.transPos1),(this.y[index] - this.transPos2+5));
      box(fft.getFreq(index)/50 + fft.getFreq(index)/35);
      popMatrix();
      pushMatrix();
      translate((this.x[index]-this.transPos1),(this.y[index] + this.transPos2));
      box(fft.getFreq(index)/25 + fft.getFreq(index)/25);
      popMatrix();
      
    }
    popMatrix();
    
    // right sphere 
    pushMatrix();
    translate(width*.55, height*.35, this.zTransPos);
    for (int index = 0; index < fft.specSize(); index++) {
      this.angle1[index] = this.angle1[index] + fft.getFreq(index)/2000;
      rotateX(sin(this.angle1[index]/5)/transPos1);
      rotateY(cos(this.angle1[index]/5)/transPos2);
      fill(fft.getFreq(index)*35, 255, fft.getBand(index)*25);
      pushMatrix();
      translate((this.x[index] - this.transPos1),(this.y[index] - this.transPos2));
      box(fft.getFreq(index)/75 + fft.getFreq(index)/75);
      popMatrix();
      pushMatrix();
      translate((this.x[index] - this.transPos1),(this.y[index] + this.transPos2));
      box(fft.getFreq(index)/50 + fft.getFreq(index)/50);
      popMatrix();
      pushMatrix();
      translate((this.x[index] + this.transPos1 + 5),(this.y[index] + this.transPos2 + 5));
      box(fft.getFreq(index)/15 + fft.getFreq(index)/25);
      popMatrix();
      
    }
    popMatrix();
  }
}
