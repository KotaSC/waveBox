class FibonacciSphere {
  float radius;
  int numPoints;
  PVector[] pts;

  float delta;
  float deltaZ;
  float goldeAngle = PI*(3-sqrt(5));

  FibonacciSphere(float _radius, int _numPoints) {
    radius    = _radius;
    numPoints = _numPoints;
    pts       = new PVector[numPoints];

    delta = radius*0.001;
    deltaZ = (2*radius - 2*delta)/(numPoints-1);

    setPoints();
  } 

  void setPoints() {
    float z = -radius + delta;
    float phai = 0.0;

    for (int  i = 0; i < numPoints; i++) {
      float theta = acos(z/radius);

      float r = radius*(sin(theta));

      float x = r*cos(phai);
      float y = r*sin(phai);
      pts[i] = new PVector(x, y, z);

      z += deltaZ;
      phai += goldeAngle;
    }
  }

  void setNoisePoints() {
    float z    = -radius + delta;
    float phai = 0.0;

    for (int  i = 0; i < numPoints; i++) {
      float theta = acos(z/radius);

      float noiseValue = noise(0.9*theta+0.01*(float)frameCount%100);
      float r          = radius*(sin(theta)+map(noiseValue, 0, 1, -1, 2));

      float x = r*cos(phai);
      float y = r*sin(phai);
      pts[i]  = new PVector(x, y, z);

      z    += deltaZ;
      phai += goldeAngle;
    }
  }
  
  void render(){

    stroke(0, 100, 200);
    strokeWeight(1);

    for(int i = 0; i < numPoints; i++){

      box(pts[i].x, pts[i].y, pts[i].z);
    }
  }
}