public class Particle {
  PVector pos;
  //PVector prevPos;
  PVector vel;
  PVector acc;
  int maxspeed;
  
  public Particle() {
    this.pos = new PVector(random(width), random(height));
    //this.prevPos = this.pos.copy();
    this.vel = new PVector(0,0);
    this.acc = new PVector(0,0);
    this.maxspeed = 2;
  }
  
  
  void update()
    {
        this.vel.add(this.acc);
        this.vel.limit(this.maxspeed);
        this.pos.add(this.vel);
        this.acc.mult(0);
    }
    
    void applyForce(PVector force)
    {
        this.acc.add(force);
    }

    void show()
    {
        int h = floor(map(this.pos.x, 0, width, 135, 360));
        stroke(this.pos.x % 360, 70, 90, 20);
        //line(this.pos.x, this.pos.y, this.prevPos.x, this.prevPos.y);
        point(this.pos.x, this.pos.y);
        //this.updatePrev();
    }

    void updatePrev()
    {
        //this.prevPos.x = this.pos.x;
        //this.prevPos.y = this.pos.y;
    }
    
    void edges()
    {
        if(this.pos.x >= width) {
            this.pos.x = 0;
            //this.updatePrev();
        }
        if(this.pos.x < 0) {
            this.pos.x = width - 1;
            //this.updatePrev();
        } 
        if(this.pos.y >= height) {
            this.pos.y = 0;
            //this.updatePrev();
        } 
        if(this.pos.y < 0) {
            this.pos.y = height - 1;
            //this.updatePrev();
        }


    }

    void follow(PVector[][] vectors)
    {
        int x = floor(this.pos.x / scl);
        int y = floor(this.pos.y / scl);

        PVector force = vectors[y][x];
        this.applyForce(force);
    }
}
