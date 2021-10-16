class Food {
    constructor() {
        this.pickLocation();
    }

    pickLocation() {
        this.x = floor(random(cols)) * scl;
        this.y = floor(random(rows)) * scl;
    }

    show() {
        fill(100,0,255);
        rect(this.x, this.y, scl, scl);
    }
}