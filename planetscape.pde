float BGCOLOR = 190;
// Space container
Space space;

// this is run when the app starts
void setup() {
  // this is the size of the canvas
  size(300, 500);
  // initialize the Space
  space=new Space();
  // let us add a single rock
  space.addDebris(new Debris(new PVector(50,50)));
}

// this is the main program loop
void draw() {
  background(0, 0, BGCOLOR);
  // render the space
  space.render();  
}

// the Space class contains everything
class Space {
  // contains all debris in space
  ArrayList debris;
  // constructor
  Space() {
    debris=new ArrayList();
  }
  // adds a new debris to the space
  void addDebris(Debris deb) {
    debris.add(deb);
  }
  // draw everything in space
  void render() {
    for(int i=0;i < debris.size();i++) {
      Debris d = (Debris)debris.get(i);
      d.display();
    }
  }
  
}

// class for a single debris in space
class Debris {
  // this is the current location of the debris
  PVector location;
  // this is the constructor
  Debris(PVector initloc) {
    location=initloc;
  }
  // display method
  void display() {
    // set the color of this debris
    fill(0,255,0);
    // draw an ellipse
    ellipse(location.x, location.y, 100, 100);
  }
}

