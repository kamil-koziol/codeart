public class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  float maxspeed;
  
  public Particle() {
    this.pos = new PVector(random(width), random(height));
    this.vel = new PVector(0,0);
    this.acc = new PVector(0,0);
    this.maxspeed = random(1, 2);
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
        point(this.pos.x, this.pos.y);
    }
    
    void edges()
    {
        if(this.pos.x >= width) {
            this.pos.x = 1;
        }
        else if(this.pos.x < 0) {
            this.pos.x = width - 1;
        } 

        if(this.pos.y >= height) {
            this.pos.y = 1;
        } 
        else if(this.pos.y < 0) {
            this.pos.y = height - 1;
        }


    }

    void follow(PVector[][] vectors)
    {
        int x = floor(this.pos.x / scl);
        int y = floor(this.pos.y / scl);
        this.applyForce(vectors[y][x]);
    }
}
