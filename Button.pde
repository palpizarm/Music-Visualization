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
     this.imageOut.resize((int)radious,(int)radious);
     this.imageIn.resize((int)radious+10,(int)radious+10);
     imageMode(CENTER);
   }
   
   boolean MouseInside() {
     return dist(this.position.x,this.position.y, mouseX, mouseY) < radious;
   }
   
   void setImage(PImage pImageIn, PImage pImageOut) {
     this.imageIn = pImageIn;
     this.imageOut = pImageOut;
     imageMode(CENTER);
     this.imageOut.resize((int)radious,(int)radious);
     this.imageIn.resize((int)radious+10,(int)radious+10);
   }
   
   void updateMouseIn() {
     fill(10);
     rectMode(CENTER);
     noStroke();
     rect(this.position.x,this.position.y,this.radious + 10,this.radious + 10);
     if (dist(this.position.x,this.position.y, mouseX, mouseY) < radious) {
       image(this.imageIn, this.position.x, this.position.y);
     } else { 
       image(this.imageOut, this.position.x, this.position.y);
     }
   }
}
