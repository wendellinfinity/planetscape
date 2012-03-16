float BGCOLOR = 20;
int SEED;
int MAXROCKSPERTICK = 2;
int ROCKSIZE = 10;
int ROCKSPEED = 2;
int SPACEWIDTH = 300;
int SPACEHEIGHT = 500;
// Space container
Space space;
EscapePod ship;
// http://images-1.findicons.com/files/icons/1620/crystal_project/128/kspaceduel.png
String shipImage = "kspaceduel.png";

// this is run when the app starts
void setup() {
  // this is the size of the canvas
  size(SPACEWIDTH, SPACEHEIGHT);
  frameRate(60);
  colorMode(HSB, 100);
  smooth();
  noStroke();
  // initialize the Space
  space=new Space();
  // let us add a single rock
  space.addDebris(new Debris(getRandomStart()));
}

PVector getRandomStart() {
  return(new PVector(random(1, 30)*10, -100));
}

// this is the main program loop
void draw() {
  // this also clears the space for re-renderings
  background(0, 0, BGCOLOR);
  // render the space
  space.render();
}

class EscapePod {
  PVector location;
  PImage shipSprite;
  PVector shipVector;

  EscapePod() {
    shipSprite = loadImage(shipImage);
    shipVector = new PVector(SPACEWIDTH/2-shipSprite.width/2, SPACEHEIGHT - 150);
  }

  void display() {
    image(shipSprite, shipVector.x, shipVector.y);
  }
}

// the Space class contains everything
class Space {
  // contains all debris in space
  ArrayList debris;
  EscapePod escapePod;
  // constructor
  Space() {
    debris=new ArrayList();
    escapePod=new EscapePod();;
  }
  // adds a new debris to the space
  void addDebris(Debris deb) {
    debris.add(deb);
  }
  // draw everything in space
  void render() {
    float debcount;
    // generate up 2 rocks at a time
    debcount=random(0, MAXROCKSPERTICK);
    if (debcount > 0) {
      for (int i=1;i<=debcount;i++) {
        space.addDebris(new Debris(getRandomStart()));
      }
    }
    for (int i=0;i < debris.size();i++) {
      Debris d = (Debris)debris.get(i);
      if (d.location.y > SPACEHEIGHT + 100) {
        // destroy the rock
        debris.remove(i);
      } 
      else {
        // display the rock
        d.display();
      }
    }
    escapePod.display();
    //println("rock count: "+debris.size());
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
    // everytime i am displayed, i move
    location.y+=ROCKSPEED;
    // set the color of this debris
    fill(0, 150, 150);
    // draw an ellipse
    ellipse(location.x, location.y, ROCKSIZE, ROCKSIZE);
  }
}

