public class Complex {
    double real;   // the real part
    double img;   // the imaginary part

    public Complex(double real, double img) {
        this.real = real;
        this.img = img;
    }

    public void multi(Complex b) {
        double real = this.real * b.real - this.img * b.img;
        double img = this.real * b.img + this.img * b.real;
        this.real = real;
        this.img = img;
    }
    
    
    
    public void add(Complex b) {
        this.real += b.real;
        this.img += b.img;
    }
}
