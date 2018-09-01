FibonacciSphere fs;
float rotAngle = 0.0;

boolean noiseStart = false;

void setup() {
  
  fullScreen(P3D);
  noCursor();
  camera(100, 300, 100, 0, 0, 0, 0, 0, 1);
  fs = new FibonacciSphere(150, 70);
  
}

void draw() {
  background(0);
  
  blendMode(ADD);
  if(noiseStart) fs.setNoisePoints();
  rotateX(0.9);
  rotateZ(rotAngle);
  fs.render();
  rotAngle += 0.005;
}

void mousePressed(){
  noiseStart = !noiseStart;
  if(!noiseStart) fs.setPoints();
}