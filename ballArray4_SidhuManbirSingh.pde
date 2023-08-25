// Simple bouncing ball class
//You must change followings from the original 
//example;
//a) Minimum two color for different objects
//b) Starting position 
//c) Number of objects on each mouse click
//d) Speed
//e) Movement behavior (linear + dynamic)
//f) Add two more 2D primitives

class Ball {
  
  float x;
  float y;
  float speed;
  float gravity;
  float w;
  float life = 400;
  float backLife = 0;  
  
  Ball(float tempX, float tempY, float tempW, float speed, float gravity) {
    x = tempX;
    y = tempY;
    w = tempW;
    this.speed = speed;
    this.speed *= 0.1; 
    this.gravity = gravity;
  }
  
    void move() {

    
    speed = speed + gravity;
      y = y + speed;
     if (y > height) {
      speed = speed * -0.9;
      y = height;
    }
  }
  
  boolean finished() {
    life = life-1;
    backLife += 3 ;
    if (life < 0 && backLife > 256) {
      return true;
    } else {
      return false;
    }
  }
  
  void display() {
   
    fill(backLife,256,life);

    ellipse(x,y,w,w);
  }
}  
 
ArrayList<Ball> balls;
int ballWidth = 50;

void setup() {
  size(1080, 480);
  noStroke();

  // Create an empty ArrayList (will store Ball objects)
  balls = new ArrayList<Ball>();
  
  // Start by adding one element
  balls.add(new Ball(width/2, 2, ballWidth,1,0.1));
  balls.add(new Ball(width*0.3, 2, ballWidth,1.5,0.5));
  balls.add(new Ball(width*0.7, 2, ballWidth,2,0.5));
  balls.add(new Ball(width*0.9, 2, ballWidth,1.5,0.7));
  balls.add(new Ball(width*0.1, 2, ballWidth,1,1.5));



}

void draw() {
  background(65, 105, 225);

  for (int i = balls.size()-1; i >= 0; i--) { 
    Ball ball = balls.get(i);
    ball.move();
    ball.display();
    if (ball.finished()) {
      balls.remove(i);
    }
    
  }  
  
}

void mousePressed() {
  balls.add(new Ball(mouseX, mouseY, ballWidth,5,0.7));
  balls.add(new Ball( mouseX , mouseY, mouseY,5,0.9));
}
