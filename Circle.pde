class Circle {
  float[] x,y;
  float[] angle1, angle2;
  float transPos1, transPos2;
  
  
  Circle(float pTransPos1, float pTransPos2) {
    this.angle1 = new float[fft.specSize()];
    this.angle2 = new float[fft.specSize()];
    this.x = new float[fft.specSize()];;
    this.y = new float[fft.specSize()];
    this.transPos1 = pTransPos1;
    this.transPos2 = pTransPos2;
  }
  
  void update() {
    noStroke();
    
    pushMatrix();
    translate(width/2, height/2,0);
    for (int index = 0; index < fft.specSize(); index++) {
      this.angle1[index] = this.angle1[index] + fft.getFreq(index)/2000;
      rotateX(sin(this.angle1[index]/5)/30);
      rotateY(cos(this.angle1[index]/5)/30);
      fill(20,255-fft.getFreq(index)*2,255-fft.getBand(index)*5);
      pushMatrix();
      translate((this.x[index]+this.transPos1),(this.x[index] + this.transPos2));
      box(fft.getFreq(index)/50 + fft.getFreq(index)/100);
      popMatrix();
    }
    popMatrix();
  }
}
