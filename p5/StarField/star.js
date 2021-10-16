class Star {
    constructor() {
        this.x = random(-width/2,width/2);
        this.y = random(-height/2,height/2);
        this.z = width;
        this.speed = random(4,10);
    }

    update() {
        this.z -= this.speed;
        
        if (this.z < 1) {
            this.z = width;
        }
    }

    show() {
        var sx = map(this.x / this.z, -1, 1, -width/2, width/2);
        var sy = map(this.y / this.z, -1, 1, -height/2, height/2);
        var sr = map(this.z, 0, width, 16, 0);
        noStroke();
        fill(255);
        ellipse(sx, sy, sr);
    }
}