class Button {
   PVector position;
   PImage imageIn;
   PImage imageOut;
   color background;
   float radious;
   
   
   Button (PImage pImageIn, PImage pImageOut, PVector pPosition, float  pRadious) {
     this.imageIn = pImageIn;
     this.imageOut = pImageOut;
     this.position = pPosition;
     this.radious = pRadious;
     this.imageOut.resize(40,40);
     this.imageIn.resize(50,50);
     imageMode(CENTER);
   }
   
   boolean MouseInside() {
     return dist(this.position.x,this.position.y, mouseX, mouseY) < radious;
   }
   
   void setImage(PImage pImageIn, PImage pImageOut) {
     this.imageIn = pImageIn;
     this.imageOut = pImageOut;
     imageMode(CENTER);
     this.imageIn.resize(40,40);
     this.imageOut.resize(50,50);
   }
   
   void updateMouseIn() {
     fill(bgColor);
     rectMode(CENTER);
     rect(this.position.x,this.position.y, radious*1.3,radious*1.3);
     if (dist(this.position.x,this.position.y, mouseX, mouseY) < radious) {
       image(this.imageIn, this.position.x, this.position.y);
     } else { 
       image(this.imageOut, this.position.x, this.position.y);
     }
   }
}
