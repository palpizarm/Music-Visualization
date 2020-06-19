class Visualization {
  float[] x,y;
  float[] angle1, angle2;
  float transPos1, transPos2;
  
  
Visualization (float pTransPos1, float pTransPos2) {
    this.angle1 = new float[fft.specSize()];
    this.angle2 = new float[fft.specSize()];
    this.x = new float[fft.specSize()];;
    this.y = new float[fft.specSize()];
    this.transPos1 = pTransPos1;
    this.transPos2 = pTransPos2;
  }
  
  void update() {
    
     // big circle
    pushMatrix();
    translate(width/2, height/2);
    for (int i = 0; i < fft.specSize(); i++) {
      this.x[i] = fft.getFreq(i)/500;
      this.y[i] = this.y[i]+fft.getBand(i)/1000;
      this.angle1[i] = this.angle1[i] + fft.getFreq(i)/3000;
      
      rotateY(cos(this.angle1[i]/2));
      fill(fft.getFreq(i)*5, 55, fft.getBand(i)*5);
      pushMatrix();
      translate(this.x[i]+300,this.y[i]+50);
      rect(-fft.getBand(i)/50, -fft.getBand(i)/20,fft.getBand(i)/15,fft.getBand(i)/15);
      rect(-fft.getFreq(i)/5, -fft.getFreq(i)/5,fft.getFreq(i)/100,fft.getFreq(i)/20);
      popMatrix();  
    }
    popMatrix();
    
    
    // sphere 
    pushMatrix();
    translate(width/2, height/2,0);
    for (int index = 0; index < fft.specSize(); index++) {
      this.angle1[index] = this.angle1[index] + fft.getFreq(index)/2000;
      rotateX(sin(this.angle1[index]/5)/transPos1);
      rotateY(cos(this.angle1[index]/5)/transPos2);
      fill(20,255-fft.getFreq(index)*2,255-fft.getBand(index)*2);
      pushMatrix();
      translate((this.x[index]+this.transPos1),(this.y[index] + this.transPos2));
      box(fft.getFreq(index)/this.transPos1 + fft.getFreq(index)/transPos2);
      popMatrix();
      pushMatrix();
      translate((this.x[index]+this.transPos1),(this.y[index] - this.transPos2));
      box(fft.getFreq(index)/50 + fft.getFreq(index)/50);
      popMatrix();
      pushMatrix();
      translate((this.x[index]-this.transPos1),(this.y[index] + this.transPos2));
      box(fft.getFreq(index)/50 + fft.getFreq(index)/50);
      popMatrix();
      
    }
    popMatrix();
  }
}
